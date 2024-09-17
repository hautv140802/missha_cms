import queryString from 'query-string';
import useSWR from 'swr';
import { fetcher } from './fetcher';
import urls from '@/utils/constants/urls';
import { RolesResponseType } from '@/types/response/role';

export const useFetchRoles = () => {
  const { data, isLoading, error, mutate, isValidating } =
    useSWR<RolesResponseType>(urls.ROLE, fetcher);

  return {
    data: data?.roles || [],
    isLoading,
    error,
    mutate,
    isValidating,
  };
};
