import axiosClient from ".";
import { BaseData } from "../types/base/baseData";
import { BaseRequest } from "../types/base/baseRequest";
import { BaseResponse } from "../types/base/baseResponse";
import { CategoryType } from "../types/response/category";
import urls from "../utils/constants/urls";
import queryString from "query-string";
const categoryApis = {
  getAll(params: BaseRequest) {
    const url = queryString.stringifyUrl({
      url: `${urls.CATEGORIES}`,
      query: params,
    });

    return axiosClient.get<BaseResponse<BaseData<CategoryType>[]>>(url);
  },
};

export default categoryApis;
