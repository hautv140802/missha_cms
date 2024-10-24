import MenuFilterComponent from "../components/Filter/MenuFilter";
import QuickFilterComponent from "../components/Filter/QuickFilter";
import ProductComponent from "../components/Product";
import SortPriceComponent from "../components/SortPrice";

const Products = () => {
  return (
    <div className="mt-[10rem] bg-background">
      <div className="h-[0.8rem] w-full bg-[#F7F7F7]"></div>
      <QuickFilterComponent />
      <div className="h-[1.6rem] w-full bg-[#F7F7F7]"></div>
      <div className="w-[140rem] p-[2.4rem] bg-white mx-auto">
        <div className="w-full flex justify-between items-center pr-[10rem]">
          <MenuFilterComponent />
          <SortPriceComponent />
        </div>
        <div className="flex flex-wrap justify-between items-center gap-[3.2rem] mt-[2.4rem] ">
          {Array.from({
            length: 10,
          }).map((_, index) => (
            <ProductComponent key={index} page="product" />
          ))}
        </div>
      </div>
      <div className="h-[1.6rem] w-full bg-[#F7F7F7]"></div>
    </div>
  );
};

export default Products;
