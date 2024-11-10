import urls from "../utils/constants/urls";
import axiosClient from ".";
import { BaseResponse } from "../types/base/baseResponse";
import { BaseData } from "../types/base/baseData";
import { OrderTypeRequest } from "../types/request/order";
import { OrderType } from "../types/response/order";
import { BaseRequest } from "../types/base/baseRequest";
import queryString from "query-string";

const orderApis = {
  getAll(params: BaseRequest) {
    const url = queryString.stringifyUrl({
      url: urls.ORDERS,
      query: params,
    });

    return axiosClient.get<BaseResponse<BaseData<OrderType>[]>>(url);
  },
  create(body: OrderTypeRequest) {
    return axiosClient.post<BaseResponse<BaseData<OrderType>>>(
      `${urls.ORDERS}`,
      { data: body }
    );
  },

  get(id: string) {
    return axiosClient.get<BaseResponse<BaseData<OrderType>>>(
      `${urls.ORDERS}/${id}?populate=deep, 5`
    );
  },
  update(id: number, status: string) {
    return axiosClient.put<BaseResponse<BaseData<OrderType>>>(
      `${urls.ORDERS}/${id}`,
      {
        data: {
          status,
        },
      }
    );
  },

  bySlug(params: BaseRequest) {
    const url = queryString.stringifyUrl({
      url: `${urls.ORDERS}`,
      query: params,
    });

    return axiosClient.get<BaseResponse<BaseData<OrderType>[]>>(url);
  },
};

export default orderApis;
