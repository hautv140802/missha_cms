import { BaseData } from "../base/baseData";
import { OrderType } from "./order";
import { ProductType } from "./product";

export type OrderDetailType = {
  product: {
    data: BaseData<ProductType>;
  };
  order: {
    data: BaseData<OrderType>;
  };
};
