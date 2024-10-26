import axiosClient from ".";
import { BaseData } from "../types/base/baseData";
import { BaseResponse } from "../types/base/baseResponse";
import { productRequestType } from "../types/request/product";
import { ProductType } from "../types/response/product";
import urls from "../utils/constants/urls";
import queryString from "query-string";
const productsApis = {
  getAll(params: productRequestType) {
    const url = queryString.stringifyUrl({
      url: `${urls.PRODUCTS}`,
      query: params,
    });

    return axiosClient.get<BaseResponse<BaseData<ProductType>[]>>(url);
  },

  getBySlug(slug?: string) {
    return axiosClient.get<BaseResponse<BaseData<ProductType>>>(
      `${urls.PRODUCT_BY_SLUG}/${slug}?populate=deep, 3`
    );
  },
  getMaxPrice() {
    return axiosClient.get<BaseResponse<BaseData<ProductType>[]>>(
      `${urls.PRODUCTS}?sort=price:desc`
    );
  },
};

export default productsApis;
