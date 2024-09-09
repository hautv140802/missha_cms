import queryString from 'query-string';
import useSWR from 'swr';

import { fetcher } from './fetcher';
import urls from '@/utils/constants/urls';
import { BaseData } from '@/types/base/baseData';
import { BaseResponse } from '@/types/base/baseResponse';
import { BaseParamsRequestType } from '@/types/base/baseParamsRequest';
import { ProductLineResponseType } from '@/types/response/productLine';

export const useFetchProductLines = (params: BaseParamsRequestType) => {
  const url = queryString.stringifyUrl({
    url: `${urls.PRODUCT_LINES}`,
    query: params,
  });

  const { data, isLoading, error, mutate } = useSWR<
    BaseResponse<BaseData<ProductLineResponseType>[]>
  >(url, fetcher);

  return {
    data: data?.data || [],
    pagination: data?.meta.pagination,
    isLoading,
    error,
    mutate,
  };
};
