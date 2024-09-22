import queryString from 'query-string';
import useSWR from 'swr';
import { fetcher } from './fetcher';
import urls from '@/utils/constants/urls';
import { BaseData } from '@/types/base/baseData';
import { BaseResponse } from '@/types/base/baseResponse';
import { BaseParamsRequestType } from '@/types/base/baseParamsRequest';
import { OrderDetailResponseType } from '@/types/response/orderDetail';

export const useFetchOrderDetails = (
  params: BaseParamsRequestType,
  orderID: number
) => {
  const url = queryString.stringifyUrl({
    url: `${urls.ORDER_DETAILS}`,
    query: {
      ...params,
      'filters[order]': orderID,
    },
  });

  const { data, isLoading, error, mutate, isValidating } = useSWR<
    BaseResponse<BaseData<OrderDetailResponseType>[]>
  >(url, fetcher);

  return {
    data: data?.data || [],
    pagination: data?.meta.pagination,
    isLoading,
    error,
    mutate,
    isValidating,
  };
};
