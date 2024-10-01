import { Keyboard, Mousewheel, Navigation, Pagination } from "swiper/modules";
import { Swiper, SwiperSlide } from "swiper/react";
import { Link } from "react-router-dom";
import images from "../../assets/images"; // Update the import path as needed
import "swiper/swiper-bundle.css"; // Make sure you have the appropriate Swiper styles

const cateData = [
  [
    {
      name: "banner_1",
      url: images.cate_1,
    },
    {
      name: "banner_2",
      url: images.cate_2,
    },
    {
      name: "banner_3",
      url: images.cate_3,
    },
    {
      name: "banner_4",
      url: images.cate_2,
    },
    {
      name: "banner_5",
      url: images.cate_3,
    },
  ],
  [
    {
      name: "cateee",
      url: images.cate_3,
    },
    {
      name: "banner_1",
      url: images.cate_1,
    },
    {
      name: "banner_2",
      url: images.cate_2,
    },
    {
      name: "banner_3",
      url: images.cate_3,
    },
    {
      name: "banner_4",
      url: images.cate_2,
    },
  ],
];

const QuickFilterComponent = () => {
  // const handleChangeQuickFilter = (e) => {
  //   e.preventDefault();
  //   console.log("Quick Filter Clicked");
  // };

  return (
    <div className="w-full quick-filter px-[6.4rem] bg-white max-w-[144rem] mx-auto">
      <Swiper
        observer={true}
        observeParents={true}
        onSwiper={(swiper) => swiper.update()}
        modules={[Navigation]}
        navigation
        className="mySwiper"
      >
        {cateData.map((cate, slideIndex) => (
          <SwiperSlide
            key={slideIndex}
            className="w-full grid grid-cols-5 grid-rows-1 gap-[16px] md:gap-[32px] py-[16px] md:py-[32px] px-[16px] md:px-[64px]"
          >
            {cate.map((item, index) => (
              <Link
                to="#"
                className="flex flex-col items-center gap-[16px] relative"
                key={index}
                // onClick={handleChangeQuickFilter}
              >
                <div className="relative group">
                  <img
                    src={item.url}
                    className="w-[9.6rem] h-[9.6rem] rounded-[16px] object-cover"
                    alt={item.name}
                  />
                  <div className="absolute top-0 left-0 w-full h-full z-10 bg-[#000] opacity-30 rounded-[16px] hidden group-hover:block"></div>
                </div>
                <p className="text-[14px] font-[500] text-wrap text-center">
                  {item.name}
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
