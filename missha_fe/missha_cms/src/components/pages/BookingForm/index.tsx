import ButtonComponent from '@/components/common/Button';
import DatePickerComponent from '@/components/common/DateTimePicker';
import InputComponent from '@/components/common/Input';
import SelectComponent from '@/components/common/Select';
import useCreateBooking from '@/libs/axios/booking/useCreateBooking';
import useUpdateBooking from '@/libs/axios/booking/useUpdateBooking';
import { useFetchServices } from '@/libs/swr/useServices';
import { BaseData } from '@/types/base/baseData';
import { FormBookingType } from '@/types/request/form/formBooking';
import { BookingResponseType } from '@/types/response/booking';
import { BookingStatus } from '@/utils/constants/bookingStatus';
import defaultKey from '@/utils/constants/default';
import formType from '@/utils/constants/formType';
import formValidation from '@/utils/constants/formValidation';
import { getUserProfile } from '@/utils/functions/getAccessToken';
import { DefaultOptionType } from 'antd/es/select';
import { useEffect, useState } from 'react';
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

  const [currentPageService, setCurrentPageService] = useState<number>(1);
  const [optionServices, setOptionServices] = useState<DefaultOptionType[]>([]);
  const {
    data: dataServices,
    isLoading: isLoadingServices,
    isValidating: isValidatingServices,
    pagination: paginationServices,
  } = useFetchServices({
    populate: 'deep, 1',
    'pagination[pageSize]': 10,
    'pagination[page]': currentPageService,
  });
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
    if (type === formType.FORM_UPDATE || type === formType.FORM_VIEW) {
      reset({
        customer_full_name: record?.attributes?.customer_full_name,
        customer_email: record?.attributes?.customer_email,
        customer_phone: record?.attributes?.customer_phone,
        date: record?.attributes?.date,
        status: record?.attributes.status,
        service: record?.attributes?.service?.data?.id,
      });
    }
    if (type === formType.FORM_CREATE) {
      reset({
        customer_full_name: undefined,
        customer_email: undefined,
        customer_phone: undefined,
        date: undefined,
        status: undefined,
        service: undefined,
      });
    }
  }, [record?.id, openTime]);

  const onSubmit: SubmitHandler<FormBookingType> = async data => {
    if (type === formType.FORM_CREATE) {
      const profile = getUserProfile();
      const body = {
        ...data,
        user: profile?.id,
      };
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
      const body = {
        ...data,
        user: record?.attributes?.user?.data?.id,
      };
      const bookingRes = await useUpdateBooking(record?.id, body);
      if (bookingRes.data && bookingRes.data.id) {
        toast.success('Cập nhật thông tin thành công!');
        handleComplete?.();
      } else {
        toast.error('Cập nhật thông tin thất bại!');
      }
    }
  };

  useEffect(() => {
    if (
      (optionServices?.length === 0 || isValidatingServices) &&
      record?.id &&
      currentPageService === 1
    ) {
      setOptionServices([
        {
          value: record?.attributes?.service?.data?.id,
          label: record?.attributes?.service?.data?.attributes?.title,
        },
      ]);
    }

    if (
      !isLoadingServices &&
      !isValidatingServices &&
      dataServices?.length > 0
    ) {
      const tempOptions = dataServices?.map(service => ({
        value: service?.id,
        label: service?.attributes?.title || service?.id,
      }));

      setOptionServices(prev =>
        [...prev, ...tempOptions].filter(
          (item, index, self) =>
            index === self.findIndex(t => t.value === item.value)
        )
      );
    }
  }, [
    isLoadingServices,
    record?.id,
    currentPageService,
    isValidatingServices,
    openTime,
  ]);

  const handlePopupScrollService = (e: React.UIEvent<HTMLDivElement>) => {
    if (e && e.currentTarget) {
      const { scrollTop, scrollHeight, clientHeight } = e.currentTarget;
      if (
        scrollTop + clientHeight >= scrollHeight &&
        !isLoadingServices &&
        currentPageService < (paginationServices?.pageCount || 1)
      ) {
        setCurrentPageService(currentPageService + 1);
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
        rules={formValidation.date_booking}
        isRequired
        disabled={isView}
      />
      <SelectComponent
        label="Dịch vụ:"
        name="service"
        placeholder="Dịch vụ"
        control={control}
        options={optionServices}
        disabled={isView}
        isRequired
        errors={errors.service}
        rules={formValidation.service}
        onPopupScroll={handlePopupScrollService}
      />
      <SelectComponent
        label="Trạng thái booking:"
        name="status"
        placeholder="Trạng thái booking"
        control={control}
        options={Object.keys(BookingStatus).map(key => ({
          label: BookingStatus[key],
          value: key,
        }))}
        disabled={isView}
        isRequired
        errors={errors.status}
        rules={formValidation.status}
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
