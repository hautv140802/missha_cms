import { useQuery } from "@tanstack/react-query";
import productsApis from "../../apis/productApis";

export function useQueryProductBySlug(slug?: string) {
  const { data, isLoading, isFetched } = useQuery({
    queryKey: ["product_by_slug", slug],
    queryFn: () => productsApis.getBySlug(slug),
    enabled: !!slug,
  });

  return {
    data: data?.data?.data || null,
    isLoading,
    isFetched,
  };
}
