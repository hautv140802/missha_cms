import { LoginRequestType } from '@/types/request/user';
import urls from '@/utils/constants/urls';
import axiosClient from '..';
import { RolesResponseType } from '@/types/response/role';

const roleApi = {
  role() {
    return axiosClient.get<RolesResponseType>(urls.ROLE);
  },
};

export default roleApi;
