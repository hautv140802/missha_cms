import { BaseData } from "../base/baseData";
import { MediaType } from "../common/media";
import { CategoryType } from "./category";
import { ProductLineType } from "./productLine";
import { SkinPropertyType } from "./skinProperty";

export type ProductType = {
  name: string;
  slug: string;
  price: number;
  sale_price: number;
  total_purchase: number;
  description: string;
  gallery: {
    data: BaseData<MediaType>[];
  };
  avatar: {
    data: BaseData<MediaType>;
  };
  product_line: {
    data: BaseData<ProductLineType>;
  };
  skin_properties: {
    data: BaseData<SkinPropertyType>[];
  };
  categories: {
    data: BaseData<CategoryType>[];
  };
  createdAt: string;
  updatedAt: string;
};
