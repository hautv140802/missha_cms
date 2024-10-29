import ButtonComponent from '@/components/common/Button';
import InputComponent from '@/components/common/Input';
import ReviewImage from '@/components/common/ReviewImage';
import UploadImageComponent from '@/components/common/UploadImage';
import TextAreaComponent from '@/components/TextArea';
import useCreateService from '@/libs/axios/service/useCreateService';
import useUpdateService from '@/libs/axios/service/useUpdateService';
import { usePostUploadFile } from '@/libs/axios/upload/usePostUpload';
import { BaseData } from '@/types/base/baseData';
import { UploadLocalType } from '@/types/common/UploadLocalType';
import { FormServiceType } from '@/types/request/form/formService';
import { ServiceType } from '@/types/response/services';
import { BASE_URL } from '@/utils/constants/base';
import formType from '@/utils/constants/formType';
import formValidation from '@/utils/constants/formValidation';
import { UploadFile } from 'antd';
import axios from 'axios';
import { useEffect, useState } from 'react';
import { SubmitHandler, useForm } from 'react-hook-form';
import toast from 'react-hot-toast';

interface IProductLineFormProps {
  type: string;
  record?: BaseData<ServiceType>;
  onCloseModal?: () => void;
  openTime?: string;
  handleComplete?: () => void;
}
const ServiceForm = (props: IProductLineFormProps) => {
  const { type, record, onCloseModal, openTime, handleComplete } = props;
  const [banner, setBanner] = useState<UploadLocalType>();
  const [bannerFile, setBannerFile] = useState<UploadFile>();
  const {
    control,
    handleSubmit,
    reset,
    formState: { errors },
  } = useForm<FormServiceType>({
    mode: 'onChange',
  });
  useEffect(() => {
    reset({
      title: record?.attributes?.title,
      slug: record?.attributes?.slug,
      price: record?.attributes?.price,
      short_description: record?.attributes?.short_description,
    });

    if (record?.attributes.banner.data)
      setBanner({
        id: record?.attributes?.banner?.data?.id,
        name: record?.attributes?.banner?.data?.attributes?.name,
        url: `${BASE_URL}${record?.attributes?.banner?.data?.attributes?.url}`,
      });

    if (type === formType.FORM_CREATE) {
      setBanner(undefined);
    }
  }, [record?.id, openTime]);

  const uploadBanner = async () => {
    if (bannerFile && bannerFile.originFileObj) {
      const response = await usePostUploadFile(bannerFile.originFileObj);
      console.log('response', response);
      if (response && response[0]?.id) {
        return response[0]?.id;
      }
    }
  };
  const onSubmit: SubmitHandler<FormServiceType> = async data => {
    const idBanner = await uploadBanner();
    const body = {
      ...data,
      banner: idBanner,
    };

    if (type === formType.FORM_CREATE) {
      try {
        const productLineRes = await useCreateService(body);

        if (productLineRes.data) {
          toast.success('Thêm thông tin thành công!');

          reset();
          handleComplete?.();
        }
      } catch (error) {
        console.log(error);
        if (axios.isAxiosError(error)) {
          toast.error(
            `Thêm thông tin thất bại:${error?.response?.data?.error?.message}`
          );
        } else {
          toast.error(`Thêm thông tin thất bại:${error}`);
        }
      }
    }

    if (!record) return;

    if (type === formType.FORM_UPDATE) {
      try {
        const productLineRes = await useUpdateService(record?.id, body);

        if (productLineRes.data) {
          toast.success('Cập nhật thông tin thành công!');
          handleComplete?.();
        }
      } catch (error) {
        console.log(error);
        if (axios.isAxiosError(error)) {
          toast.error(
            `Cập nhật thông tin thất bại:${error?.response?.data?.error?.message}`
          );
        } else {
          toast.error(`Cập nhật thông tin thất bại:${error}`);
        }
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
        label="Tên dịch vụ:"
        name="title"
        placeholder="Tên dịch vụ"
        control={control}
        errors={errors.title}
        // rules={formValidation.title}
      />
      {type === formType.FORM_VIEW && (
        <InputComponent
          label="Đường dẫn:"
          name="slug"
          placeholder="Đường dẫn"
          control={control}
        />
      )}
      <InputComponent
        label="Giá:"
        name="price"
        placeholder="Giá"
        control={control}
        errors={errors.price}
        rules={formValidation.price}
      />

      <TextAreaComponent
        label="Mô tả:"
        name="short_description"
        placeholder="Mô tả"
        control={control}
        // errors={errors.price}
        // rules={formValidation.price}
      />
      <div className="flex flex-col gap-[0.6rem]">
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
      </div>

      <div className="flex justify-end items-end gap-[1.2rem]">
        <ButtonComponent text="Hủy" onClick={onCloseModal} />
        {type !== formType.FORM_VIEW && (
          <ButtonComponent type="primary" htmlType="submit" text="Lưu" />
        )}
      </div>
    </form>
  );
};

export default ServiceForm;
