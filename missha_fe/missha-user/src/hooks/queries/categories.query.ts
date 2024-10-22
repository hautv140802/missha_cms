import { useQuery } from "@tanstack/react-query";
import { BaseRequest } from "../../types/base/baseRequest";
import categoryApis from "../../apis/categoryApi";

export function useQueryCategories(params?: BaseRequest) {
  const { data, isLoading, isFetched } = useQuery({
    queryKey: ["categories_getAll"],
    queryFn: () => categoryApis.getAll(params),
  });

  return {
    data: data?.data?.data || [],
    pagination: data?.data?.meta?.pagination || {},
    isLoading,
    isFetched,
  };
}
