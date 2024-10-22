import axiosClient from ".";
import { BaseData } from "../types/base/baseData";
import { BaseRequest } from "../types/base/baseRequest";
import { BaseResponse } from "../types/base/baseResponse";
import { ServiceType } from "../types/response/service";
import urls from "../utils/constants/urls";
import queryString from "query-string";
const serviceApis = {
  getAll(params?: BaseRequest) {
    const url = queryString.stringifyUrl({
      url: `${urls.SERVICES}`,
      query: params,
    });

    return axiosClient.get<BaseResponse<BaseData<ServiceType>[]>>(url);
  },
};

export default serviceApis;
