import { BaseData } from '../base/baseData';
import { ProductResponseType } from './product';

export type ProductLineResponseType = {
  name: string;
  slug: string;
  createdAt: string;
  updatedAt: string;
  products: {
    data: BaseData<ProductResponseType>[];
  };
};
