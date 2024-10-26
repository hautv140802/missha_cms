import { BaseRequest } from "../base/baseRequest";

export type productRequestType = BaseRequest & {
  "filters[product_line][slug]"?: string[];
  "filters[skin_properties][slug]"?: string[];
  "filters[$and][0][sale_price][$gte]"?: string;
  "filters[$and][1][sale_price][$lte]"?: string;
  "filters[categories][slug]"?: string;
};
