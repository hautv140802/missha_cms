import MenuFilterComponent from "../components/Filter/MenuFilter";
import QuickFilterComponent from "../components/Filter/QuickFilter";
import ProductComponent from "../components/Product";
import SortPriceComponent from "../components/SortPrice";

const Products = () => {
  return (
    <div>
      <div className="h-[0.8rem] w-full bg-[#F7F7F7]"></div>
      <QuickFilterComponent />
      <div className="h-[0.8rem] w-full bg-[#F7F7F7]"></div>
      <div className="max-w-[144rem] mx-auto p-[3.2rem_16rem]">
        <div className="flex justify-between items-center">
          <MenuFilterComponent />
          <SortPriceComponent />
        </div>
        <div className="flex flex-wrap justify-start items-center gap-[3.2rem] mt-[2.4rem]">
          {Array.from({
            length: 10,
          }).map((_, index) => (
            <ProductComponent key={index} />
          ))}
        </div>
      </div>
    </div>
  );
};

export default Products;
