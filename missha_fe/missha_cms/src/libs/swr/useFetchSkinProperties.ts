import queryString from 'query-string';
import useSWR from 'swr';
import { fetcher } from './fetcher';
import urls from '@/utils/constants/urls';
import { BaseData } from '@/types/base/baseData';
import { BaseResponse } from '@/types/base/baseResponse';
import { BaseParamsRequestType } from '@/types/base/baseParamsRequest';
import { SkinPropertiesResponseType } from '@/types/response/product';

export const useFetchSkinProperties = (params: BaseParamsRequestType) => {
  const url = queryString.stringifyUrl({
    url: `${urls.SKIN_PROPERTIES}`,
    query: params,
  });

  const { data, isLoading, error, mutate } = useSWR<
    BaseResponse<BaseData<SkinPropertiesResponseType>[]>
  >(url, fetcher);

  return {
    data: data?.data || [],
    pagination: data?.meta.pagination,
    isLoading,
    error,
    mutate,
  };
};
