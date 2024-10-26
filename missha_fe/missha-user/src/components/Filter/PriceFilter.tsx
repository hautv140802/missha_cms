import { useEffect, useState } from "react";
import { InputNumber, Slider } from "antd";
import clsx from "clsx";
import productsApis from "../../apis/productApis";

interface iPriceFilterComponentProps {
  onchangeValues: (_values: string[]) => void;
}
const PriceFilterComponent = (props: iPriceFilterComponentProps) => {
  const { onchangeValues } = props;

  const [minPrice, setMinPrice] = useState(0);
  const [maxPrice, setMaxPrice] = useState(1000000);
  const [max, setMax] = useState(1000000);

  useEffect(() => {
    const fetchMaxPrice = async () => {
      try {
        const res = await productsApis.getMaxPrice();
        const data = res.data.data;
        if (data && data?.length > 0) {
          setMaxPrice(data?.[0].attributes?.price);
          setMax(data?.[0].attributes?.price);
        }
      } catch (error) {
        console.error(error);
      }
    };

    fetchMaxPrice();
  }, []);
  const onChange = (value: number[]) => {
    setMinPrice(value[0]);
    setMaxPrice(value[1]);
    onchangeValues(value.map((item) => item.toString()));
  };
  return (
    <div>
      <div className="text-[1.6rem] font-[600] m-[0.4rem] pb-[0.8rem]">
        Giá sản phẩm
      </div>
      <Slider
        min={0}
        max={max}
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
        <div className="input-container flex flex-col justify-center items-center">
          <InputNumber<number>
            className="input-filter-price"
            value={minPrice}
            formatter={(value) =>
              `${value}`.replace(/\B(?=(\d{3})+(?!\d))/g, ",")
            }
            parser={(value) => value?.replace(",", "") as unknown as number}
            disabled
          />
          <div className="label-container rounded-full bg-[#FFFFFF] px-[0.4rem] py-[0.1rem]">
            <label
              className={clsx(
                "font-[500] text-[1.2rem] leading-[2rem] text-[#9999]"
              )}
            >
              {"Từ"}
            </label>
          </div>
        </div>
        <div className="input-container flex flex-col justify-center items-center">
          <InputNumber<number>
            className="input-filter-price"
            value={maxPrice}
            formatter={(value) =>
              `${value}`.replace(/\B(?=(\d{3})+(?!\d))/g, ",")
            }
            parser={(value) => value?.replace(",", "") as unknown as number}
            disabled
          />
          <div className="label-container rounded-full bg-[#FFFFFF] px-[0.4rem] py-[0.1rem]">
            <label
              className={clsx(
                "font-[500] text-[1.2rem] leading-[2rem] text-[#9999]"
              )}
            >
              {"Đến"}
            </label>
          </div>
        </div>
      </div>
    </div>
  );
};

export default PriceFilterComponent;
