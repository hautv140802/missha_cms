import ButtonComponent from '@/components/common/Button';
import InputComponent from '@/components/common/Input';
import ReviewImage from '@/components/common/ReviewImage';
import UploadImageComponent from '@/components/common/UploadImage';
import useCreateCategory from '@/libs/axios/category/useCreateCategory';
import useUpdateCategory from '@/libs/axios/category/useUpdateCategory';
import { usePostUploadFile } from '@/libs/axios/upload/usePostUpload';
import { BaseData } from '@/types/base/baseData';
import { CategoryTableType } from '@/types/common/tables/category';
import { UploadLocalType } from '@/types/common/UploadLocalType';
import { FormCategoryType } from '@/types/request/form/formCategoryType';
import { CategoryResponseType } from '@/types/response/category';
import { BASE_URL } from '@/utils/constants/base';
import formType from '@/utils/constants/formType';
import formValidation from '@/utils/constants/formValidation';
import { UploadFile } from 'antd';
import { useEffect, useState } from 'react';
import { SubmitHandler, useForm } from 'react-hook-form';
import toast from 'react-hot-toast';

interface ICategoryFormProps {
  type: string;
  record?: BaseData<CategoryResponseType>;
  onCloseModal?: () => void;
  openTime?: string;
  handleComplete?: () => void;
}
const CategoryForm = (props: ICategoryFormProps) => {
  const { type, record, onCloseModal, openTime, handleComplete } = props;
  const [banner, setBanner] = useState<UploadLocalType>();
  const [bannerFile, setBannerFile] = useState<UploadFile>();

  const {
    control,
    handleSubmit,
    reset,
    formState: { errors },
  } = useForm<FormCategoryType>({
    mode: 'onChange',
  });
  useEffect(() => {
    reset({
      name: record?.attributes.name,
      slug: record?.attributes.slug,
    });

    if (record?.attributes.banner.data)
      setBanner({
        id: record?.attributes.banner.data.id,
        name: record?.attributes.banner.data.attributes.name,
        url: `${BASE_URL}${record?.attributes.banner.data.attributes.url}`,
      });
  }, [record?.id, openTime]);

  const uploadBanner = async () => {
    if (bannerFile && bannerFile.originFileObj) {
      console.log('bannerFile', bannerFile);
      const response = await usePostUploadFile(bannerFile.originFileObj);
      console.log('response', response);
      if (response && response[0]?.id) {
        return response[0]?.id;
      }
    }
  };

  const onSubmit: SubmitHandler<FormCategoryType> = async data => {
    const idBanner = await uploadBanner();

    const body = {
      name: data.name,
      slug: data.slug,
      banner: {
        id: idBanner,
      },
    };

    if (type === formType.FORM_CREATE) {
      const categoryRes = await useCreateCategory(body);
      if (categoryRes && categoryRes.data.id) {
        toast.success('Thêm thông tin thành công!');

        setBanner(undefined);
        setBannerFile(undefined);
        reset();
        handleComplete?.();
      } else {
        toast.error('Thêm thông tin thất bại!');
      }
      return;
    }
    if (!record) return;

    if (type === formType.FORM_UPDATE) {
      const categoryRes = await useUpdateCategory(record?.id, body);
      console.log(categoryRes);
      if (categoryRes.data && categoryRes.data.id) {
        toast.success('Cập nhật thông tin thành công!');
        handleComplete?.();
      } else {
        toast.error('Cập nhật thông tin thất bại!');
      }
    }
  };

  const handleAddBanner = (image: UploadLocalType, fileList: UploadFile) => {
    setBanner(image);
    setBannerFile(fileList);
  };

  const handleDeleteBanner = (id?: number) => {
    if (id) {
      setBanner(undefined);
      setBannerFile(undefined);
    }
  };

  return (
    <form
      className="flex flex-col gap-[16px]"
      onSubmit={handleSubmit(onSubmit)}
    >
      <InputComponent
        label="Tên danh mục:"
        name="name"
        placeholder="Tên danh mục"
        control={control}
        errors={errors.name}
        rules={formValidation.category_name}
      />
      {type === formType.FORM_VIEW && (
        <InputComponent
          label="Slug:"
          name="slug"
          placeholder="Slug"
          control={control}
        />
      )}
      <UploadImageComponent
        label="Ảnh danh mục:"
        disabled={type === formType.FORM_VIEW}
        maxCount={1}
        onAddImage={handleAddBanner}
      />
      <ReviewImage
        listImage={banner}
        onDelete={handleDeleteBanner}
        disabled={type === formType.FORM_VIEW}
      />

      <div className="flex justify-end items-end gap-[1.2rem]">
        <ButtonComponent text="Hủy" onClick={onCloseModal} />
        {type !== formType.FORM_VIEW && (
          <ButtonComponent type="primary" htmlType="submit" text="Lưu" />
        )}
      </div>
    </form>
  );
};

export default CategoryForm;
