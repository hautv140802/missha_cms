import { useQuery } from "@tanstack/react-query";
import { BaseRequest } from "../../types/base/baseRequest";
import orderApis from "../../apis/orderApis";

export function useQueryOrderBySlug(params: BaseRequest) {
  const { data, isLoading, isFetched } = useQuery({
    queryKey: ["order_by_slug", params],
    queryFn: () => orderApis.bySlug(params),
    enabled: !!params["filters[order_code]"],
  });

  return {
    data:
      data?.data?.data && data?.data?.data?.length > 0
        ? data?.data?.data[0]
        : null,
    isLoading,
    isFetched,
  };
}
