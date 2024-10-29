import { BaseData } from '../../../../missha-user/src/types/base/baseData';
import { UserType } from '../../../../missha-user/src/types/common/user';
import { VoucherType } from '../../../../missha-user/src/types/response/voucher';

export type UserVoucherType = {
  user: {
    data: BaseData<UserType>;
  };
  voucher: {
    data: BaseData<VoucherType>;
  };
  status: string;
  createdAt: string;
  updatedAt: string;
};
