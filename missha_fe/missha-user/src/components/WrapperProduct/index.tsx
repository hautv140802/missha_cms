import { BaseData } from "../../types/base/baseData";
import { ProductType } from "../../types/response/product";
import ProductComponent from "../Product";

interface IWrapperProductComponentProps {
  title?: string;
  products: BaseData<ProductType>[];
}
const WrapperProductComponent = (props: IWrapperProductComponentProps) => {
  const { title, products } = props;
  return (
    <div className="w-[140rem] mx-auto bg-white p-[2.4rem]">
      {title && <p className="text-[2rem]">{title}</p>}
      <div className="flex justify-between items-center gap-[3.2rem] mt-[2rem]">
        {products?.map((product, index) => (
          <ProductComponent key={index} page="product" product={product} />
        ))}
      </div>
    </div>
  );
};

export default WrapperProductComponent;
