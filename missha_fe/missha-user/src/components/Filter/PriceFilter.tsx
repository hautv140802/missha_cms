import { Input, Slider } from "antd";
import { useState } from "react";

const PriceFilterComponent = () => {
  const [minPrice, setMinPrice] = useState(5000);
  const [maxPrice, setMaxPrice] = useState(200000);
  const onChange = (value: number[]) => {
    console.log(value);
    setMinPrice(value[0]);
    setMaxPrice(value[1]);
  };
  return (
    <div>
      <div className="text-[1.6rem] font-[600] m-[0.4rem] pb-[0.8rem]">
        Giá sản phẩm
      </div>
      <Slider
        min={0}
        max={500000}
        value={[minPrice, maxPrice]}
        range
        onChange={onChange}
        styles={{
          track: {
            background:
              "linear-gradient(to right, rgb(204, 204, 204) 0%, rgb(204, 204, 204) 0%, rgb(102, 102, 102) 0%, rgb(102, 102, 102) 100%, rgb(204, 204, 204) 100%, rgb(204, 204, 204) 100%)",
            height: "0.3rem",
          },
        }}
      />
      <div className="flex justify-between items-center gap-[1.2rem] mt-[1.8rem]">
        <Input value={minPrice} disabled />
        <Input value={maxPrice} disabled />
      </div>
    </div>
  );
};

export default PriceFilterComponent;
