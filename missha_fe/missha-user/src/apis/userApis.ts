import queryString from "query-string";
import axiosClient from ".";
import { BaseRequest } from "../types/base/baseRequest";
import { UserType } from "../types/common/user";
import { RegisterType, UserLoginType } from "../types/request/user";
import { UserLoginResponseType, UserVoucherType } from "../types/response/user";
import urls from "../utils/constants/urls";
import { BaseResponse } from "../types/base/baseResponse";
import { BaseData } from "../types/base/baseData";
import { UserVoucherBodyType } from "../types/request/userVoucher";

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

  getUserVoucher(params: BaseRequest) {
    const url = queryString.stringifyUrl({
      url: `${urls.USER_VOUCHERS}`,
      query: params,
    });
    return axiosClient.get<BaseResponse<BaseData<UserVoucherType>[]>>(url);
  },

  update(id: number, body: RegisterType) {
    return axiosClient.put<UserType>(`${urls.USERS}/${id}`, body);
  },

  getCreateUserVoucher(body: UserVoucherBodyType) {
    return axiosClient.post(urls.USER_VOUCHERS, { data: body });
  },
};

export default userApis;
