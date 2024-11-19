import clsx from "clsx";
import images from "../../assets/images";
import { BaseData } from "../../types/base/baseData";
import { ProductType } from "../../types/response/product";
import formatUrl from "../../utils/functions/formatUrl";
import { formatPrice } from "../../utils/functions/formatPrice";
import paths from "../../utils/constants/paths";
import { Link } from "react-router-dom";

interface ISearchCardComponentProps {
  product: BaseData<ProductType>;
  handleResetSearch?: () => void;
}
const SearchCardComponent = (props: ISearchCardComponentProps) => {
  const { product, handleResetSearch } = props;

  const isSale =
    product?.attributes?.sale_price > 0 &&
    product?.attributes?.sale_price < product?.attributes?.price;
  return (
    <Link
      to={`${paths.PRODUCTS}/${product?.attributes?.slug}`}
      onClick={handleResetSearch}
    >
      <div className="flex justify-start items-center gap-[4px]">
        <div className="min-w-[50px] w-[50px] min-h-[50px] h-[50px]">
          <img
            src={
              formatUrl(product?.attributes?.avatar?.data?.attributes?.url) ||
              images.imageEmpty
            }
            alt={product?.attributes?.name}
            className="w-full h-full object-cover"
          />
        </div>
        <div className="flex flex-col">
          <p className="text-black line-clamp-1">{product?.attributes?.name}</p>
          <div className="flex justify-start items-start gap-[12px]">
            <p className="text-[#ff9900] text-[1.4rem] font-semibold">
              {formatPrice(
                isSale
                  ? product?.attributes?.sale_price
                  : product?.attributes?.price
              )}
            </p>
            <p
              className={clsx(
                "text-gray-500 text-[1.2rem] line-through italic",
                isSale ? "visible" : "invisible"
              )}
            >
              {formatPrice(product?.attributes?.price)}
            </p>
          </div>
        </div>
      </div>
    </Link>
  );
};

export default SearchCardComponent;
