import queryString from 'query-string';
import useSWR from 'swr';
import { fetcher } from './fetcher';
import urls from '@/utils/constants/urls';
import { BaseData } from '@/types/base/baseData';
import { BaseResponse } from '@/types/base/baseResponse';
import { BaseParamsRequestType } from '@/types/base/baseParamsRequest';
import { VoucherResponseType } from '@/types/response/voucher';

export const useFetchVouchers = (params: BaseParamsRequestType) => {
  const url = queryString.stringifyUrl({
    url: `${urls.VOUCHERS}`,
    query: params,
  });

  const { data, isLoading, error, mutate, isValidating } = useSWR<
    BaseResponse<BaseData<VoucherResponseType>[]>
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
