import { BaseRequest } from "../base/baseRequest";

export type UserLoginType = {
  identifier: string;
  password: string;
};

export type RegisterType = {
  username: string;
  email: string;
  password: string;
  gender: string;
  birthday: Date;
  phone: string;
  address: string;
};

export type UserVoucherRequestType = BaseRequest & {
  "filters[user]"?: number;
  "filters[status]"?: string;
};
