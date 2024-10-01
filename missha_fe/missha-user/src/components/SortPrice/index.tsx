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
const SortPriceComponent = () => {
  return (
    <div className="w-[3rem]">
      <Select
        options={dataOption}
        placeholder="Sắp xếp theo giá"
        variant="borderless"
      />
    </div>
  );
};

export default SortPriceComponent;
