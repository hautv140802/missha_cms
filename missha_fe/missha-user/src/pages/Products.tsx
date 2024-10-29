import { useSearchParams } from "react-router-dom";
import QuickFilterComponent from "../components/Filter/QuickFilter";
import { useQueryCategories } from "../hooks/queries/categories.query";
import { useQueryProducts } from "../hooks/queries/products.query";
import WrapperFilter from "../components/Pages/Product/WrapperFilter";
import { useEffect, useState } from "react";
import { ProductType } from "../types/response/product";
import { BaseData } from "../types/base/baseData";
import WrapperProducts from "../components/Pages/Product/WrapperProducts";

const Products = () => {
  const [currentProducts, setCurrentProducts] = useState<
    BaseData<ProductType>[]
  >([]);
  const [firstLoad, setFirstLoad] = useState(true);
  const [currentPage, setCurrentPage] = useState<number>(1);
  const { data: dataCategories } = useQueryCategories({ populate: "deep, 3" });
  const [searchParams] = useSearchParams();

  const s_product_lines = searchParams.getAll("product_lines");
  const s_skin_properties = searchParams.getAll("skin_properties");
  const s_min_price = searchParams.get("min_price");
  const s_max_price = searchParams.get("max_price");
  const s_categories = searchParams.get("categories");
  const s_sort = searchParams.get("sort");

  const {
    data: dataProducts,
    isLoading: isLoadingProducts,
    pagination: paginationProducts,
    isFetched: isFetchedProducts,
  } = useQueryProducts({
    populate: "deep, 3",
    "filters[product_line][slug]": s_product_lines,
    "filters[skin_properties][slug]": s_skin_properties,
    "filters[$and][0][sale_price][$gte]": s_min_price || undefined,
    "filters[$and][1][sale_price][$lte]": s_max_price || undefined,
    "filters[categories][slug]": s_categories || undefined,
    "pagination[pageSize]": 10,
    "pagination[page]": currentPage,
    "sort[0]": s_sort ? `sale_price:${s_sort}` : undefined,
    "sort[1]": s_sort ? `price:${s_sort}` : undefined,
  });

  const handleApply = () => {
    if (dataProducts) {
      setCurrentProducts(dataProducts);
    }
  };

  const handleCancelApply = () => {
    setCurrentProducts(dataProducts);
  };

  useEffect(() => {
    if (firstLoad) {
      setCurrentProducts(dataProducts);
      if (!isLoadingProducts) {
        setFirstLoad(false);
      }
    } else {
      if (searchParams.get("sort") || searchParams.get("categories")) {
        setCurrentProducts(dataProducts);
      }

      if (searchParams.size === 0) {
        setCurrentProducts(dataProducts);
      }
    }
  }, [
    dataProducts,
    s_categories,
    s_sort,
    searchParams,
    isFetchedProducts,
    firstLoad,
    isLoadingProducts,
  ]);
  return (
    <div className="mt-[5.8rem] bg-background">
      <div className="h-[0.8rem] w-full bg-background"></div>
      <QuickFilterComponent categories={dataCategories} />
      <div className="h-[1.6rem] w-full bg-background"></div>
      <div className="w-[140rem] p-[2.4rem] bg-white mx-auto">
        <WrapperFilter
          handleApply={handleApply}
          countFilterProduct={dataProducts?.length}
          handleCancelApply={handleCancelApply}
        />
        <div className="w-full">
          <WrapperProducts
            products={currentProducts}
            isLoading={isLoadingProducts}
            pagination={paginationProducts}
            setCurrentPage={setCurrentPage}
          />
        </div>
      </div>
      <div className="h-[1.6rem] w-full bg-background"></div>
    </div>
  );
};

export default Products;
