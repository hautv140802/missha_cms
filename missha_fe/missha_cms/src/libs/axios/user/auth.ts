import { LoginRequestType } from '@/types/request/user';
import { UserResponseType } from '@/types/response/user';
import urls from '@/utils/constants/urls';
import axiosClient from '..';

const authApi = {
  login(payload: LoginRequestType) {
    return axiosClient.post<UserResponseType>(urls.LOGIN, payload);
  },
};

export default authApi;
