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
    url: images.banner_2,
  },
  {
    name: "banner_1",
    url: images.banner_1,
  },
  {
    name: "banner_1",
    url: images.banner_1,
  },
  {
    name: "banner_1",
    url: images.banner_1,
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
      >
        {bannerData.map((banner, index) => (
          <SwiperSlide key={index}>
            <div className="object-cover">
              <img
                src={banner.url}
                alt={banner.name}
                className="w-full h-[390px] md:h-auto aspect-[1560/390] md:aspect-[1440/500] object-cover"
                loading="eager"
              />
              {/* </Link> */}
            </div>
          </SwiperSlide>
        ))}
      </Swiper>
    </div>
  );
};

export default BannerComponent;
