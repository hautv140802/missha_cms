import urls from "../utils/constants/urls";
import axiosClient from ".";
import { BaseResponse } from "../types/base/baseResponse";
import { BaseData } from "../types/base/baseData";
import { BookingRequestType } from "../types/request/booking";
import { BookingType } from "../types/response/booking";
import { BaseRequest } from "../types/base/baseRequest";
import queryString from "query-string";

const bookingApis = {
  create(body: BookingRequestType) {
    return axiosClient.post<BaseResponse<BaseData<BookingType>>>(
      `${urls.BOOKINGS}`,
      { data: body }
    );
  },

  getAll(params: BaseRequest) {
    const url = queryString.stringifyUrl({
      url: urls.BOOKINGS,
      query: params,
    });

    return axiosClient.get<BaseResponse<BaseData<BookingType>[]>>(url);
  },
};

export default bookingApis;
