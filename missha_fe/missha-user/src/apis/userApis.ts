import axiosClient from ".";
import { UserType } from "../types/common/user";
import { RegisterType, UserLoginType } from "../types/request/user";
import { UserLoginResponseType } from "../types/response/user";
import urls from "../utils/constants/urls";

const userApis = {
  login(body: UserLoginType) {
    return axiosClient.post<UserLoginResponseType>(urls.LOGIN, body);
  },

  register(body: RegisterType) {
    return axiosClient.post<UserLoginResponseType>(urls.REGISTER, body);
  },

  myProfile() {
    return axiosClient.get<UserType>(urls.MY_PROFILE);
  },
};

export default userApis;
