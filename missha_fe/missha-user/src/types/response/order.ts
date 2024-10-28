import { BaseData } from "../base/baseData";
import { UserType } from "../common/user";
import { OrderDetailType } from "./orderDetail";

export type OrderType = {
  customer_email: string;
  customer_full_name: string;
  customer_phone: string;
  shipping_address: string;
  shipping_method: string;
  payment_method: string;
  total: string;
  status: string;
  user: {
    data: BaseData<UserType>;
  };
  voucher: string;
  transport_fee: string;
  reason: string;
  order_code: string;
  order_details: {
    data: BaseData<OrderDetailType>;
  };
};