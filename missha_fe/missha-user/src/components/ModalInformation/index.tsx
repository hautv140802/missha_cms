import { useEffect, useState } from "react";
import { SubmitHandler, useForm } from "react-hook-form";
import ModalComponent from "../Modal";
import {
  AddressType,
  DistrictType,
  WardType,
} from "../../types/response/address";
import addressApis from "../../apis/addressApis";
import toast from "react-hot-toast";
import sliptAddress from "../../utils/functions/sliptAddress";
import InputComponent from "../Input";
import formValidation from "../../utils/constants/formValidations";
import SelectComponent from "../Select";
import { Divider } from "antd";
import ButtonComponent from "../Button";
import { ReceivedInformationType } from "../../types/common/receivedInformation";
export type FormInformationType = {
  full_name: string;
  phone: string;
  email: string;
  city: string;
  district: string;
  ward: string;
  address: string;
};

interface IModalInformationProps {
  openModal: boolean;
  handleCancelModal: () => void;
  receivedInformation?: ReceivedInformationType;
  setReceivedInformation: (_information: ReceivedInformationType) => void;
}
const ModalInformation = (props: IModalInformationProps) => {
  const {
    openModal,
    handleCancelModal,
    receivedInformation,
    setReceivedInformation,
  } = props;
  const [dataAddress, setDataAddress] = useState<AddressType>([]);
  const [dataDistricts, setDataDistricts] = useState<DistrictType[]>([]);
  const [dataWards, setDataWards] = useState<WardType[]>([]);

  useEffect(() => {
    const fetchAddress = async () => {
      try {
        const resAddress = await addressApis.getAddress();

        if (resAddress) {
          setDataAddress(resAddress);
        }
      } catch (error) {
        toast.error("Lỗi, không thể lấy được danh sách địa chỉ");
        console.log(error);
      }
    };

    fetchAddress();
  }, []);

  const {
    control,
    handleSubmit,
    watch,
    reset,
    formState: { errors },
  } = useForm<FormInformationType>({
    mode: "onChange",
  });

  useEffect(() => {
    if (!openModal) return;
    const { address, ward, district, city } = sliptAddress(
      receivedInformation?.address
    );

    reset({
      ...receivedInformation,
      address,
      ward,
      district,
      city,
    });
  }, [openModal]);
  const [city, district] = watch(["city", "district"]);

  useEffect(() => {
    const findIndex = dataAddress?.findIndex((item) => item?.Name === city);

    if (findIndex !== -1) {
      setDataDistricts(dataAddress?.[findIndex]?.Districts);
    } else {
      setDataDistricts([]);
    }
  }, [city, dataAddress?.length]);

  useEffect(() => {
    const findIndex = dataDistricts?.findIndex(
      (item) => item?.Name === district
    );

    if (findIndex !== -1 && findIndex !== undefined) {
      setDataWards(dataDistricts?.[findIndex]?.Wards);
    } else {
      setDataWards([]);
    }
  }, [district, dataAddress?.length]);

  const onSubmit: SubmitHandler<FormInformationType> = (data) => {
    const address = [data?.address, data?.ward, data?.district, data?.city]
      .filter((item) => item)
      .join(", ");

    setReceivedInformation({
      ...data,
      address,
    });
  };
  return (
    <ModalComponent
      title="Thông tin nhận hàng"
      open={openModal}
      onCancel={handleCancelModal}
      closable
    >
      <form
        onSubmit={handleSubmit(onSubmit)}
        className="flex flex-col gap-[1.2rem]"
      >
        <InputComponent
          control={control}
          name="full_name"
          label="Họ và tên"
          placeholder="Họ và tên"
          errors={errors.full_name}
          rules={formValidation.full_name}
          isRequired
        />
        <InputComponent
          control={control}
          name="email"
          label="Email"
          placeholder="Email"
          errors={errors.email}
          rules={formValidation.email}
          isRequired
        />

        <InputComponent
          control={control}
          name="phone"
          label="Số điện thoại"
          placeholder="Số điện thoại"
          errors={errors.phone}
          rules={formValidation.phone}
          isRequired
        />

        <div className="grid grid-cols-3 gap-[1.2rem] mb-[0.6rem]">
          <SelectComponent
            control={control}
            name="city"
            label="Tỉnh/TP"
            options={dataAddress.map((city) => ({
              value: city.Name,
              label: city.Name,
            }))}
            placeholder="Tỉnh/TP"
            isRequired
            errors={errors.city}
            rules={formValidation.city}
          />
          <SelectComponent
            control={control}
            name="district"
            label="Quận/Huyện"
            options={dataDistricts?.map((district) => ({
              value: district?.Name,
              label: district?.Name,
            }))}
            placeholder="Quận/Huyện"
            isRequired
            errors={errors.district}
            rules={formValidation.district}
          />
          <SelectComponent
            control={control}
            name="ward"
            label="Phường/Xã"
            options={dataWards?.map((ward) => ({
              value: ward?.Name,
              label: ward?.Name,
            }))}
            placeholder="Phường/Xã"
            isRequired
            errors={errors.ward}
            rules={formValidation.ward}
          />
        </div>
        <InputComponent
          control={control}
          name="address"
          label="Địa chỉ chi tiết"
          placeholder="Địa chỉ"
        />
        <div className="flex flex-col justify-start items-end">
          <Divider />
          <div className="w-[50%] flex justify-end items-center gap-[1.2rem]">
            <ButtonComponent
              type="text"
              text="Hủy"
              className="!border !border-solid !border-[rgba(0,0,0,0.87)]"
              textClassName="text-inherit text-[1.6rem] font-[500]"
              onClick={handleCancelModal}
            />
            <ButtonComponent
              htmlType="submit"
              type="primary"
              text="Cập nhật"
              textClassName="text-inherit text-[1.6rem] font-[500]"
            />
          </div>
        </div>
      </form>
    </ModalComponent>
  );
};

export default ModalInformation;
