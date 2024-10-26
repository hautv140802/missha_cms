import { useQuery } from "@tanstack/react-query";
import productsApis from "../../apis/productApis";
import { productRequestType } from "../../types/request/product";

export function useQueryProducts(params: productRequestType) {
  const { data, isLoading, isFetched } = useQuery({
    queryKey: ["products_getAll", params],
    queryFn: () => productsApis.getAll(params),
  });

  return {
    data: data?.data?.data || [],
    pagination: data?.data?.meta?.pagination || null,
    isLoading,
    isFetched,
  };
}
