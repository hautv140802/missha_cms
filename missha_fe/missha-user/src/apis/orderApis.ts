import urls from "../utils/constants/urls";
import axiosClient from ".";
import { BaseResponse } from "../types/base/baseResponse";
import { BaseData } from "../types/base/baseData";
import { OrderTypeRequest } from "../types/request/order";
import { OrderType } from "../types/response/order";

const orderApis = {
  create(body: OrderTypeRequest) {
    return axiosClient.post<BaseResponse<BaseData<OrderType>>>(
      `${urls.ORDERS}`,
      { data: body }
    );
  },
};

export default orderApis;
