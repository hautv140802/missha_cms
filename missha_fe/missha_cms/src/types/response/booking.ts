import { BaseData } from '../base/baseData';
import { ServiceType } from './services';
import { UserResponseType } from './user';

export type BookingResponseType = {
  customer_email: string;
  customer_full_name: string;
  customer_phone: string;
  date: string;
  service: {
    data: BaseData<ServiceType>;
  };
  status: string;
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
  user: {
    data: BaseData<UserResponseType>;
  };
};
