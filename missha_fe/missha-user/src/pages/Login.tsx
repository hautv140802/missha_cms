import { Divider } from "antd";
import InputComponent from "../components/Input";
import ButtonComponent from "../components/Button";
import images from "../assets/images";
import { SubmitHandler, useForm } from "react-hook-form";
import { UserLoginType } from "../types/request/user";
import formValidation from "../utils/constants/formValidations";
import userApis from "../apis/userApis";
import variables from "../utils/constants/variables";
import toast from "react-hot-toast";
import axios from "axios";
import { useLocation, useNavigate } from "react-router-dom";
import paths from "../utils/constants/paths";
import { getAccessToken } from "../utils/functions/getUserInfo";
import { useEffect } from "react";

const Login = () => {
  const navigate = useNavigate();
  const { search } = useLocation();

  const queryParams = new URLSearchParams(search);
  const redirectUrl = queryParams.get(variables.REDIRECT_URL);

  const access_token = getAccessToken();

  const {
    control,
    handleSubmit,

    formState: { errors },
  } = useForm<UserLoginType>({
    mode: "onChange",
  });

  const onSubmit: SubmitHandler<UserLoginType> = async (data) => {
    try {
      const resLogin = await userApis.login(data);
      if (resLogin?.data?.jwt) {
        localStorage.setItem(variables.ACCESS_TOKEN, resLogin?.data?.jwt);
        localStorage.setItem(
          variables.PROFILE,
          JSON.stringify(resLogin?.data?.user)
        );
      }
      toast.success("Đăng nhập thành công, chuyển trang sau 3s!");

      if (redirectUrl) {
        navigate(redirectUrl);
      } else {
        navigate(paths.HOME);
      }
    } catch (error) {
      if (axios.isAxiosError(error)) {
        console.error("Error message:", error);
        toast.error(
          `Đăng nhập thất bại: ${error?.response?.data?.error?.message}`
        );
      } else {
        console.error("Unexpected error:", error);
      }
    }
  };

  useEffect(() => {
    if (access_token) {
      navigate(paths.HOME);
    }
  }, [access_token]);

  return (
    <div className="w-[140rem] flex justify-between gap-[2.4rem] mx-auto mt-[10rem] bg-[#f7f7f7] py-[2.4rem]">
      <div className="w-[50%] min-h-[60rem] bg-white h-full py-[10rem]">
        <p className="text-[2.4rem] font-[500] text-center">Missha login</p>
        <form
          onSubmit={handleSubmit(onSubmit)}
          className="w-[40rem] mx-auto flex flex-col justify-start gap-[1.6rem]"
        >
          <InputComponent
            control={control}
            name="identifier"
            label="Tài khoản"
            placeholder="Tài khoản"
            rules={formValidation.identifier}
            errors={errors.identifier}
          />
          <InputComponent
            name="password"
            label="Mật khẩu"
            placeholder="Mật khẩu"
            control={control}
            rules={formValidation.password}
            errors={errors.password}
          />
          <Divider className="my-0" />
          <div>
            <ButtonComponent
              htmlType="submit"
              type="primary"
              text="Đăng nhập"
            />

            <p className="text-[1.4rem] text-center mt-[2.4rem]">
              Bạn chưa có tài khoản?{" "}
              <span
                className="text-[#ff9900] cursor-pointer font-[500]"
                onClick={() => navigate(paths.REGISTER)}
              >
                Đăng ký ngay!
              </span>
            </p>
          </div>
        </form>
      </div>
      <div className="w-full h-[60rem]">
        <img src={images.treatment_2} className="w-full h-full" />
      </div>
    </div>
  );
};

export default Login;
