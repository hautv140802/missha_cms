import images from "../../assets/images";
import CartCustom from "../../assets/svgs/Custom/CartCustom";
import { BaseData } from "../../types/base/baseData";
import { ProductType } from "../../types/response/product";
import formatUrl from "../../utils/functions/formatUrl";
import clsx from "clsx";
import { formatPrice } from "../../utils/functions/formatPrice";
import { Link } from "react-router-dom";
import paths from "../../utils/constants/paths";

interface IProductComponentProps {
  page?: "product" | "cart";
  product: BaseData<ProductType>;
}
const ProductComponent = (props: IProductComponentProps) => {
  const { page, product } = props;

  const isSale =
    product?.attributes?.sale_price > 0 &&
    product?.attributes?.sale_price < product?.attributes?.price;

  const percentDiscount =
    ((product?.attributes?.price - product?.attributes?.sale_price) * 100) /
    product?.attributes?.price;
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
      <div className="relative w-[24rem] p-4 border rounded-lg shadow-md group">
        <div className="relative">
          {/* Hình ảnh sản phẩm */}
          <img
            src={formatUrl(product?.attributes?.avatar?.data?.attributes?.url)}
            alt={product?.attributes?.name || ""}
            className="w-full h-64 object-cover"
          />

          {/* Discount badge */}

          {isSale && (
            <div className="absolute top-2 left-2 bg-[#ff9000] text-white text-sm p-[0.4rem_0.8rem] rounded-lg">
              <p className="text-[1.2rem]">
                -{Number(percentDiscount.toFixed(2))}%
              </p>
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
        <Link to={`${paths.PRODUCTS}/${product?.attributes?.slug}`}>
          <div className="mt-4 text-center">
            <h3 className="text-[1.4rem] text-center font-semibold line-clamp-2">
              {product?.attributes?.name}
            </h3>

            <div
              className={clsx(
                "text-gray-500 text-[1.1rem] line-through",
                isSale ? "visible" : "invisible"
              )}
            >
              {formatPrice(product?.attributes?.price)}
            </div>

            <div className="text-[#ff9900] text-[1.4rem] font-bold">
              {formatPrice(
                isSale
                  ? product?.attributes?.sale_price
                  : product?.attributes?.price
              )}
            </div>
          </div>
        </Link>
      </div>
    );
  return null;
};

export default ProductComponent;
