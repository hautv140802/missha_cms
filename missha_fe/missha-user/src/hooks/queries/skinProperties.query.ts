import { useQuery } from "@tanstack/react-query";
import { BaseRequest } from "../../types/base/baseRequest";

import skinPropertyApis from "../../apis/skinPropertyApis";
export function useQuerySkinProperties(params: BaseRequest) {
  const { data, isLoading, isFetched } = useQuery({
    queryKey: ["skinProperties_getAll"],
    queryFn: () => skinPropertyApis.getAll(params),
  });

  return {
    data: data?.data?.data || [],
    pagination: data?.data?.meta?.pagination || {},
    isLoading,
    isFetched,
  };
}
