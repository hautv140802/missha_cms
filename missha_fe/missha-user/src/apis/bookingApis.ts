import urls from "../utils/constants/urls";
import axiosClient from ".";
import { BaseResponse } from "../types/base/baseResponse";
import { BaseData } from "../types/base/baseData";
import { BookingRequestType } from "../types/request/booking";
import { BookingType } from "../types/response/booking";

const bookingApis = {
  create(body: BookingRequestType) {
    return axiosClient.post<BaseResponse<BaseData<BookingType>>>(
      `${urls.BOOKINGS}`,
      { data: body }
    );
  },
};

export default bookingApis;
