import { CartType } from "../../types/common/cart";
import { formatPrice } from "../../utils/functions/formatPrice";

interface ICartComponentProps {
  cart: CartType;
}

const CartComponent = (props: ICartComponentProps) => {
  const { cart } = props;

  const isSale = cart?.sale_price > 0 && cart?.sale_price < cart?.price;

  return (
    <div className="flex justify-start items-start gap-[1.2rem]">
      <div className="w-[12rem] h-[12rem] min-w-[12rem] rounded-[0.2rem] cursor-pointer border">
        <img
          src={cart.avatar}
          className="w-full h-full object-cover rounded-[0.6rem] cursor-pointer"
        />
      </div>
      <div className="h-full flex flex-col justify-between items-start">
        <p className="text-[1.4rem] text-[#818080] font-[500] text-wrap line-clamp-2">
          {cart?.name}
        </p>
        <div className="flex justify-start items-center gap-[0.8rem]">
          <span className="text-[1.6rem] font-[600] text-wrap text-[500] text-[#FF9800">
            {formatPrice(isSale ? cart?.sale_price : cart?.price)}
          </span>
          {isSale && (
            <span className="text-[1.2rem] text-red-600 font-[500] text-wrap line-through">
              {formatPrice(cart?.price)}
            </span>
          )}
        </div>
      </div>
    </div>
  );
};

export default CartComponent;
