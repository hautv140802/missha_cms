import queryString from 'query-string';
import useSWR from 'swr';
import { fetcher } from './fetcher';
import urls from '@/utils/constants/urls';
import { BaseData } from '@/types/base/baseData';
import { BaseResponse } from '@/types/base/baseResponse';
import { BaseParamsRequestType } from '@/types/base/baseParamsRequest';
import { BookingResponseType } from '@/types/response/booking';

export const useFetchBookings = (params: BaseParamsRequestType) => {
  const url = queryString.stringifyUrl({
    url: `${urls.BOOKINGS}`,
    query: params,
  });

  const { data, isLoading, error, mutate, isValidating } = useSWR<
    BaseResponse<BaseData<BookingResponseType>[]>
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
