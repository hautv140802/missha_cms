import BannerComponent from "../components/Banner";
import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";
import QuickFilterComponent from "../components/Filter/QuickFilter";
import WrapperProductComponent from "../components/WrapperProduct";
import BenefitComponent from "../components/Benefit";
import TreatmentComponent from "../components/Treatments";
import WelcomeComponent from "../components/Welcome";
const Home = () => {
  return (
    <div className="w-ful py-[0.8rem] pb-[3.2rem] bg-[#F7F7F7] mt-[0.4rem]">
      <BannerComponent />
      <div className="h-[0.8rem] w-full bg-[#F7F7F7]"></div>
      <WelcomeComponent />
      <BenefitComponent />
      <div className="bg-white">
        <QuickFilterComponent />
      </div>
      <div className="h-[1.6rem] w-full bg-[#F7F7F7]"></div>
      <div className="bg-[#F7F7F7]">
        <div className="mb-[1.2rem]">
          <TreatmentComponent page="product" />
        </div>
        <div className="mb-[1.2rem]">
          <WrapperProductComponent title="Sản phẩm bán chạy" />
        </div>
        <div className="mb-[1.2rem]">
          <WrapperProductComponent title="Sản phẩm mới nhất" />
        </div>
      </div>
    </div>
  );
};

export default Home;
