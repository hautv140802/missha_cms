import axiosClient from ".";
import { BaseData } from "../types/base/baseData";
import { BaseRequest } from "../types/base/baseRequest";
import { BaseResponse } from "../types/base/baseResponse";
import { ProductType } from "../types/response/product";
import urls from "../utils/constants/urls";
import queryString from "query-string";
const productsApis = {
  getAll(params?: BaseRequest) {
    const url = queryString.stringifyUrl({
      url: `${urls.PRODUCTS}`,
      query: params,
    });

    return axiosClient.get<BaseResponse<BaseData<ProductType>[]>>(url);
  },
};

export default productsApis;
