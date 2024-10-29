import BannerComponent from "../components/Banner";
import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";
import QuickFilterComponent from "../components/Filter/QuickFilter";
import WrapperProductComponent from "../components/WrapperProduct";
import BenefitComponent from "../components/Benefit";
import WelcomeComponent from "../components/Welcome";
import { useQueryCategories } from "../hooks/queries/categories.query";
import { useQueryProducts } from "../hooks/queries/products.query";
import WrapperTreatment from "../components/WarpperTreatments";
import { useQueryServices } from "../hooks/queries/services.query";
const Home = () => {
  const { data: dataCategories } = useQueryCategories({
    populate: "deep, 3",
  });

  const { data: dataProductBestSale } = useQueryProducts({
    populate: "deep, 3",
    "sort[0]": "total_purchase:desc",
  });

  const { data: dataNewProduct } = useQueryProducts({
    populate: "deep, 3",
    "sort[0]": "createdAt:desc",
  });

  const { data: dateServices } = useQueryServices({
    populate: "deep, 3",
    "sort[0]": "createdAt:desc",
  });

  return (
    <div className="w-ful py-[0.8rem] pb-[3.2rem] bg-[#F8F8FC] mt-[5.8rem]">
      <BannerComponent />
      <div className="h-[0.8rem] w-full bg-[#F7F7F7]"></div>
      <WelcomeComponent />
      <BenefitComponent />
      <QuickFilterComponent categories={dataCategories} />
      <div className="h-[1.6rem] w-full bg-[#F8F8FC]"></div>
      <div className="bg-[#F8F8FC]">
        <div className="mb-[1.2rem] w-[140rem] mx-auto bg-white p-[2.4rem]">
          <WrapperTreatment treatments={dateServices} page="product" />
        </div>
        <div className="mt-[1.2rem]">
          <WrapperProductComponent
            title="Sản phẩm bán chạy"
            products={dataProductBestSale.slice(0, 5)}
          />
        </div>
        <div className="mt-[1.2rem]">
          <WrapperProductComponent
            title="Sản phẩm mới nhất"
            products={dataNewProduct.slice(0, 5)}
          />
        </div>
      </div>
    </div>
  );
};

export default Home;
