import { useQuery } from "@tanstack/react-query";
import { BaseRequest } from "../../types/base/baseRequest";

import productLineApis from "../../apis/productLineApis";
export function useQueryProductLines(params: BaseRequest) {
  const { data, isLoading, isFetched } = useQuery({
    queryKey: ["productLines_getAll"],
    queryFn: () => productLineApis.getAll(params),
  });

  return {
    data: data?.data?.data || [],
    pagination: data?.data?.meta?.pagination || {},
    isLoading,
    isFetched,
  };
}
