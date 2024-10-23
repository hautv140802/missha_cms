import { useQuery } from "@tanstack/react-query";
import { BaseRequest } from "../../types/base/baseRequest";
import productsApis from "../../apis/productApis";

export function useQueryProducts(params?: BaseRequest) {
  const { data, isLoading, isFetched } = useQuery({
    queryKey: ["products_getAll", params],
    queryFn: () => productsApis.getAll(params),
  });

  return {
    data: data?.data?.data || [],
    pagination: data?.data?.meta?.pagination || {},
    isLoading,
    isFetched,
  };
}
