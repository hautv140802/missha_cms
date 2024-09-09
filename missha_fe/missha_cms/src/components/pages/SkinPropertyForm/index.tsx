import ButtonComponent from '@/components/common/Button';
import InputComponent from '@/components/common/Input';
import useCreateSkinProperty from '@/libs/axios/skinProperty/useCreateSkinProperty';
import useUpdateSkinProperty from '@/libs/axios/skinProperty/useUpdateSkinProperty';
import { BaseData } from '@/types/base/baseData';
import { FormSkinPropertyType } from '@/types/request/form/formSkinProperty';
import { SkinPropertiesResponseType } from '@/types/response/product';
import formType from '@/utils/constants/formType';
import formValidation from '@/utils/constants/formValidation';
import { useEffect } from 'react';
import { SubmitHandler, useForm } from 'react-hook-form';
import toast from 'react-hot-toast';

interface ISkinPropertyFormProps {
  type: string;
  record?: BaseData<SkinPropertiesResponseType>;
  onCloseModal?: () => void;
  openTime?: string;
  handleComplete?: () => void;
}
const SkinPropertyForm = (props: ISkinPropertyFormProps) => {
  const { type, record, onCloseModal, openTime, handleComplete } = props;

  const {
    control,
    handleSubmit,
    reset,
    formState: { errors },
  } = useForm<FormSkinPropertyType>({
    mode: 'onChange',
  });
  useEffect(() => {
    reset({
      name: record?.attributes.name,
      slug: record?.attributes.slug,
    });
  }, [record?.id, openTime]);

  const onSubmit: SubmitHandler<FormSkinPropertyType> = async data => {
    const body = {
      name: data.name,
      slug: data.slug,
    };

    if (type === formType.FORM_CREATE) {
      const skinPropertyRes = await useCreateSkinProperty(body);
      if (skinPropertyRes && skinPropertyRes.data.id) {
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
      const skinPropertyRes = await useUpdateSkinProperty(record?.id, body);
      console.log(skinPropertyRes);
      if (skinPropertyRes.data && skinPropertyRes.data.id) {
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
        label="Đặc tính của da:"
        name="name"
        placeholder="Đặc tính của da"
        control={control}
        errors={errors.name}
        rules={formValidation.skin_property}
      />
      {type === formType.FORM_VIEW && (
        <InputComponent
          label="Slug:"
          name="slug"
          placeholder="Slug"
          control={control}
        />
      )}

      <div className="flex justify-end items-end gap-[1.2rem]">
        <ButtonComponent text="Hủy" onClick={onCloseModal} />
        {type !== formType.FORM_VIEW && (
          <ButtonComponent type="primary" htmlType="submit" text="Lưu" />
        )}
      </div>
    </form>
  );
};

export default SkinPropertyForm;
