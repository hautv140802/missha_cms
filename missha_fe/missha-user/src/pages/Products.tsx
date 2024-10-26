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
  const [updateTime, setUpdateTime] = useState<string>();
  const [currentPage, setCurrentPage] = useState<number>(1);
  const { data: dataCategories } = useQueryCategories({ populate: "deep, 3" });
  const [searchParams] = useSearchParams();

  const {
    data: dataProducts,
    isLoading: isLoadingProducts,
    pagination: paginationProducts,
  } = useQueryProducts({
    populate: "deep, 3",
    "filters[product_line][slug]": searchParams.getAll("product_lines"),
    "filters[skin_properties][slug]": searchParams.getAll("skin_properties"),
    "filters[$and][0][sale_price][$gte]":
      searchParams.get("min_price") || undefined,
    "filters[$and][1][sale_price][$lte]":
      searchParams.get("max_price") || undefined,
    "filters[categories][slug]": searchParams.get("categories") || undefined,
    "pagination[pageSize]": 10,
    "pagination[page]": currentPage,
    "sort[0]": searchParams.get("sort")
      ? `sale_price:${searchParams.get("sort")}`
      : undefined,
    "sort[1]": searchParams.get("sort")
      ? `price:${searchParams.get("sort")}`
      : undefined,
  });

  useEffect(() => {
    if (firstLoad) {
      setTimeout(() => {
        setUpdateTime(new Date().toString());
      }, 500);

      setFirstLoad(false);
    }
  }, [firstLoad, isLoadingProducts]);

  const handleApply = () => {
    if (dataProducts) {
      setCurrentProducts(dataProducts);
    }
  };

  useEffect(() => {
    setCurrentProducts(dataProducts);
  }, [updateTime]);

  const handleCancelApply = () => {
    setTimeout(() => {
      setUpdateTime(new Date().toString());
    }, 100);
  };

  useEffect(() => {
    if (searchParams.get("sort") || searchParams.get("categories")) {
      setTimeout(() => {
        setUpdateTime(new Date().toString());
      }, 100);
    }
  }, [searchParams.get("sort"), searchParams.get("categories")]);
  return (
    <div className="mt-[10rem] bg-background">
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
