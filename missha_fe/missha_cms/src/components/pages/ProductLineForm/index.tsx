import ButtonComponent from '@/components/common/Button';
import InputComponent from '@/components/common/Input';
import ReactQuillComponent from '@/components/common/ReactQuill';
import useCreateProductLine from '@/libs/axios/productLine/useCreateProductLine';
import useUpdateProductLine from '@/libs/axios/productLine/useUpdateProductLine';
import { BaseData } from '@/types/base/baseData';
import { FormProductLine } from '@/types/request/form/formProductLine';
import { ProductLineResponseType } from '@/types/response/product';
import formType from '@/utils/constants/formType';
import formValidation from '@/utils/constants/formValidation';
import { useEffect } from 'react';
import { SubmitHandler, useForm } from 'react-hook-form';
import toast from 'react-hot-toast';

interface IProductLineFormProps {
  type: string;
  record?: BaseData<ProductLineResponseType>;
  onCloseModal?: () => void;
  openTime?: string;
  handleComplete?: () => void;
}
const ProductLineForm = (props: IProductLineFormProps) => {
  const { type, record, onCloseModal, openTime, handleComplete } = props;

  const {
    control,
    handleSubmit,
    reset,
    formState: { errors },
  } = useForm<FormProductLine>({
    mode: 'onChange',
  });
  useEffect(() => {
    reset({
      name: record?.attributes.name,
      slug: record?.attributes.slug,
    });
  }, [record?.id, openTime]);

  const onSubmit: SubmitHandler<FormProductLine> = async data => {
    const body = {
      name: data.name,
      slug: data.slug,
    };

    if (type === formType.FORM_CREATE) {
      const productLineRes = await useCreateProductLine(body);
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
      const productLineRes = await useUpdateProductLine(record?.id, body);
      console.log(productLineRes);
      if (productLineRes.data && productLineRes.data.id) {
        toast.success('Cập nhật thông tin thành công!');
        handleComplete?.();
      } else {
        toast.error('Cập nhật thông tin thất bại!');
      }
    }
  };

  return (
    <form
      className="flex flex-col gap-[16px]"
      onSubmit={handleSubmit(onSubmit)}
    >
      <InputComponent
        label="Tên dòng sản phẩm:"
        name="name"
        placeholder="Tên dòng sản phẩm"
        control={control}
        errors={errors.name}
        rules={formValidation.product_line}
      />
      {type === formType.FORM_VIEW && (
        <InputComponent
          label="Slug:"
          name="slug"
          placeholder="Slug"
          control={control}
        />
      )}
      <ReactQuillComponent />

      <div className="flex justify-end items-end gap-[1.2rem]">
        <ButtonComponent text="Hủy" onClick={onCloseModal} />
        {type !== formType.FORM_VIEW && (
          <ButtonComponent type="primary" htmlType="submit" text="Lưu" />
        )}
      </div>
    </form>
  );
};

export default ProductLineForm;
