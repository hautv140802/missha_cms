import urls from "../utils/constants/urls";
import axiosClient from ".";
import { BaseResponse } from "../types/base/baseResponse";
import { BaseData } from "../types/base/baseData";
import { OrderDetailType } from "../types/response/orderDetail";
import { OrderDetailRequestType } from "../types/request/orderDetail";

const orderDetailApis = {
  create(body: OrderDetailRequestType) {
    return axiosClient.post<BaseResponse<BaseData<OrderDetailType>>>(
      `${urls.ORDER_DETAILS}`,
      { data: body }
    );
  },
};

export default orderDetailApis;
