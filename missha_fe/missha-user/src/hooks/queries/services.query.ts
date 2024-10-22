import { useQuery } from "@tanstack/react-query";
import { BaseRequest } from "../../types/base/baseRequest";
import serviceApis from "../../apis/serviceApis";

export function useQueryServices(params?: BaseRequest) {
  const { data, isLoading, isFetched } = useQuery({
    queryKey: ["services_getAll"],
    queryFn: () => serviceApis.getAll(params),
  });

  return {
    data: data?.data?.data || [],
    pagination: data?.data?.meta?.pagination || {},
    isLoading,
    isFetched,
  };
}
