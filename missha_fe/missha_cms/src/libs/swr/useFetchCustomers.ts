import queryString from 'query-string';
import useSWR from 'swr';
import { fetcher } from './fetcher';
import urls from '@/utils/constants/urls';

import { BaseParamsRequestType } from '@/types/base/baseParamsRequest';

export const useFetchCustomers = (params: BaseParamsRequestType) => {
  const url = queryString.stringifyUrl({
    url: `${urls.CUSTOMERS}`,
    query: params,
  });

  const { data, isLoading, error, mutate, isValidating } = useSWR<
    UserResponseType[]
  >(url, fetcher);

  return {
    data: data || [],
    isLoading,
    error,
    mutate,
    isValidating,
  };
};
