import queryString from "query-string";
import { BaseRequest } from "../types/base/baseRequest";
import urls from "../utils/constants/urls";
import axiosClient from ".";
import { BaseResponse } from "../types/base/baseResponse";
import { BaseData } from "../types/base/baseData";
import { SkinPropertyType } from "../types/response/skinProperty";

const skinPropertyApis = {
  getAll(params: BaseRequest) {
    const url = queryString.stringifyUrl({
      url: `${urls.SKIN_PROPERTIES}`,
      query: params,
    });

    return axiosClient.get<BaseResponse<BaseData<SkinPropertyType>[]>>(url);
  },
};

export default skinPropertyApis;
