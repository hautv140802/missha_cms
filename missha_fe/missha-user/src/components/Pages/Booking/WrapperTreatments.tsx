import { Swiper, SwiperSlide } from "swiper/react";
import { BaseData } from "../../../types/base/baseData";
import { ServiceType } from "../../../types/response/service";
import "swiper/swiper-bundle.css";
import { Navigation } from "swiper/modules";
import TreatmentComponent from "../../Treatments";
interface IWrapperTreatmentsProps {
  treatments: BaseData<ServiceType>[];
}
const WrapperTreatments = (props: IWrapperTreatmentsProps) => {
  const { treatments } = props;
  const chunkArray = (array: BaseData<ServiceType>[], size: number) => {
    const result = [];
    for (let i = 0; i < array.length; i += size) {
      result.push(array.slice(i, i + size));
    }
    return result;
  };

  const chunkTreatment = chunkArray(treatments, 6);
  return (
    <div className="w-[140rem] mx-auto quick-filter bg-white p-[2.4rem]">
      <Swiper
        observer={true}
        observeParents={true}
        onSwiper={(swiper) => swiper.update()}
        modules={[Navigation]}
        navigation
        className="mySwiper"
      >
        {chunkTreatment?.map((chuckItem, chuckIndex) => (
          <SwiperSlide
            key={chuckIndex}
            className="w-full grid grid-cols-6 grid-rows-1 gap-[16px]"
          >
            <TreatmentComponent treatments={chuckItem} page="booking" />
          </SwiperSlide>
        ))}
      </Swiper>
    </div>
  );
};

export default WrapperTreatments;
