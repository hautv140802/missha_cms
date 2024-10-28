import { BaseData } from "../base/baseData";
import { UserType } from "../common/user";
import { ServiceType } from "./service";

export type BookingType = {
  user: {
    data: BaseData<UserType>;
  };
  customer_email: string;
  customer_full_name: string;
  customer_phone: string;
  date: string;
  status: string;
  service: {
    data: BaseData<ServiceType>;
  };
  updatedAt: string;
  createdAt: string;
};
