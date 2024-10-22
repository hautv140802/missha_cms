import { BaseData } from "../base/baseData";
import { MediaType } from "../common/media";
import { ProductType } from "./product";

export type CategoryType = {
  name: string;
  slug: string;
  createdAt: string;
  updatedAt: string;
  banner: {
    data: BaseData<MediaType>;
  };
  products: {
    data: BaseData<ProductType>[];
  };
};
