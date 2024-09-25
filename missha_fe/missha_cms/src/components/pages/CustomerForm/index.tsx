import ButtonComponent from '@/components/common/Button';
import InputComponent from '@/components/common/Input';
import SelectComponent from '@/components/common/Select';
import useCreateCustomer from '@/libs/axios/customer/useCreateCustomer';
import useUpdateCustomer from '@/libs/axios/customer/useUpdateCustomer';
import { useFetchRoles } from '@/libs/swr/useFetchRoles';
import { FormUserRequestType } from '@/types/request/form/formCustomer';
import { UserResponseType, UserRole } from '@/types/response/user';
import formType from '@/utils/constants/formType';
import formValidation from '@/utils/constants/formValidation';
import { useEffect, useState } from 'react';
import { SubmitHandler, useForm } from 'react-hook-form';
import toast from 'react-hot-toast';

interface ICustomerFormProps {
  type: string;
  record?: UserResponseType;
  onCloseModal?: () => void;
  openTime?: string;
  handleComplete?: () => void;
}
const CustomerForm = (props: ICustomerFormProps) => {
  const { type, record, onCloseModal, openTime, handleComplete } = props;
  const [rolesData, setRolesData] = useState<UserRole[]>();
  const isView = type === formType.FORM_VIEW;
  const {
    control,
    handleSubmit,
    reset,
    formState: { errors },
  } = useForm<FormUserRequestType>({
    mode: 'onChange',
  });

  const { data, isLoading, isValidating } = useFetchRoles();

  useEffect(() => {
    if (!isLoading) {
      setRolesData(data);
    }
  }, [isLoading, openTime]);
  useEffect(() => {
    reset(
      type !== formType.FORM_CREATE
        ? {
            ...record,
            gender: record?.gender,
            role: record?.role?.id,
            blocked: record?.blocked?.toString() || 'false',
          }
        : {
            gender: 'female',
            blocked: 'false',
            role: 1,
            type: 'USER',
          }
    );
  }, [record?.id, openTime]);

  const onSubmit: SubmitHandler<FormUserRequestType> = async data => {
    if (type === formType.FORM_CREATE) {
      const productLineRes = await useCreateCustomer(data);
      if (productLineRes && productLineRes.id) {
        toast.success('Thêm thông tin thành công!');
        reset();
        handleComplete?.();
      } else {
        if (productLineRes.status === 400) {
          toast.error('Username hoặc Email đã tồn tại!');
        } else {
          toast.error('Thêm thông tin thất bại!');
        }
      }
      return;
    }
    if (!record) return;
    if (type === formType.FORM_UPDATE) {
      const productLineRes = await useUpdateCustomer(record?.id, data);

      if (productLineRes && productLineRes.id) {
        toast.success('Cập nhật thông tin thành công!');
        handleComplete?.();
      } else {
        if (productLineRes.status === 400) {
          toast.error('Username hoặc Email đã tồn tại!');
        } else {
          toast.error('Cập nhật thông tin thất bại!');
        }
      }
    }
  };

  return (
    <form
      className="flex flex-col gap-[16px]"
      onSubmit={handleSubmit(onSubmit)}
    >
      <InputComponent
        label="Tên khách hàng:"
        name="full_name"
        placeholder="Tên khách hàng"
        control={control}
        disabled={isView}
      />
      <div className="grid grid-cols-1 md:grid-cols-2 gap-[1.2rem]">
        <InputComponent
          label="Tên tài khoản:"
          name="username"
          placeholder="Tên tài khoản"
          control={control}
          disabled={isView}
          isRequired
          errors={errors.username}
          rules={formValidation.username}
        />
        <InputComponent
          label="Email:"
          name="email"
          placeholder="Email"
          control={control}
          errors={errors.email}
          rules={formValidation.email}
          disabled={isView}
          isRequired
        />
      </div>
      <InputComponent
        label="Mật khẩu:"
        name="password"
        placeholder="Mật khẩu"
        control={control}
        errors={errors.password}
        rules={formValidation.password}
        disabled={isView}
        isRequired
      />
      <InputComponent
        label="Số điện thoại:"
        name="phone"
        placeholder="Số điện thoại"
        control={control}
        errors={errors.phone}
        rules={formValidation.phone}
        disabled={isView}
        isRequired
      />

      <div className="grid grid-cols-1 md:grid-cols-3 gap-[1.2rem]">
        <SelectComponent
          label="Giới tính:"
          name="gender"
          control={control}
          placeholder="Giới tính"
          options={[
            {
              value: 'female',
              label: 'Nũ',
            },
            {
              value: 'male',
              label: 'Nam',
            },
          ]}
          disabled={isView}
        />
        <SelectComponent
          name="blocked"
          label="Blocked:"
          control={control}
          placeholder="Blocked"
          options={[
            {
              value: 'true',
              label: 'True',
            },
            {
              value: 'false',
              label: 'False',
            },
          ]}
          disabled={isView}
        />

        <SelectComponent
          name="type"
          control={control}
          label="Type:"
          placeholder="Type"
          options={[
            {
              value: 'ADMIN',
              label: 'Admin',
            },
            {
              value: 'USER',
              label: 'User',
            },
          ]}
          disabled={isView}
        />
        <SelectComponent
          control={control}
          name="role"
          defaultValue={record?.role.id || 1}
          label="Role:"
          placeholder="Role"
          options={rolesData?.map(item => ({
            value: item.id,
            label: item.name,
          }))}
          disabled={isView}
          isRequired
          errors={errors.role}
          rules={formValidation.role}
        />
      </div>

      <div className="flex justify-end items-end gap-[1.2rem] mt-[1.2rem]">
        <ButtonComponent text="Hủy" onClick={onCloseModal} />
        {!isView && (
          <ButtonComponent type="primary" htmlType="submit" text="Lưu" />
        )}
      </div>
    </form>
  );
};

export default CustomerForm;
