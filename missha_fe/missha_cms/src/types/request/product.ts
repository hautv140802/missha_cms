import { BaseID } from '../base/baseID';

export type ProductRequestType = {
  name: string;
  price?: number;
  sale_price: number;
  description?: any;
  categories?: BaseID[];
  avatar?: number;
  gallery?: number[];
  product_line?: BaseID;
  skin_properties?: BaseID[];
};
