import BannerComponent from "../components/Banner";
import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";
import QuickFilterComponent from "../components/Filter/QuickFilter";
import WrapperProductComponent from "../components/WrapperProduct";
import BenefitComponent from "../components/Benefit";
const Home = () => {
  return (
    <div className="w-ful py-[3.2rem] bg-white">
      <BannerComponent />
      <div className="h-[0.8rem] w-full bg-[#F7F7F7]"></div>
      <BenefitComponent />
      <div className="h-[0.8rem] w-full bg-[#F7F7F7]"></div>
      <QuickFilterComponent />
      <div className="h-[0.8rem] w-full bg-[#F7F7F7]"></div>
      <WrapperProductComponent title="Sản phẩm bán chạy" />
      <div className="h-[0.8rem] w-full bg-[#F7F7F7]"></div>
      <WrapperProductComponent title="Sản phẩm mới nhất" />
    </div>
  );
};

export default Home;
