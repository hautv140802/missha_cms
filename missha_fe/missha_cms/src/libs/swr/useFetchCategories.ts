import queryString from 'query-string';
import useSWR from 'swr';

import { fetcher } from './fetcher';
import urls from '@/utils/constants/urls';
import { CategoryResponseType } from '@/types/response/category';
import { BaseData } from '@/types/base/baseData';
import { BaseResponse } from '@/types/base/baseResponse';
import { BaseParamsRequestType } from '@/types/base/baseParamsRequest';

export const useFetchCategories = (params: BaseParamsRequestType) => {
  const url = queryString.stringifyUrl({
    url: `${urls.CATEGORIES}`,
    query: params,
  });

  const { data, isLoading, error, mutate } = useSWR<
    BaseResponse<BaseData<CategoryResponseType>[]>
  >(url, fetcher);

  return {
    data: data?.data || [],
    pagination: data?.meta.pagination,
    isLoading,
    error,
    mutate,
  };
};
