import ButtonComponent from '@/components/common/Button';
import InputComponent from '@/components/common/Input';
import SelectComponent from '@/components/common/Select';
import useCreateUserVoucher from '@/libs/axios/userVoucher/useCreateUserVoucher';
import useUpdateUserVoucher from '@/libs/axios/userVoucher/useUpdateUserVoucher';
import { useFetchCustomers } from '@/libs/swr/useFetchCustomers';
import { useFetchVouchers } from '@/libs/swr/useFetchVouchers';
import { BaseData } from '@/types/base/baseData';
import { FormUserVoucherType } from '@/types/request/form/formUserVoucher';
import { UserVoucherType } from '@/types/response/userVoucher';
import formType from '@/utils/constants/formType';
import formValidation from '@/utils/constants/formValidation';
import variables from '@/utils/constants/variables';
import { DefaultOptionType } from 'antd/es/select';
import axios from 'axios';
import { useEffect, useState } from 'react';
import { SubmitHandler, useForm } from 'react-hook-form';
import toast from 'react-hot-toast';

interface IUserVoucherFormProps {
  type: string;
  record?: BaseData<UserVoucherType>;
  onCloseModal?: () => void;
  openTime?: string;
  handleComplete?: () => void;
}
const UserVoucherForm = (props: IUserVoucherFormProps) => {
  const { type, record, onCloseModal, openTime, handleComplete } = props;
  const isView = formType.FORM_VIEW === type;
  const [currentPageVoucher, setCurrentPageVoucher] = useState<number>(1);
  const [optionVouchers, setOptionVouchers] = useState<DefaultOptionType[]>([]);
  const [optionCustomers, setOptionCustomers] = useState<DefaultOptionType[]>(
    []
  );
  const {
    data: dataCustomer,
    isLoading: isLoadingCustomer,
    isValidating: isValidatingCustomer,
  } = useFetchCustomers({
    populate: 'deep, 1',
  });

  const {
    data: dataVouchers,
    isLoading: isLoadingVouchers,
    isValidating: isValidatingVouchers,
    pagination: paginationVouchers,
  } = useFetchVouchers({
    populate: 'deep, 1',
    'pagination[pageSize]': 10,
    'pagination[page]': currentPageVoucher,
  });

  const {
    control,
    handleSubmit,
    reset,
    setValue,
    formState: { errors },
  } = useForm<FormUserVoucherType>({
    mode: 'onChange',
  });
  useEffect(() => {
    reset({
      ...record?.attributes,
      user: record?.attributes?.user?.data?.id,
      voucher: record?.attributes?.voucher?.data?.id,
    });

    if (type === formType.FORM_CREATE) {
      setValue('status', variables.UNUSED);
    }
  }, [record?.id, openTime]);

  const onSubmit: SubmitHandler<FormUserVoucherType> = async data => {
    if (type === formType.FORM_CREATE) {
      try {
        const resUserVoucher = await useCreateUserVoucher(data);

        if (resUserVoucher.data) {
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

      return;
    }
    if (!record) return;

    if (type === formType.FORM_UPDATE) {
      try {
        const resUserVoucher = await useUpdateUserVoucher(record?.id, data);

        if (resUserVoucher.data) {
          toast.success('Cập nhật thông tin thành công!');

          reset();
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
  useEffect(() => {
    if (
      (optionVouchers?.length === 0 || isValidatingVouchers) &&
      record?.id &&
      currentPageVoucher === 1
    ) {
      setOptionVouchers([
        {
          value: record?.attributes?.voucher?.data?.id,
          label: record?.attributes?.voucher?.data?.attributes?.code,
        },
      ]);
    }

    if (
      !isLoadingVouchers &&
      !isValidatingVouchers &&
      dataVouchers?.length > 0
    ) {
      const tempOptions = dataVouchers?.map(voucher => ({
        value: voucher?.id,
        label: voucher?.attributes?.code || voucher?.id,
      }));

      setOptionVouchers(prev =>
        [...prev, ...tempOptions].filter(
          (item, index, self) =>
            index === self.findIndex(t => t.value === item.value)
        )
      );
    }
  }, [
    isLoadingVouchers,
    record?.id,
    currentPageVoucher,
    isValidatingVouchers,
    openTime,
  ]);

  useEffect(() => {
    setOptionCustomers(
      dataCustomer?.map(customer => ({
        value: customer?.id,
        label: customer?.email,
      }))
    );
  }, [isLoadingCustomer, record?.id, isValidatingCustomer, openTime]);
  return (
    <form
      className="flex flex-col gap-[16px]"
      onSubmit={handleSubmit(onSubmit)}
    >
      <SelectComponent
        label="Khách hàng:"
        name="user"
        placeholder="Khách hàng"
        control={control}
        errors={errors.user}
        rules={formValidation.user}
        options={optionCustomers}
        disabled={isView}
        isRequired
      />
      <SelectComponent
        label="Voucher:"
        name="voucher"
        placeholder="Voucher"
        control={control}
        errors={errors.voucher}
        rules={formValidation.voucher}
        options={optionVouchers}
        disabled={isView}
        isRequired
      />

      <SelectComponent
        label="Trạng thái:"
        name="status"
        placeholder="Trạng thái"
        control={control}
        errors={errors.status}
        rules={formValidation.status}
        options={[
          { value: variables.UNUSED, label: variables.UNUSED },
          { value: variables.USED, label: variables.USED },
        ]}
        disabled={isView}
        isRequired
      />

      <div className="flex justify-end items-end gap-[1.2rem]">
        <ButtonComponent text="Hủy" onClick={onCloseModal} />
        {!isView && (
          <ButtonComponent type="primary" htmlType="submit" text="Lưu" />
        )}
      </div>
    </form>
  );
};

export default UserVoucherForm;
