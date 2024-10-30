import axiosClient from ".";
import { BaseData } from "../types/base/baseData";
import { BaseRequest } from "../types/base/baseRequest";
import { BaseResponse } from "../types/base/baseResponse";
import { VoucherType } from "../types/response/voucher";
import urls from "../utils/constants/urls";
import queryString from "query-string";
const voucherApis = {
  getAll(params?: BaseRequest) {
    const url = queryString.stringifyUrl({
      url: `${urls.VOUCHERS}`,
      query: params,
    });

    return axiosClient.get<BaseResponse<BaseData<VoucherType>[]>>(url);
  },
};

export default voucherApis;
