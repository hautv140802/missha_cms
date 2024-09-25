import ButtonComponent from '@/components/common/Button';
import DatePickerComponent from '@/components/common/DateTimePicker';
import InputComponent from '@/components/common/Input';
import SelectComponent from '@/components/common/Select';
import useCreateBooking from '@/libs/axios/booking/useCreateBooking';
import useUpdateBooking from '@/libs/axios/booking/useUpdateBooking';
import { BaseData } from '@/types/base/baseData';
import { FormBookingType } from '@/types/request/form/formBooking';
import { BookingResponseType } from '@/types/response/booking';
import defaultKey from '@/utils/constants/default';
import formType from '@/utils/constants/formType';
import formValidation from '@/utils/constants/formValidation';
import { OrderStatus } from '@/utils/constants/orderStatus';
import { getUserProfile } from '@/utils/functions/getAccessToken';
import { useEffect } from 'react';
import { SubmitHandler, useForm } from 'react-hook-form';
import toast from 'react-hot-toast';

interface IBookingFormProps {
  type: string;
  record?: BaseData<BookingResponseType>;
  onCloseModal?: () => void;
  openTime?: string;
  handleComplete?: () => void;
}
const BookingForm = (props: IBookingFormProps) => {
  const { type, record, onCloseModal, openTime, handleComplete } = props;
  const isView = formType.FORM_VIEW === type;
  const {
    control,
    handleSubmit,
    reset,
    formState: { errors },
  } = useForm<FormBookingType>({
    mode: 'onChange',
  });
  useEffect(() => {
    reset({
      customer_full_name: record?.attributes?.customer_full_name,
      customer_email: record?.attributes?.customer_email,
      customer_phone: record?.attributes?.customer_phone,
      date: record?.attributes?.date,
      status: record?.attributes.status,
      services: record?.attributes.services,
    });
  }, [record?.id, openTime]);

  const onSubmit: SubmitHandler<FormBookingType> = async data => {
    const profile = getUserProfile();
    const body = {
      ...data,
      user: profile?.id,
    };
    if (type === formType.FORM_CREATE) {
      const bookingRes = await useCreateBooking(body);
      if (bookingRes && bookingRes.data.id) {
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
      const bookingRes = await useUpdateBooking(record?.id, body);
      console.log(bookingRes);
      if (bookingRes.data && bookingRes.data.id) {
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
        label="Email khách hàng:"
        name="customer_email"
        placeholder="Email khách hàng"
        control={control}
        errors={errors.customer_email}
        rules={formValidation.email}
        isRequired
        disabled={isView}
      />
      <InputComponent
        label="Tên khách hàng:"
        name="customer_full_name"
        placeholder="Tên khách hàng"
        control={control}
        errors={errors.customer_full_name}
        rules={formValidation.fullName}
        isRequired
        disabled={isView}
      />
      <InputComponent
        label="Số điện thoại khách hàng:"
        name="customer_phone"
        placeholder="Số điện thoại khách hàng"
        control={control}
        errors={errors.customer_phone}
        rules={formValidation.phone}
        isRequired
        disabled={isView}
      />

      <DatePickerComponent
        format={defaultKey.DATE_TIME_FORMAT}
        control={control}
        label="Ngày booking:"
        name="date"
        placeholder="Ngày booking"
        errors={errors.date}
        rules={formValidation.dateBooking}
        isRequired
        disabled={isView}
      />
      <SelectComponent
        label="Trạng thái booking:"
        name="status"
        placeholder="Trạng thái booking"
        control={control}
        options={Object.keys(OrderStatus).map(key => ({
          label: OrderStatus[key],
          value: key,
        }))}
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

export default BookingForm;
