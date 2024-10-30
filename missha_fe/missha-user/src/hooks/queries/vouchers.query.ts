import { useQuery } from "@tanstack/react-query";
import { BaseRequest } from "../../types/base/baseRequest";
import voucherApis from "../../apis/voucherApis";

export function useQueryVouchers(params: BaseRequest, updateFlag?: string) {
  const { data, isLoading, isFetched } = useQuery({
    queryKey: ["vouchers_getAll", params, updateFlag],
    queryFn: () => voucherApis.getAll(params),
  });

  return {
    data: data?.data?.data || [],
    pagination: data?.data?.meta?.pagination || null,
    isLoading,
    isFetched,
  };
}
