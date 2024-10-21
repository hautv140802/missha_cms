import { Link } from "react-router-dom";
import images from "../../assets/images";
import CartCustom from "../../assets/svgs/Custom/CartCustom";
import svgs from "../../assets/svgs";

interface IProductComponentProps {
  page?: "product" | "cart";
}
const ProductComponent = (props: IProductComponentProps) => {
  const { page } = props;
  const discountPercent = 30;
  const name =
    " Ampoule dưỡng trắng, săn chắc da Silk Collagen Glow Ampoule 30ml";
  const price = "500.000 đ";
  const promotionPrice = "350.000 đ";
  if (page === "cart")
    return (
      <div className="flex justify-start items-start gap-[1.2rem]">
        <div className="w-[12rem] h-[12rem] min-w-[12rem] rounded-[0.2rem] cursor-pointer border">
          <img
            src={images.product}
            className="w-full h-full object-cover rounded-[0.6rem] cursor-pointer"
          />
        </div>
        <div className="h-full flex flex-col justify-between items-start">
          <p className="text-[1.4rem] text-[#818080] font-[500] text-wrap line-clamp-2">
            Ampoule dưỡng trắng, săn chắc da Silk Collagen Glow Ampoule 30ml
          </p>
          <div className="flex justify-start items-center gap-[0.8rem]">
            <span className="text-[1.6rem] font-[600] text-wrap text-[500] text-[#FF9800">
              800.000đ
            </span>
            <span className="text-[1.2rem] text-red-600 font-[500] text-wrap line-through">
              1.000.000đ
            </span>
          </div>
        </div>
      </div>
    );
  if (page === "product")
    return (
      <div className="relative w-[24rem] p-4 border rounded-lg shadow-lg group">
        <div className="relative">
          {/* Hình ảnh sản phẩm */}
          <img
            src={images.product}
            alt={"treatment_1"}
            className="w-full h-64 object-cover"
          />

          {/* Discount badge */}
          {discountPercent > 0 && (
            <div className="absolute top-2 left-2 bg-[#ff9000] text-white text-sm p-[0.4rem_0.8rem] rounded-lg">
              <p className="text-[1.2rem]"> -{discountPercent}%</p>
            </div>
          )}

          {/* Icon add to cart khi hover */}

          <div className="absolute inset-0 bg-black bg-opacity-30  items-center justify-center hidden group-hover:flex">
            <div className="w-[5rem] h-[5rem]">
              <CartCustom stroke="#FFFFFF" className="w-full h-full" />
            </div>
          </div>
        </div>

        {/* Thông tin sản phẩm */}
        <div className="mt-4 text-center">
          <h3 className="text-[1.4rem] text-center font-semibold line-clamp-2">
            {name}
          </h3>
          <div className="text-gray-500 text-[1.1rem] line-through">
            {price.toLocaleString()}
          </div>
          <div className="text-[#ff9900] text-[1.4rem] font-bold">
            {promotionPrice.toLocaleString()}
          </div>
        </div>
      </div>
    );
  return null;
};

export default ProductComponent;
