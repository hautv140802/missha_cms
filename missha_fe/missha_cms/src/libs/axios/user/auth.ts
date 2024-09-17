import { LoginRequestType } from '@/types/request/user';
import urls from '@/utils/constants/urls';
import axiosClient from '..';
import { UserLoginResponseType } from '@/types/response/user';

const authApi = {
  login(payload: LoginRequestType) {
    return axiosClient.post<UserLoginResponseType>(urls.LOGIN, payload);
  },
};

export default authApi;
