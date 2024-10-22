import { Navigation } from "swiper/modules";
import { Swiper, SwiperSlide } from "swiper/react";
import { Link } from "react-router-dom";
import "swiper/swiper-bundle.css";
import { CategoryType } from "../../types/response/category";
import { BaseData } from "../../types/base/baseData";
import formatUrl from "../../utils/functions/formatUrl";
import paths from "../../utils/constants/paths";

interface IQuickFilterComponent {
  categories?: BaseData<CategoryType>[];
}

const QuickFilterComponent = (props: IQuickFilterComponent) => {
  const { categories = [] } = props;

  const chunkArray = (array: BaseData<CategoryType>[], size: number) => {
    const result = [];
    for (let i = 0; i < array.length; i += size) {
      result.push(array.slice(i, i + size));
    }
    return result;
  };

  const desktopChuck = chunkArray(categories, 6);

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
        {desktopChuck.map((chuckItem, chunckIndex) => (
          <SwiperSlide
            key={chunckIndex}
            className="w-full grid grid-cols-6 grid-rows-1 gap-[16px]"
          >
            {chuckItem.map((cateItem, cateIndex) => (
              <Link
                to={`${paths.PRODUCTS}?categories=${cateItem?.attributes?.slug}`}
                className="flex flex-col items-center gap-[16px] relative"
                key={cateIndex}
                // onClick={handleChangeQuickFilter}
              >
                <div className="relative group">
                  <img
                    src={formatUrl(
                      cateItem?.attributes?.banner?.data?.attributes?.url
                    )}
                    className="w-[12rem] h-[12rem] rounded-[16px] object-cover"
                    alt={cateItem?.attributes?.banner?.data?.attributes?.name}
                  />
                  <div className="absolute top-0 left-0 w-full h-full z-10 bg-[#000] opacity-30 rounded-[16px] hidden group-hover:block"></div>
                </div>
                <p className="text-[14px] text-wrap text-center">
                  {cateItem?.attributes?.name}
                </p>
              </Link>
            ))}
          </SwiperSlide>
        ))}
      </Swiper>
    </div>
  );
};

export default QuickFilterComponent;
