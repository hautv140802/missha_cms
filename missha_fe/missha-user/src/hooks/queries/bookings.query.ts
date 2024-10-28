import { useQuery } from "@tanstack/react-query";
import { BaseRequest } from "../../types/base/baseRequest";
import bookingApis from "../../apis/bookingApis";

export function useQueryBookings(params: BaseRequest) {
  const { data, isLoading, isFetched } = useQuery({
    queryKey: ["booking_getAll", params],
    queryFn: () => bookingApis.getAll(params),
  });

  return {
    data: data?.data?.data || [],
    pagination: data?.data?.meta?.pagination || {},
    isLoading,
    isFetched,
  };
}
