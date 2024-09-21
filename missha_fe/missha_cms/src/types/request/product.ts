import { BaseID } from '../base/baseID';

export type ProductRequestType = {
  name: string;
  price?: number;
  sale_price: number;
  descripton?: string;
  categories?: BaseID[];
  avatar?: number | null;
  gallery?: number[];
  product_line?: BaseID;
  skin_properties?: BaseID[];
};
