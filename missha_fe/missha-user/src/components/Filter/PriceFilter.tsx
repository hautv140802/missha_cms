import { Slider } from "antd";

const PriceFilterComponent = () => {
  const onChange = (value: number[]) => {
    console.log(value);
  };
  return (
    <div>
      <div>Giá sản phẩm</div>
      <Slider
        min={0}
        max={5000000}
        value={[5000, 2000000]}
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
    </div>
  );
};

export default PriceFilterComponent;
