import {
  Autoplay,
  Keyboard,
  Mousewheel,
  Navigation,
  Pagination,
} from "swiper/modules";
import { Swiper, SwiperSlide } from "swiper/react";
import images from "../../assets/images";

interface IBannerComponentProps {
  className?: string;
}

const bannerData = [
  {
    name: "banner_1",
    url: images.banner_1,
  },
  {
    name: "banner_2",
    url: images.banner_2,
  },
  {
    name: "banner_2",
    url: images.banner_3,
  },
  {
    name: "banner_1",
    url: images.banner_4,
  },
];
const BannerComponent = (props: IBannerComponentProps) => {
  return (
    <div>
      <Swiper
        cssMode={true}
        navigation={true}
        autoplay={{ delay: 10000, disableOnInteraction: false }}
        modules={[Navigation, Pagination, Mousewheel, Keyboard, Autoplay]}
        className="mySwiper"
        pagination={{
          clickable: true,
        }}
        speed={3000}
      >
        {bannerData.map((banner, index) => (
          <SwiperSlide key={index}>
            <div className="object-cover">
              <img
                src={banner.url}
                alt={banner.name}
                className="w-full h-[30rem] md:h-auto aspect-[1024/300] md:aspect-[1024/300] object-cover"
                loading="lazy"
              />
            </div>
          </SwiperSlide>
        ))}
      </Swiper>
    </div>
  );
};

export default BannerComponent;
