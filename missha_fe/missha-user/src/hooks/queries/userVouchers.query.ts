import { useQuery } from "@tanstack/react-query";
import { UserVoucherRequestType } from "../../types/request/user";
import userApis from "../../apis/userApis";

export function useQueryUserVouchers(
  params: UserVoucherRequestType,
  updateFlag?: string
) {
  const { data, isLoading, isFetched } = useQuery({
    queryKey: ["user_vouchers", params, updateFlag],
    queryFn: () => userApis.getUserVoucher(params),
  });

  return {
    data: data?.data?.data || [],
    pagination: data?.data?.meta?.pagination || null,
    isLoading,
    isFetched,
  };
}
