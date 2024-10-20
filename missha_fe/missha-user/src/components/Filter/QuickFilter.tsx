import { Keyboard, Mousewheel, Navigation, Pagination } from "swiper/modules";
import { Swiper, SwiperSlide } from "swiper/react";
import { Link } from "react-router-dom";
import images from "../../assets/images"; // Update the import path as needed
import "swiper/swiper-bundle.css"; // Make sure you have the appropriate Swiper styles

const cateData = [
  [
    {
      name: "Kem dưỡng ẩm",
      url: images.quickSort_1,
    },
    {
      name: "Kem dưỡng sáng",
      url: images.quickSort_2,
    },
    {
      name: "Kem trị da dầu",
      url: images.quickSort_3,
    },
    {
      name: "Kem sáng da",
      url: images.quickSort_4,
    },
    {
      name: "Kem dưỡng trắng",
      url: images.quickSort_5,
    },
  ],
  [
    {
      name: "Kem dưỡng ẩm",
      url: images.quickSort_1,
    },
    {
      name: "Kem dưỡng sáng",
      url: images.quickSort_2,
    },
    {
      name: "Kem trị da dầu",
      url: images.quickSort_3,
    },
    {
      name: "Kem sáng da",
      url: images.quickSort_4,
    },
    {
      name: "Kem dưỡng trắng",
      url: images.quickSort_5,
    },
  ],
];

const QuickFilterComponent = () => {
  // const handleChangeQuickFilter = (e) => {
  //   e.preventDefault();
  //   console.log("Quick Filter Clicked");
  // };

  return (
    <div className="w-[140rem] mx-auto quick-filter px-[6.4rem] bg-white p-[2.4rem]">
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
                    className="w-[12rem] h-[12rem] rounded-[16px] object-cover"
                    alt={item.name}
                  />
                  <div className="absolute top-0 left-0 w-full h-full z-10 bg-[#000] opacity-30 rounded-[16px] hidden group-hover:block"></div>
                </div>
                <p className="text-[14px] text-wrap text-center">{item.name}</p>
              </Link>
            ))}
          </SwiperSlide>
        ))}
      </Swiper>
    </div>
  );
};

export default QuickFilterComponent;
