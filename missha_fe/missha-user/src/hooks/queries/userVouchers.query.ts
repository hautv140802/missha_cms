import { useQuery } from "@tanstack/react-query";
import { UserVoucherRequestType } from "../../types/request/user";
import userApis from "../../apis/userApis";

export function useQueryUserVouchers(params: UserVoucherRequestType) {
  const { data, isLoading, isFetched } = useQuery({
    queryKey: ["user_vouchers"],
    queryFn: () => userApis.getUserVoucher(params),
  });

  return {
    data: data?.data?.data || [],
    pagination: data?.data?.meta?.pagination || {},
    isLoading,
    isFetched,
  };
}
