import queryString from "query-string";
import { BaseRequest } from "../types/base/baseRequest";
import urls from "../utils/constants/urls";
import axiosClient from ".";
import { BaseResponse } from "../types/base/baseResponse";
import { BaseData } from "../types/base/baseData";
import { ProductLineType } from "../types/response/productLine";

const productLineApis = {
  getAll(params: BaseRequest) {
    const url = queryString.stringifyUrl({
      url: `${urls.PRODUCT_LINES}`,
      query: params,
    });

    return axiosClient.get<BaseResponse<BaseData<ProductLineType>[]>>(url);
  },
};

export default productLineApis;
