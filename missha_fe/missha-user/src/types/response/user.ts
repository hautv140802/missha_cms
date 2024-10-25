import { BaseData } from "../base/baseData";
import { UserType } from "../common/user";
import { VoucherType } from "./voucher";

export type UserLoginResponseType = {
  jwt: string;
  user: UserType;
};

export type UserVoucherType = {
  status: string;
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
  user: {
    data: BaseData<UserType>;
  };
  voucher: {
    data: BaseData<VoucherType>;
  };
};
