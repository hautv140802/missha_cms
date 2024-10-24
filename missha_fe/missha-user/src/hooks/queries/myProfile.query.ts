import { useQuery } from "@tanstack/react-query";
import userApis from "../../apis/userApis";

export function useQueryMyProfile() {
  const { data, isLoading, isFetched } = useQuery({
    queryKey: ["myProfile"],
    queryFn: () => userApis.myProfile(),
  });

  return {
    data: data?.data || null,
    isLoading,
    isFetched,
  };
}
