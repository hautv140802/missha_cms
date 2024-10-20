import { SubmitHandler, useForm } from "react-hook-form";
import ButtonComponent from "../../components/Button";
import DatePickerComponent from "../../components/DateTimePicker";
import InputComponent from "../../components/Input";
import SelectComponent from "../../components/Select";
import formValidation from "../../utils/constants/formValidations";

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
  const {
    control,
    handleSubmit,
    formState: { errors },
  } = useForm<FormUserType>({
    mode: "onChange",
  });

  const onSubmit: SubmitHandler<FormUserType> = async (data) => {
    console.log("form user data", data);
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
                label: "Name",
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
              options={[]}
              placeholder="Tỉnh/TP"
              isRequired
              errors={errors.city}
              rules={formValidation.city}
            />
            <SelectComponent
              control={control}
              name="district"
              label="Quận/Huyện"
              options={[]}
              placeholder="Quận/Huyện"
              isRequired
              errors={errors.district}
              rules={formValidation.district}
            />
            <SelectComponent
              control={control}
              name="ward"
              label="Phường/Xã"
              options={[]}
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
