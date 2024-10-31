import ButtonComponent from '@/components/common/Button';
import InputComponent from '@/components/common/Input';
import ReviewImage from '@/components/common/ReviewImage';
import SelectComponent from '@/components/common/Select';
import UploadImageComponent from '@/components/common/UploadImage';
import useCreateProductLine from '@/libs/axios/productLine/useCreateProductLine';
import useUpdateProductLine from '@/libs/axios/productLine/useUpdateProductLine';
import { usePostUploadFile } from '@/libs/axios/upload/usePostUpload';
import useCreateVoucher from '@/libs/axios/voucher/useCreateVoucher';
import useUpdateVoucher from '@/libs/axios/voucher/useUpdateVoucher';
import { BaseData } from '@/types/base/baseData';
import { ImageType } from '@/types/common/image';
import { UploadLocalType } from '@/types/common/UploadLocalType';
import { FormProductLine } from '@/types/request/form/formProductLine';
import { FormVoucherType } from '@/types/request/form/formVoucher';
import { ProductLineResponseType } from '@/types/response/product';
import { VoucherResponseType } from '@/types/response/voucher';
import { BASE_URL } from '@/utils/constants/base';
import formType from '@/utils/constants/formType';
import formValidation from '@/utils/constants/formValidation';
import { UploadFile } from 'antd';
import { useEffect, useState } from 'react';
import { SubmitHandler, useForm } from 'react-hook-form';
import toast from 'react-hot-toast';

interface IVoucherFormProps {
  type: string;
  record?: BaseData<VoucherResponseType>;
  onCloseModal?: () => void;
  openTime?: string;
  handleComplete?: () => void;
}
const VoucherForm = (props: IVoucherFormProps) => {
  const { type, record, onCloseModal, openTime, handleComplete } = props;
  const [imageVoucher, setImageVoucher] = useState<UploadLocalType | null>(
    null
  );
  const [imageVoucherFile, setImageVoucherFile] = useState<UploadFile>();
  const isView = formType.FORM_VIEW === type;
  const {
    control,
    handleSubmit,
    reset,
    formState: { errors },
  } = useForm<FormVoucherType>({
    mode: 'onChange',
  });
  useEffect(() => {
    reset({
      code: record?.attributes?.code,
      title: record?.attributes?.title,
      amount_decrease: record?.attributes?.amount_decrease,
      public: record?.attributes?.public ? 1 : 0,
    });

    setImageVoucher(
      record?.attributes?.image?.data
        ? {
            id: record?.attributes?.image?.data?.id,
            name: record?.attributes?.image?.data?.attributes?.name,
            url: `${BASE_URL}${record?.attributes?.image?.data?.attributes?.url}`,
          }
        : null
    );
  }, [record?.id, openTime]);
  const uploadImageVoucher = async () => {
    if (imageVoucherFile && imageVoucherFile.originFileObj) {
      const response = await usePostUploadFile(imageVoucherFile.originFileObj);
      if (response && response[0]?.id) {
        return response[0]?.id;
      }
    }
  };
  const onSubmit: SubmitHandler<FormVoucherType> = async data => {
    const imageVoucherID = await uploadImageVoucher();
    const body = {
      code: data.code,
      amount_decrease: data.amount_decrease,
      title: data.title,
      public: data.public ? true : false,
      image: imageVoucherID || imageVoucher?.id || null,
    };

    if (type === formType.FORM_CREATE) {
      const productLineRes = await useCreateVoucher(body);
      if (productLineRes && productLineRes.data.id) {
        toast.success('Thêm thông tin thành công!');

        reset();
        handleComplete?.();
      } else {
        toast.error('Thêm thông tin thất bại!');
      }
      return;
    }
    if (!record) return;

    if (type === formType.FORM_UPDATE) {
      const productLineRes = await useUpdateVoucher(record?.id, body);
      console.log(productLineRes);
      if (productLineRes.data && productLineRes.data.id) {
        toast.success('Cập nhật thông tin thành công!');
        handleComplete?.();
      } else {
        toast.error('Cập nhật thông tin thất bại!');
      }
    }
  };
  const handleAddImageVoucher = (
    image: UploadLocalType,
    fileList: UploadFile
  ) => {
    setImageVoucher(image);
    setImageVoucherFile(fileList);
  };

  const handleDeleteImageVoucher = (id?: number | string) => {
    if (id) {
      setImageVoucher(null);
      setImageVoucherFile(undefined);
    }
  };
  return (
    <form
      className="flex flex-col gap-[16px]"
      onSubmit={handleSubmit(onSubmit)}
    >
      <InputComponent
        label="Mã voucher:"
        name="code"
        placeholder="Tên dòng sản phẩm"
        control={control}
        disabled={isView}
        isRequired
        rules={formValidation.code_voucher}
        errors={errors.code}
      />
      <InputComponent
        label="Tiêu đề voucher:"
        name="title"
        placeholder="Tên dòng sản phẩm"
        control={control}
        disabled={isView}
        rules={formValidation.title}
        errors={errors.title}
        isRequired
      />
      <InputComponent
        label="Số tiền giảm:"
        name="amount_decrease"
        placeholder="Số tiền giảm"
        control={control}
        disabled={isView}
        isRequired
        rules={formValidation.amount_decrease}
        errors={errors.amount_decrease}
      />
      <SelectComponent
        label="Public:"
        name="public"
        placeholder="Public"
        control={control}
        errors={errors.public}
        rules={formValidation.public}
        options={[
          { value: 1, label: 'Có' },
          { value: 0, label: 'Không' },
        ]}
        disabled={isView}
        isRequired
      />
      <UploadImageComponent
        label="Ảnh voucher:"
        maxCount={1}
        onAddImage={handleAddImageVoucher}
        disabled={isView}
      />
      <ReviewImage
        listImage={imageVoucher}
        onDelete={handleDeleteImageVoucher}
        disabled={isView}
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

export default VoucherForm;
