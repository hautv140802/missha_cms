/* eslint-disable no-console */
import { SubmitHandler, useForm } from 'react-hook-form';

import paths from '@/utils/constants/paths';
import variables from '@/utils/constants/variables';
import { useNavigate } from 'react-router-dom';
import { LoginRequestType } from '@/types/request/user';
import InputComponent from '@/components/common/Input';
import ButtonComponent from '@/components/common/Button';
import authApi from '@/libs/axios/user/auth';
import toast from 'react-hot-toast';

const Login = () => {
  const navigate = useNavigate();

  const {
    control,
    handleSubmit,
    formState: { errors },
  } = useForm<LoginRequestType>({
    defaultValues: {
      identifier: '',
      password: '',
    },
  });

  const onSubmit: SubmitHandler<LoginRequestType> = async data => {
    console.log('data login', data);
    await authApi
      .login(data)
      .then(res => {
        // if (res?.data?.user?.type === variables.ADMIN) {
        localStorage.setItem(variables.ACCESS_TOKEN, res?.data?.jwt);
        localStorage.setItem(variables.ROLE, res?.data?.user?.type);
        const user = res?.data?.user;
        localStorage.setItem(variables.PROFILE, JSON.stringify(user));
        toast.success('Đăng nhập thành công');
        navigate(paths.ORDERS);
        // } else {
        //   toast.error('Tài khoản không hợp lệ!');
        // }
      })
      .catch(e => {
        toast.error('Đăng nhập thất bại');
        console.log(e);
      });
  };

  return (
    <div className="w-[300px]">
      <div className="flex items-center justify-center">
        <h3 className="text-[2.4rem] font-bold">Login</h3>
      </div>
      <form onSubmit={handleSubmit(onSubmit)}>
        <div className="mt-[2.4rem] flex flex-col gap-[2.4rem]">
          <InputComponent
            control={control}
            label="Tài khoản"
            placeholder="Nhập tài khoản"
            name="identifier"
            errors={errors.identifier}
          />

          <InputComponent
            control={control}
            label="Mật khẩu"
            placeholder="Nhập mật khẩu"
            name="password"
            errors={errors.password}
            isPassword
          />
          <div className="flex justify-center">
            <ButtonComponent
              type="primary"
              htmlType="submit"
              text="Đăng nhập"
            />
          </div>
        </div>
      </form>
    </div>
  );
};

export default Login;
