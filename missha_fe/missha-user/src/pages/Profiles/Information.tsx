import { SubmitHandler, useForm } from "react-hook-form";
import ButtonComponent from "../../components/Button";
import DatePickerComponent from "../../components/DateTimePicker";
import InputComponent from "../../components/Input";
import SelectComponent from "../../components/Select";
import formValidation from "../../utils/constants/formValidations";
import { getUserProfile } from "../../utils/functions/getUserInfo";
import { useEffect, useState } from "react";
import sliptAddress from "../../utils/functions/sliptAddress";
import addressApis from "../../apis/addressApis";
import {
  AddressType,
  DistrictType,
  WardType,
} from "../../types/response/address";
import toast from "react-hot-toast";
import userApis from "../../apis/userApis";
import axios from "axios";
import dayjs from "dayjs";
import variables from "../../utils/constants/variables";

type FormUserType = {
  username: string;
  email: string;
  full_name: string;
  phone: string;
  birthday: string;
  gender: string;
  city: string;
  district: string;
  ward: string;
  address: string;
};
const Information = () => {
  const user = getUserProfile() || {};
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
    reset,
    watch,
    formState: { errors },
  } = useForm<FormUserType>({
    mode: "onChange",
  });
  const [city, district] = watch(["city", "district"]);
  useEffect(() => {
    const { address, ward, district, city } = sliptAddress(user.address);

    reset({
      ...user,
      city: city,
      district: district,
      ward: ward,
      address: address,
    });
  }, []);

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

  const onSubmit: SubmitHandler<FormUserType> = async (data) => {
    if (!user?.id) {
      return;
    }
    try {
      const address = [data?.address, data?.ward, data?.district, data?.city]
        .filter((item) => item)
        .join(", ");

      const resUser = await userApis.update(user?.id, {
        ...data,
        address: address,
        birthday: dayjs(data?.birthday).format("YYYY-MM-DD"),
      });

      if (resUser?.data) {
        toast.success("Cập nhật thông tin cá nhân thành công!");
        localStorage.setItem(variables.PROFILE, JSON.stringify(resUser?.data));
      }
    } catch (error) {
      console.log(error);
      if (axios.isAxiosError(error)) {
        toast.error(
          `Cập nhật thông tin thất bại: ${
            error?.response?.data?.error?.message || error?.message
          }`
        );
      } else {
        toast.error(`Cập nhật thông tin thất bại: ${error}`);
      }
    }
  };
  return (
    <div className="w-ful p-[2.4rem] bg-white">
      <p className="text-[1.6rem] font-[500] uppercase">Thông tin cá nhân</p>
      <form
        onSubmit={handleSubmit(onSubmit)}
        className="w-[60rem] mx-auto my-[2.4rem] flex flex-col gap-[2.4rem]"
      >
        <div className="grid gird-cols-1 md:grid-cols-2 gap-[1.2rem]">
          <InputComponent
            control={control}
            name="username"
            label="Tài khoản"
            disabled
            placeholder="Tài khoản"
          />
          <InputComponent
            control={control}
            name="email"
            label="Email"
            disabled
            placeholder="Email"
          />
        </div>
        <div className="grid gird-cols-1 md:grid-cols-2 gap-[1.2rem] mt-[1.2rem]">
          <InputComponent
            control={control}
            name="full_name"
            label="Họ và tên"
            placeholder="Họ và tên"
            isRequired
            errors={errors.full_name}
            rules={formValidation.full_name}
          />
          <InputComponent
            control={control}
            name="phone"
            label="Số điện thoại"
            placeholder="Số điện thoại"
            isRequired
            errors={errors.phone}
            rules={formValidation.phone}
          />
        </div>
        <div className="grid gird-cols-1 md:grid-cols-2 gap-[1.2rem]">
          <DatePickerComponent
            control={control}
            name="birthday"
            label="Ngày sinh"
            placeholder="Ngày sinh"
            isRequired
            errors={errors.birthday}
            rules={formValidation.birthday}
            showTime={false}
          />
          <SelectComponent
            control={control}
            name="gender"
            label="Gới tính"
            options={[
              {
                value: "female",
                label: "Nữ",
              },
              {
                value: "male",
                label: "Nam",
              },
            ]}
            placeholder="Giới tính"
            isRequired
            errors={errors.gender}
            rules={formValidation.gender}
          />
          <div className="w-[60rem] grid grid-cols-3 gap-[1.2rem] mt-[1.2rem]">
            <SelectComponent
              control={control}
              name="city"
              label="Tỉnh/TP"
              options={dataAddress?.map((item) => ({
                value: item?.Name,
                label: item?.Name,
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
              options={dataDistricts?.map((item) => ({
                value: item?.Name,
                label: item?.Name,
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
              options={dataWards?.map((item) => ({
                value: item?.Name,
                label: item?.Name,
              }))}
              placeholder="Phường/Xã"
              isRequired
              errors={errors.ward}
              rules={formValidation.ward}
            />
          </div>
        </div>
        <InputComponent
          control={control}
          name="address"
          label="Địa chỉ chi tiết"
          placeholder="Địa chỉ"
        />
        <div className="flex justify-center items-center">
          <ButtonComponent
            type="primary"
            htmlType="submit"
            text="Cập nhật"
            className="!w-fit !p-[0.8rem_2.4rem]"
            textClassName="text-[1.6rem] text-white"
          />
        </div>
      </form>
    </div>
  );
};

export default Information;
