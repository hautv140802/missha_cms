import { SubmitHandler, useForm } from "react-hook-form";
import InputComponent from "../components/Input";
import formValidation from "../utils/constants/formValidations";
import DatePickerComponent from "../components/DateTimePicker";
import SelectComponent from "../components/Select";
import ButtonComponent from "../components/Button";
import paths from "../utils/constants/paths";
import { useNavigate } from "react-router-dom";
import { RegisterType } from "../types/request/user";
import dayjs from "dayjs";
import userApis from "../apis/userApis";
import toast from "react-hot-toast";
import axios from "axios";
import images from "../assets/images";

type RegisterFormType = {
  username: string;
  email: string;
  full_name: string;
  password: string;
  password_confirm: string;
  phone: string;
  gender: string;
  city: string;
  district: string;
  ward: string;
  address: string;
  birthday: Date;
};
const Register = () => {
  const navigate = useNavigate();
  const {
    control,
    handleSubmit,
    watch,
    formState: { errors },
  } = useForm<RegisterFormType>({
    mode: "onChange",
  });

  const onSubmit: SubmitHandler<RegisterFormType> = async (data) => {
    console.log("data", data);
    const convertData: RegisterType = {
      ...data,
      birthday: dayjs(data?.birthday).format("YYYY-MM-DD"),
    };

    try {
      const resRegister = await userApis.register(convertData);
      if (resRegister) {
        toast.success("Đăng ký thành công!");
        navigate(paths.LOGIN);
      }
    } catch (error) {
      if (axios.isAxiosError(error)) {
        console.error("Error message:", error);
        toast.error(
          `Đăng ký thất bại: ${error?.response?.data?.error?.message}`
        );
      } else {
        console.error("Unexpected error:", error);
      }
    }
  };

  const password = watch("password");
  return (
    <div className="w-[140] flex flex-col justify-between gap-[2.4rem] mx-auto mt-[12.4rem] mb-[2.4rem] bg-white p-[2.4rem]">
      <p className="text-[2.4rem] font-[500] text-center w-full">
        Missha register
      </p>
      <div className="flex flex-row-reverse justify-between items-center gap-[2.4rem]">
        <form
          onSubmit={handleSubmit(onSubmit)}
          className="w-[50%] flex flex-col gap-[2.4rem] pr-[20rem]"
        >
          <div className="grid gird-cols-1 md:grid-cols-2 gap-[1.2rem]">
            <InputComponent
              control={control}
              name="username"
              label="Tài khoản"
              placeholder="Tài khoản"
              errors={errors.username}
              rules={formValidation.identifier}
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
              format={"MM/DD/YYYY"}
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
          </div>

          <InputComponent
            control={control}
            name="password"
            label="Mật khẩu"
            placeholder="Mật khẩu"
            isRequired
            errors={errors.password}
            rules={formValidation.password}
          />
          <InputComponent
            control={control}
            name="password_confirm"
            label="Xác nhận mật khẩu"
            placeholder="Xác nhận mật khẩu"
            isRequired
            errors={errors.password_confirm}
            rules={formValidation.passwordConfirm(password)}
          />
          <div className="flex flex-col justify-center items-center">
            <ButtonComponent
              type="primary"
              htmlType="submit"
              text="Đăng ký"
              className="!w-fit !p-[0.8rem_2.4rem]"
              textClassName="text-[1.6rem] text-white"
            />
            <p className="text-[1.4rem] text-center mt-[2.4rem]">
              Bạn đã có tài khoản?{" "}
              <span
                className="text-[#ff9900] cursor-pointer font-[500]"
                onClick={() => navigate(paths.LOGIN)}
              >
                {" "}
                Đăng nhập ngay!
              </span>
            </p>
          </div>
        </form>
        <div className="w-[50%] h-[60rem] pl-[20rem]">
          <img src={images.treatment_2} className="w-full h-full" />
        </div>
      </div>
    </div>
  );
};

export default Register;
