import { Input } from "antd";
import svgs from "../../assets/svgs";
import ProductComponent from "../Product";

const CartItemComponent = () => {
  return (
    <div className="flex justify-between items-center gap-[0.8rem]">
      <div className="w-[60%]">
        <ProductComponent page="cart" />
      </div>
      <div className="min-w-[10%] flex justify-end items-center gap-[1.2rem]">
        <div className="w-[2.4rem] h-[2.4rem] cursor-pointer border-[0.2rem] border-solid hover:border-[#FF9800]">
          <img src={svgs.minus} className="w-full h-full" />
        </div>
        <Input
          value={2}
          className="min-w-[2rem] h-[2.6rem] w-[4rem] text-center"
        />
        <div className="w-[2.4rem] h-[2.4rem] cursor-pointer border-[0.2rem] border-solid hover:border-[#FF9800]">
          <img src={svgs.plus} className="w-full h-full" />
        </div>
      </div>
      <div className="w-[20%] flex justify-end items-center">
        <span className="text-[1.6rem] font-[500] text-red-500 text-right">
          325.000.000 đ
        </span>
      </div>
      <div>
        <div className="w-[3.2rem] h-[3.2rem] cursor-pointer p-[0.4rem] hover:bg-[rgba(0,0,0,0.3)] rounded-full">
          <img src={svgs.trash} className="w-full h-full" />
        </div>
      </div>
    </div>
  );
};

export default CartItemComponent;
