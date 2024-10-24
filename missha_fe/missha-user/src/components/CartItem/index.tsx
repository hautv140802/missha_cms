import { Input, Modal } from "antd";
import svgs from "../../assets/svgs";
import CartComponent from "../Cart";
import { CartType } from "../../types/common/cart";
import { formatPrice } from "../../utils/functions/formatPrice";
import { addToCart, deleteToCart } from "../../utils/functions/addToCart";
import toast from "react-hot-toast";
import { ExclamationCircleFilled } from "@ant-design/icons";
import useCartStore from "../../stores/useCartStore";

const { confirm } = Modal;
interface ICartItemComponentProps {
  cart: CartType;
}
const CartItemComponent = (props: ICartItemComponentProps) => {
  const { cart } = props;

  const { removeItem } = useCartStore();
  const isSale = cart?.sale_price > 0 && cart?.sale_price < cart?.price;

  const handleIncreaseQuantity = () => {
    addToCart(cart);
    toast.success("Tăng số lượng sản phẩm thành công!");
  };

  const handleRemoveCart = () => {
    removeItem(cart.id);
    toast.success("Xóa sản phẩm thành công");
  };

  const handleDecreaseQuantity = () => {
    if (cart?.quantity <= 1) {
      confirm({
        title: "Bán có muốn xóa sản phẩm ra khỏi gió hàng!",
        icon: <ExclamationCircleFilled />,
        content: cart?.name,
        onOk: handleRemoveCart,
        onCancel() {},
        okText: "Xác nhận",
        cancelText: "Hủy",
        centered: true,
        maskClosable: true,
      });
      return;
    }
    deleteToCart(cart);
    toast.success("Giảm số lượng sản phẩm thành công!");
  };

  const handleTrashProduct = () => {
    confirm({
      title: "Bán có muốn xóa sản phẩm ra khỏi gió hàng!",
      icon: <ExclamationCircleFilled />,
      content: cart?.name,
      onOk: handleRemoveCart,
      onCancel() {},
      okText: "Xác nhận",
      cancelText: "Hủy",
      centered: true,
      maskClosable: true,
    });
  };

  return (
    <div className="flex justify-between items-center gap-[0.8rem]">
      <div className="w-[60%]">
        <CartComponent cart={cart} />
      </div>
      <div className="min-w-[10%] flex justify-end items-center gap-[1.2rem]">
        <div
          className="w-[2.4rem] h-[2.4rem] cursor-pointer border-[0.2rem] border-solid hover:border-[#FF9800]"
          onClick={handleDecreaseQuantity}
        >
          <img src={svgs.minus} className="w-full h-full" />
        </div>
        <Input
          value={cart?.quantity}
          className="min-w-[2rem] h-[2.6rem] w-[4rem] text-center"
        />
        <div
          className="w-[2.4rem] h-[2.4rem] cursor-pointer border-[0.2rem] border-solid hover:border-[#FF9800]"
          onClick={handleIncreaseQuantity}
        >
          <img src={svgs.plus} className="w-full h-full" />
        </div>
      </div>
      <div className="w-[20%] flex justify-end items-center">
        <span className="text-[1.6rem] font-[500] text-red-500 text-right">
          {formatPrice(
            cart?.quantity * (isSale ? cart?.sale_price : cart?.price)
          )}
        </span>
      </div>
      <div>
        <div
          className="w-[3.2rem] h-[3.2rem] cursor-pointer p-[0.4rem] hover:bg-[rgba(0,0,0,0.3)] rounded-full"
          onClick={handleTrashProduct}
        >
          <img src={svgs.trash} className="w-full h-full" />
        </div>
      </div>
    </div>
  );
};

export default CartItemComponent;
