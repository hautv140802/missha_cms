import { BaseID } from '@/types/base/baseID';

export type FormProductType = {
  name: string;
  slug?: string;
  price: number;
  sale_price: number;
  total_purchase?: number;
  description?: any;
  categories?: number[];
  avatar?: number;
  gallery?: number[];
  product_line?: number;
  skin_properties?: number[];
};
