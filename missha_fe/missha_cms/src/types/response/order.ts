import { BaseData } from '../base/baseData';
import { UserType } from './user';
import { VoucherResponseType } from './voucher';

export type OrderResponseType = {
  customer_email: string;
  customer_full_name: string;
  customer_phone: string;
  shipping_address: string;
  shipping_method: string;
  payment_method: string;
  total: number;
  status: string;
  transport_fee: number;
  order_code: string;
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
  user: {
    data: BaseData<UserType>;
  };

  voucher: {
    data: BaseData<VoucherResponseType>;
  };
};
