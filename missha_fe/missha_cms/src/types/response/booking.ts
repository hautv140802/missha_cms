import { BaseData } from '../base/baseData';
import { UserResponseType } from './user';

export type BookingResponseType = {
  customer_email: string;
  customer_full_name: string;
  customer_phone: string;
  date: string;
  services: string;
  status: string;
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
  user: {
    data: BaseData<UserResponseType>;
  };
};
