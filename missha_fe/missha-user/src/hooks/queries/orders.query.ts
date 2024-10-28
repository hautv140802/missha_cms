import { useQuery } from "@tanstack/react-query";
import { BaseRequest } from "../../types/base/baseRequest";
import orderApis from "../../apis/orderApis";

export function useQueryOrders(params: BaseRequest) {
  const { data, isLoading, isFetched } = useQuery({
    queryKey: ["order_getAll", params],
    queryFn: () => orderApis.getAll(params),
  });

  return {
    data: data?.data?.data || [],
    pagination: data?.data?.meta?.pagination || null,
    isLoading,
    isFetched,
  };
}
