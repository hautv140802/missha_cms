import axiosClient from ".";
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
};

export default userApis;
