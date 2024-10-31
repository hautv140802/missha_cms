import ButtonComponent from '@/components/common/Button';
import InputComponent from '@/components/common/Input';
import ReviewImage from '@/components/common/ReviewImage';
import UploadImageComponent from '@/components/common/UploadImage';
import useCreateProduct from '@/libs/axios/product/useCreateProduct';
import useUpdateProduct from '@/libs/axios/product/useUpdateProduct';
import { usePostUploadFile } from '@/libs/axios/upload/usePostUpload';
import { BaseData } from '@/types/base/baseData';
import { UploadLocalType } from '@/types/common/UploadLocalType';
import { ProductResponseType } from '@/types/response/product';
import { BASE_URL } from '@/utils/constants/base';
import formType from '@/utils/constants/formType';
import { UploadFile } from 'antd';
import { useEffect, useState } from 'react';
import { SubmitHandler, useForm } from 'react-hook-form';
import toast from 'react-hot-toast';

import { FormProductType } from '@/types/request/form/formProduct';
import PAGE_SIZE from '@/utils/constants/pageSize';
import { useFetchCategories } from '@/libs/swr/useFetchCategories';
import { useFetchProductLines } from '@/libs/swr/useFetchProductLines';
import { useFetchSkinProperties } from '@/libs/swr/useFetchSkinProperties';
import { DefaultOptionType } from 'antd/es/select';
import SelectComponent from '@/components/common/Select';
import { formatValue } from '@/utils/functions/formatValue';
import formValidation from '@/utils/constants/formValidation';
import ReactQuillComponent from '@/components/common/ReactQuill';
interface IProductFormProps {
  type: string;
  record?: BaseData<ProductResponseType>;
  onCloseModal?: () => void;
  openTime?: string;
  handleComplete?: () => void;
}
const ProductForm = (props: IProductFormProps) => {
  const { type, record, onCloseModal, openTime, handleComplete } = props;
  const [avatar, setAvatar] = useState<UploadLocalType>();
  const [gallery, setGallery] = useState<UploadLocalType[]>();
  const [galleryFileLists, setGalleryFileLists] = useState<UploadFile[]>();
  const [avatarFile, setAvatarFile] = useState<UploadFile>();
  const [currentCategories, setCurrentCategories] = useState<number>(1);
  const [currentProductLines, setCurrentProductLines] = useState<number>(1);
  const [currentSkinProperties, setCurrentSkinProperties] = useState<number>(1);
  const [optionCategories, setOptionCategories] = useState<DefaultOptionType[]>(
    []
  );
  const [optionProductLines, setOptionProductLines] = useState<
    DefaultOptionType[]
  >([]);
  const [optionSkinProperties, setOptionSkinProperties] = useState<
    DefaultOptionType[]
  >([]);

  const [description, setDescription] = useState<string>('');
  const isDisable = type === formType.FORM_VIEW;
  const [galleryIDs, setGalleryIDs] = useState<number[] | null>(null);
  const {
    control,
    handleSubmit,
    reset,
    formState: { errors },
  } = useForm<FormProductType>({
    mode: 'onChange',
  });

  const paramsCategories = {
    populate: 'deep, 2',
    'pagination[page]': currentCategories,
    'pagination[pageSize]': PAGE_SIZE,
    sort: 'id:desc',
  };
  const {
    data: dataCategories,
    isLoading: isLoadingCategories,
    isValidating: isValidatingCategories,
    pagination: paginationCategories,
  } = useFetchCategories(paramsCategories);

  const paramsProductLines = {
    populate: 'deep, 2',
    'pagination[page]': currentProductLines,
    'pagination[pageSize]': PAGE_SIZE,
    sort: 'id:desc',
  };

  const {
    data: dataProductLines,
    isLoading: isLoadingProductLines,
    isValidating: isValidatingProductLines,
    pagination: paginationProductLines,
  } = useFetchProductLines(paramsProductLines);

  const paramsSkinProperties = {
    populate: 'deep, 2',
    'pagination[page]': currentSkinProperties,
    'pagination[pageSize]': PAGE_SIZE,
    sort: 'id:desc',
  };
  const {
    data: dataSkinProperties,
    isLoading: isLoadingSkinProperties,
    isValidating: isValidatingSkinProperties,
    pagination: paginationSkinProperties,
  } = useFetchSkinProperties(paramsSkinProperties);

  useEffect(() => {
    setAvatar(undefined);
    setGallery(undefined);
    setOptionCategories([]);
    setOptionProductLines([]);
    setOptionSkinProperties([]);
    setGalleryIDs(
      record?.attributes?.gallery?.data?.map(item => item?.id) || null
    );
    reset({
      name: record?.attributes?.name,
      slug: record?.attributes?.slug,
      price: record?.attributes?.price,
      sale_price: record?.attributes?.price || 0,
      categories: record?.attributes?.categories?.data.map(
        category => category.id
      ),
      product_line: record?.attributes?.product_line?.data?.id,
      skin_properties: record?.attributes?.skin_properties?.data.map(
        skinProperty => skinProperty.id
      ),
      total_purchase: record?.attributes?.total_purchase || 0,
    });

    if (record?.attributes.avatar.data)
      setAvatar({
        id: record?.attributes.avatar.data.id,
        name: record?.attributes.avatar.data.attributes.name,
        url: `${BASE_URL}${record?.attributes.avatar.data.attributes.url}`,
      });

    if (record?.attributes.gallery.data) {
      setGallery(
        record.attributes.gallery.data.map(gall => ({
          id: gall.id,
          name: gall.attributes.name,
          url: `${BASE_URL}${gall.attributes.url}`,
        }))
      );
    }
    if (record?.attributes?.description) {
      setDescription(
        formType.FORM_CREATE !== type ? record?.attributes?.description : ''
      );
    }
  }, [record?.id, openTime]);

  useEffect(() => {
    if (
      (optionCategories?.length === 0 || isValidatingCategories) &&
      record?.id &&
      currentCategories === 1
    ) {
      setOptionCategories(
        record.attributes.categories.data.map(item => ({
          value: item?.id,
          label: item?.attributes?.name || item?.id?.toString(),
        }))
      );
    }

    if (
      !isLoadingCategories &&
      !isValidatingCategories &&
      dataCategories?.length > 0
    ) {
      const tempOptions = dataCategories?.map(category => ({
        value: category?.id,
        label: category?.attributes?.name || category?.id,
      }));

      setOptionCategories(prev =>
        [...prev, ...tempOptions].filter(
          (item, index, self) =>
            index === self.findIndex(t => t.value === item.value)
        )
      );
    }
  }, [
    isLoadingCategories,
    record?.id,
    currentCategories,
    isValidatingCategories,
    openTime,
  ]);

  useEffect(() => {
    if (isValidatingProductLines) {
      setOptionProductLines([]);
    }
    if (
      (optionProductLines?.length === 0 || isValidatingProductLines) &&
      record?.id &&
      currentProductLines === 1
    ) {
      setOptionProductLines([
        {
          label:
            record?.attributes?.product_line?.data?.attributes?.name ||
            record?.attributes?.product_line?.data?.id,
          value: record?.attributes?.product_line?.data?.id,
        },
      ]);
    }

    if (
      !isLoadingProductLines &&
      !isValidatingProductLines &&
      dataProductLines.length > 0
    ) {
      const tempOptions = dataProductLines?.map(productLine => ({
        value: productLine?.id,
        label: productLine?.attributes?.name || productLine?.id?.toString(),
      }));

      setOptionProductLines(prev =>
        [...prev, ...tempOptions].filter(
          (item, index, self) =>
            index === self.findIndex(t => t.value === item.value)
        )
      );
    }
  }, [
    isLoadingProductLines,
    record?.id,
    currentProductLines,
    isValidatingProductLines,
  ]);

  useEffect(() => {
    if (isValidatingSkinProperties) {
      setOptionSkinProperties([]);
    }
    if (
      (optionSkinProperties?.length === 0 || isValidatingSkinProperties) &&
      record?.id &&
      currentSkinProperties === 1
    ) {
      setOptionSkinProperties(
        record.attributes.skin_properties.data.map(item => ({
          value: item?.id,
          label: item?.attributes?.name || item?.id?.toString(),
        }))
      );
    }

    if (
      !isLoadingSkinProperties &&
      !isValidatingSkinProperties &&
      dataSkinProperties.length > 0
    ) {
      const tempOptions = dataSkinProperties?.map(category => ({
        value: category?.id,
        label: category?.attributes?.name || category?.id?.toString(),
      }));

      setOptionSkinProperties(prev =>
        [...prev, ...tempOptions].filter(
          (item, index, self) =>
            index === self.findIndex(t => t.value === item.value)
        )
      );
    }
  }, [
    isLoadingSkinProperties,
    record?.id,
    currentSkinProperties,
    isValidatingSkinProperties,
  ]);

  const uploadAvatar = async () => {
    if (avatarFile && avatarFile?.originFileObj) {
      const originFileObj = avatarFile.originFileObj;
      const response = await usePostUploadFile(originFileObj);
      if (response && response[0]?.id) {
        return response;
      }
    }
  };

  const uploadGallery = async () => {
    const ids: number[] = [];
    if (galleryFileLists && galleryFileLists.length > 0) {
      for (const gallery of galleryFileLists) {
        if (gallery?.originFileObj) {
          const response = await usePostUploadFile(gallery.originFileObj);

          if (response && response[0]?.id) {
            ids.push(response[0]?.id);
          }
        }
      }
    }
    return ids;
  };

  const onSubmit: SubmitHandler<FormProductType> = async data => {
    let galleryIds: number[] | undefined | null;
    let avatarId: number | undefined | null;

    const resAvatar = await uploadAvatar();
    const resGal = await uploadGallery();
    if (resAvatar) {
      avatarId = resAvatar[0]?.id?.toString();
    } else {
      avatarId = avatar?.id || null;
    }

    if (resGal.length) {
      galleryIds = [...(galleryIDs || []), ...resGal];
    } else {
      galleryIds = galleryIDs;
    }

    const convertData = {
      ...data,
      categories: formatValue(data?.categories),
      product_line: data?.product_line ? { id: data?.product_line } : undefined,
      skin_properties: formatValue(data?.skin_properties),
      avatar: avatarId || null,
      gallery: galleryIds || undefined,
      description: description,
    };

    if (type === formType.FORM_CREATE) {
      const productRes = await useCreateProduct(convertData);

      if (productRes && productRes?.data.id) {
        toast.success('Thêm thông tin thành công!');
        handleComplete?.();
        reset();
      } else {
        toast.error('Thêm thông tin thất bại!');
      }
    }

    if (type === formType.FORM_UPDATE && record?.id) {
      const productRes = await useUpdateProduct(record?.id, convertData);

      if (productRes && productRes?.data.id) {
        toast.success('Cập nhật thông tin thành công!');
        handleComplete?.();
      } else {
        toast.error('Cập nhật thông tin thất bại!');
      }
    }
  };

  const handleAddAvatar = (image: UploadLocalType, fileList: UploadFile) => {
    setAvatar(image);
    setAvatarFile(fileList);
  };

  const handleDeleteAvatar = (id?: number | string) => {
    if (id) {
      setAvatar(undefined);
      setAvatarFile(undefined);
    }
  };

  const handleAddGallery = (
    image: UploadLocalType,
    fileListItem: UploadFile
  ) => {
    setGallery(prev => [...(prev || []), image]);
    setGalleryFileLists(prev => [...(prev || []), fileListItem]);
  };
  const handleDeleteGallery = (id?: string | number) => {
    const searchCondition = 'rc-upload';
    if (id && !id?.toString().includes(searchCondition)) {
      const tempCurrentId = galleryIDs?.filter(
        galleryID => galleryID !== Number(id)
      );
      setGalleryIDs(tempCurrentId || null);
    }
    if (id) {
      const tempCurrent = gallery?.filter(item => item.id !== id);
      setGallery(tempCurrent);
    }
  };
  const handlePopupScrollSkinProperties = (
    e: React.UIEvent<HTMLDivElement>
  ) => {
    if (e && e.currentTarget) {
      const { scrollTop, scrollHeight, clientHeight } = e.currentTarget;
      if (
        scrollTop + clientHeight >= scrollHeight &&
        !isLoadingSkinProperties &&
        currentSkinProperties < (paginationSkinProperties?.pageCount || 1)
      ) {
        setCurrentSkinProperties(currentSkinProperties + 1);
      }
    }
  };

  const handlePopupScrollProductLine = (e: React.UIEvent<HTMLDivElement>) => {
    if (e && e.currentTarget) {
      const { scrollTop, scrollHeight, clientHeight } = e.currentTarget;

      // Check for scrolling down to the bottom
      if (
        scrollTop + clientHeight >= scrollHeight &&
        !isLoadingProductLines &&
        currentProductLines < (paginationProductLines?.pageCount || 1)
      ) {
        setCurrentProductLines(currentProductLines + 1);
      }

      // Check for scrolling up to the top
      if (
        scrollTop === 0 &&
        !isLoadingProductLines &&
        currentProductLines > 1
      ) {
        setCurrentProductLines(currentProductLines - 1);
      }
    }
  };

  const handlePopupScrollCategory = (e: React.UIEvent<HTMLDivElement>) => {
    if (e && e.currentTarget) {
      const { scrollTop, scrollHeight, clientHeight } = e.currentTarget;
      if (
        scrollTop + clientHeight >= scrollHeight &&
        !isLoadingCategories &&
        currentCategories < (paginationCategories?.pageCount || 1)
      ) {
        setCurrentCategories(currentCategories + 1);
      }
    }
  };
  return (
    <form
      className="flex flex-col gap-[16px]"
      onSubmit={handleSubmit(onSubmit)}
    >
      <div className="grid grid-cols-1 md:grid-cols-2  gap-[1.2rem]">
        <div className="grid grid-cols-1 gap-[1.6rem] h-fit">
          {isDisable && (
            <InputComponent
              label="Đường dẫn:"
              name="slug"
              placeholder="Đường dẫn"
              control={control}
              disabled={isDisable}
            />
          )}
          <InputComponent
            label="Tên sản phẩm:"
            name="name"
            placeholder="Tên sản phảm"
            control={control}
            errors={errors.name}
            rules={formValidation.product_name}
            disabled={isDisable}
            isRequired
          />
          <InputComponent
            label="Giá bán:"
            name="price"
            placeholder="Giá bán"
            control={control}
            disabled={isDisable}
            errors={errors.price}
            rules={formValidation.price}
            isRequired
          />
          <InputComponent
            label="Giá giảm:"
            name="sale_price"
            placeholder="Giá giảm"
            control={control}
            disabled={isDisable}
          />
          <div className="flex flex-col gap-[1.2rem]">
            <UploadImageComponent
              label="Ảnh chính sản phẩm:"
              disabled={isDisable}
              maxCount={1}
              onAddImage={handleAddAvatar}
            />
            <ReviewImage
              listImage={avatar}
              onDelete={handleDeleteAvatar}
              disabled={isDisable}
            />
          </div>
        </div>
        <div className="grid grid-cols-1 gap-[1.6rem] h-fit">
          <SelectComponent
            label="Danh mục:"
            control={control}
            name="categories"
            options={optionCategories}
            mode="multiple"
            disabled={isDisable}
            rules={formValidation.product_categories}
            errors={
              Array.isArray(errors?.categories)
                ? errors.categories[0]
                : errors.categories
            }
            isRequired
            onPopupScroll={handlePopupScrollCategory}
          />
          <SelectComponent
            label="Đặc tính da:"
            placeholder="Đặc tính da"
            control={control}
            name="skin_properties"
            options={optionSkinProperties}
            mode="multiple"
            disabled={isDisable}
            rules={formValidation.product_skin_properties}
            errors={
              Array.isArray(errors?.skin_properties)
                ? errors.skin_properties[0]
                : errors.skin_properties
            }
            isRequired
            onPopupScroll={handlePopupScrollSkinProperties}
          />
          <SelectComponent
            label="Dòng sản phẩm:"
            placeholder="Dòng sản phẩm"
            control={control}
            name="product_line"
            options={optionProductLines}
            disabled={isDisable}
            rules={formValidation.product_product_line}
            errors={errors.product_line}
            isRequired
            onPopupScroll={handlePopupScrollProductLine}
          />
          {isDisable && (
            <InputComponent
              label="Total purchase:"
              name="total_purchase"
              placeholder="Total purchase"
              control={control}
              disabled={isDisable}
            />
          )}

          <div className="flex flex-col gap-[1.2rem] mt-[1rem]">
            <UploadImageComponent
              label="Bộ sư tập:"
              maxCount={1}
              onAddImage={handleAddGallery}
              disabled={isDisable}
            />
            <ReviewImage
              listImage={gallery}
              onDelete={handleDeleteGallery}
              disabled={isDisable}
            />
          </div>
        </div>
      </div>

      <ReactQuillComponent
        setCurrentValue={setDescription}
        currentValue={description}
      />
      <div className="flex justify-end items-end gap-[1.2rem]">
        <ButtonComponent
          text="Hủy"
          onClick={() => {
            onCloseModal?.();
          }}
        />
        {!isDisable && (
          <ButtonComponent type="primary" htmlType="submit" text="Lưu" />
        )}
      </div>
    </form>
  );
};

export default ProductForm;
