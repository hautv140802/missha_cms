import { Pagination, Spin } from "antd";
import { BaseData } from "../../../types/base/baseData";
import { ProductType } from "../../../types/response/product";
import ProductComponent from "../../Product";
import { PaginationResponseType } from "../../../types/common/pagination";

interface IWrapperProductsProps {
  products: BaseData<ProductType>[];
  isLoading?: boolean;
  pagination: PaginationResponseType | null;
  setCurrentPage: (_page: number) => void;
}
const WrapperProducts = (props: IWrapperProductsProps) => {
  const { products, isLoading, pagination, setCurrentPage } = props;

  if (isLoading)
    return (
      <div className="flex justify-center items-center py-[10rem]">
        <Spin />
      </div>
    );

  if (!isLoading && products?.length === 0)
    return (
      <div className="flex justify-center items-center py-[10rem]">
        <p className="text-[2.4rem]">Không có sản phẩm</p>
      </div>
    );

  return (
    <>
      <div className="flex flex-wrap justify-start items-center gap-[3.2rem] mt-[2.4rem]">
        {products.map((item, index) => (
          <ProductComponent key={index} page="product" product={item} />
        ))}
      </div>
      <div className="w-full flex justify-center items-center py-[0.4rem] mt-[2.4rem]">
        <Pagination
          total={pagination?.total || 0}
          pageSize={pagination?.pageSize || 10}
          current={pagination?.page || 1}
          onChange={(page) => setCurrentPage(page)}
        />
      </div>
    </>
  );
};

export default WrapperProducts;
