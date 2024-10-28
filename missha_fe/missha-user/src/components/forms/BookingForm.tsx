import { SubmitHandler, useForm } from "react-hook-form";
import InputComponent from "../Input";
import formValidation from "../../utils/constants/formValidations";
import DatePickerComponent from "../DateTimePicker";
import SelectComponent from "../Select";
import ButtonComponent from "../Button";
import { useQueryServices } from "../../hooks/queries/services.query";
import { useEffect, useState } from "react";
import { ServiceType } from "../../types/response/service";
import { BaseData } from "../../types/base/baseData";
import { DefaultOptionType } from "antd/es/select";
import { getUserProfile } from "../../utils/functions/getUserInfo";
import bookingApis from "../../apis/bookingApis";
import bookingStatus from "../../utils/constants/booking";
import toast from "react-hot-toast";
import axios from "axios";
import { Divider } from "antd";

type BookingFormType = {
  customer_email: string;
  customer_full_name: string;
  customer_phone: string;
  date: string;
  service: number;
};

interface IBookingFormProps {
  treatmentSelected: BaseData<ServiceType>;
  handleCancel: () => void;
}
const BookingForm = (props: IBookingFormProps) => {
  const { treatmentSelected, handleCancel } = props;
  const user = getUserProfile() || {};
  const [currentPageServices, setCurrentPageServices] = useState<number>(1);
  const [optionServices, setOptionServices] = useState<DefaultOptionType[]>([]);
  const [shortDescription, setShortDescription] = useState<string>();
  const [showAll, setShowAll] = useState(false);
  const {
    data: dataServices,
    isLoading: isLoadingServices,
    pagination: paginationServices,
  } = useQueryServices({
    "pagination[pageSize]": 10,
    "pagination[page]": currentPageServices,
  });
  const {
    control,
    handleSubmit,
    reset,
    watch,
    formState: { errors },
  } = useForm<BookingFormType>({
    mode: "onChange",
  });
  const serviceSelected = watch("service");
  const onSubmit: SubmitHandler<BookingFormType> = async (data) => {
    console.log(data, bookingStatus.WAITING_CONFIRM);
    try {
      const resBooking = await bookingApis.create({
        ...data,
        status: bookingStatus.WAITING_CONFIRM,
        user: user?.id,
      });

      if (resBooking?.data?.data) {
        toast.success("Đặt dịch vụ chăm sóc da thành công!");
        handleCancel();
        reset();
      }
    } catch (error) {
      console.log(error);
      if (axios.isAxiosError(error)) {
        toast.error(
          `Đặt dịch vụ chăm sóc da thất bại: ${error?.response?.data?.error?.message}`
        );
      } else {
        toast.error(`Đặt dịch vụ chăm sóc da thất bại: ${error}`);
      }
    }
  };

  useEffect(() => {
    reset({
      service: treatmentSelected?.id,
      customer_email: user?.email,
      customer_full_name: user?.full_name,
      customer_phone: user?.phone,
    });
  }, []);

  useEffect(() => {
    if (
      optionServices?.length === 0 &&
      currentPageServices === 1 &&
      treatmentSelected?.id
    ) {
      setOptionServices([
        {
          value: treatmentSelected?.id,
          label: treatmentSelected?.attributes?.title,
          short_description: treatmentSelected?.attributes?.short_description,
        },
      ]);
    }

    if (dataServices && dataServices?.length > 0 && !isLoadingServices) {
      const mapOptions = dataServices?.map((service) => ({
        value: service?.id,
        label: service?.attributes?.title,
        short_description: service?.attributes?.short_description,
      }));

      setOptionServices((prev) =>
        [...prev, ...mapOptions].filter(
          (item, index, self) =>
            index === self.findIndex((t) => t.value === item.value)
        )
      );
    }
  }, [isLoadingServices]);

  useEffect(() => {
    const findIndex = optionServices?.findIndex(
      (item) => item.value === serviceSelected
    );

    if (findIndex !== -1) {
      setShortDescription(optionServices[findIndex]?.short_description);
    }
  }, [serviceSelected]);

  const handlePopupScrollServices = (e: React.UIEvent<HTMLDivElement>) => {
    if (e && e.currentTarget) {
      const { scrollTop, scrollHeight, clientHeight } = e.currentTarget;
      if (
        scrollTop + clientHeight >= scrollHeight &&
        !isLoadingServices &&
        currentPageServices < (paginationServices?.pageCount || 1)
      ) {
        setCurrentPageServices(currentPageServices + 1);
      }
    }
  };
  return (
    <form
      className="flex flex-col gap-[1.6rem]"
      onSubmit={handleSubmit(onSubmit)}
    >
      <InputComponent
        label="Email khách hàng"
        name="customer_email"
        placeholder="Email khách hàng"
        control={control}
        errors={errors.customer_email}
        rules={formValidation.email}
        isRequired
      />
      <InputComponent
        label="Tên khách hàng"
        name="customer_full_name"
        placeholder="Tên khách hàng"
        control={control}
        errors={errors.customer_full_name}
        rules={formValidation.fullName}
        isRequired
      />
      <InputComponent
        label="Số điện thoại khách hàng"
        name="customer_phone"
        placeholder="Số điện thoại khách hàng"
        control={control}
        errors={errors.customer_phone}
        rules={formValidation.phone}
        isRequired
      />

      <DatePickerComponent
        // format={defaultKey.DATE_TIME_FORMAT}
        control={control}
        label="Ngày booking"
        name="date"
        placeholder="Ngày booking"
        errors={errors.date}
        rules={formValidation.date_booking}
        isRequired
      />
      <div className="flex flex-col gap-[1.2rem]">
        <SelectComponent
          label="Dịch dụ"
          name="service"
          placeholder="Dịch vụ"
          control={control}
          options={optionServices}
          onPopupScroll={handlePopupScrollServices}
        />
        <p className="text-[1.4rem] italic text-justify">
          {showAll ? shortDescription : shortDescription?.slice(0, 250)}

          {shortDescription && shortDescription?.length > 250 && (
            <p className="block text-center">
              <span
                className="text-[1.2rem] italic cursor-pointers underline"
                onClick={() => setShowAll(!showAll)}
              >
                {showAll ? "Thu gọn" : "Xem thêm"}
              </span>
            </p>
          )}
        </p>
      </div>

      <div className="flex flex-col justify-end items-end gap-[1.2rem] mt-[2.4rem]">
        <Divider className="mt-0" />
        <div className="flex justify-end items-center gap-[1.6rem]  w-[50%]">
          <ButtonComponent text="Hủy" onClick={handleCancel} />

          <ButtonComponent type="primary" htmlType="submit" text="Lưu" />
        </div>
      </div>
    </form>
  );
};

export default BookingForm;
