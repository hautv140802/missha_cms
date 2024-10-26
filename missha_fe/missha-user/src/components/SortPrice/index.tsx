import { Select } from "antd";

const dataOption = [
  {
    label: "Giá thấp đến cao",
    value: "asc",
  },
  {
    label: "Giá cao đến thấp",
    value: "desc",
  },
];

interface ISortPriceComponentProps {
  setFilterParams: (
    _filterParams: Record<string, string[] | string | undefined>
  ) => void;
  searchParams: URLSearchParams;
  filterParams: Record<string, string[] | string | undefined>;
}
const SortPriceComponent = (props: ISortPriceComponentProps) => {
  const { setFilterParams, searchParams, filterParams } = props;

  const handleOnChange = (value: string) => {
    setFilterParams({
      ...filterParams,
      sort: value,
    });
  };
  return (
    <div className="w-[3rem]">
      <Select
        value={searchParams.get("sort")}
        options={dataOption}
        placeholder="Sắp xếp theo giá"
        variant="borderless"
        onChange={handleOnChange}
      />
    </div>
  );
};

export default SortPriceComponent;
