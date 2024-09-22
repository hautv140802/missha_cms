import { BaseData } from '../base/baseData';
import { ProductResponseType } from './product';

export type OrderDetailResponseType = {
  unit_price: string;
  quantity: number;
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
  product: {
    data: BaseData<ProductResponseType>;
  };
};
