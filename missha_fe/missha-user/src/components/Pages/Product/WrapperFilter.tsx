import { useEffect, useState } from "react";
import { useSearchParams } from "react-router-dom";
import MenuFilterComponent from "../../Filter/MenuFilter";
import SortPriceComponent from "../../SortPrice";

interface IWrapperFilterProps {
  handleApply: () => void;
  countFilterProduct: number;
  handleCancelApply: () => void;
}
const formatParams = (
  input: Record<string, string[] | string | undefined>
): string[][] => {
  const result: string[][] = [];

  for (const key in input) {
    const value = input[key];

    if (Array.isArray(value)) {
      value.forEach((item) => {
        result.push([key, item]);
      });
    } else if (typeof value === "string") {
      result.push([key, value]);
    }
  }

  return result;
};
const initFilter: Record<string, string[] | string | undefined> = {
  skin_properties: [],
  product_lines: [],
  min_price: undefined,
  max_price: undefined,
  sort: undefined,
};

const WrapperFilter = (props: IWrapperFilterProps) => {
  const { handleApply, countFilterProduct, handleCancelApply } = props;
  const [filterParams, setFilterParams] = useState(initFilter);
  const [firstLoad, setFirstLoad] = useState(true);
  const [searchParams, setSearchParams] = useSearchParams();

  // set current params
  useEffect(() => {
    if (firstLoad) {
      const queryString = Array.from(searchParams.entries())
        .map(([key, value]) => `${key}=${value}`)
        .join("&");
      setSearchParams(queryString);
      setFirstLoad(false);
    }
  }, [firstLoad]);

  // update new params
  useEffect(() => {
    if (!firstLoad) {
      const format = formatParams(filterParams);
      const newParams = new URLSearchParams(format);
      setSearchParams(newParams);
    }
  }, [filterParams]);

  const handleCancelFilter = () => {
    setFilterParams(initFilter);
    const newParams = new URLSearchParams();
    setSearchParams(newParams);
    handleCancelApply();
  };
  return (
    <div className="w-full flex justify-between items-center pr-[10rem]">
      <MenuFilterComponent
        handleApply={handleApply}
        countFilterProduct={countFilterProduct}
        handleCancelApply={handleCancelFilter}
        setFilterParams={setFilterParams}
        searchParams={searchParams}
        filterParams={filterParams}
      />
      <SortPriceComponent
        setFilterParams={setFilterParams}
        searchParams={searchParams}
        filterParams={filterParams}
      />
    </div>
  );
};

export default WrapperFilter;
