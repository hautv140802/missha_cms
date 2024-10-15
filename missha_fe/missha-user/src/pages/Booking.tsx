import images from "../assets/images";
import svgs from "../assets/svgs";
import BannerBooking from "../components/Pages/Booking/BannerBooking";
const Booking = () => {
  return (
    <div className="w-ful mt-[0.4rem] pt-[1.2rem] pb-[3.2rem] bg-white">
      <BannerBooking />

      <div className="max-w-[140rem] mx-auto mt-[10rem]">
        <p className="text-[2rem]">Popular treatments</p>
        <div className="mt-[2rem] flex justify-start items-center gap-[1.6rem]">
          <div className="relative w-[31.6rem] h-[35.2rem] border">
            <img
              src={images.treatment_1}
              className="w-full h-full object-cover"
            />
            <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-sm">
              <p className="text-[1.6rem] text-black font-[500]">Facial</p>
            </div>
          </div>

          <div className="h-[35.2rem] grid grid-rows-[57%_38.5%] gap-[1.6rem]">
            <div className="relative w-[34.5rem] h-full border">
              <img
                src={images.treatment_2}
                className="w-full h-full object-cover"
              />
              <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-sm">
                <p className="text-[1.6rem] text-black font-[500]">Facial</p>
              </div>
            </div>
            <div className="relative w-[34.5rem] h-full border">
              <img
                src={images.treatment_3}
                className="w-full h-full object-cover"
              />
              <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-sm">
                <p className="text-[1.6rem] text-black font-[500]">Facial</p>
              </div>
            </div>
          </div>
          <div className="relative w-[34.5rem] h-[35.2rem] border">
            <img
              src={images.treatment_2}
              className="w-full h-full object-cover"
            />
            <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-sm">
              <p className="text-[1.6rem] text-black font-[500]">Facial</p>
            </div>
          </div>

          <div className="h-[35.2rem] grid grid-rows-[38.5%_57%] gap-[1.6rem]">
            <div className="relative w-[34.5rem] h-full border">
              <img
                src={images.treatment_3}
                className="w-full h-full object-cover"
              />
              <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-sm">
                <p className="text-[1.6rem] text-black font-[500]">Facial</p>
              </div>
            </div>
            <div className="relative w-[34.5rem] h-full border">
              <img
                src={images.treatment_1}
                className="w-full h-full object-cover"
              />
              <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-sm">
                <p className="text-[1.6rem] text-black font-[500]">Facial</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className="max-w-[140rem] mx-auto mt-[5rem]">
        <p className="text-[2rem]">Top treatments</p>
        <div className="mt-[2rem] flex justify-start items-center gap-[1.6rem]">
          {Array.from({ length: 6 }).map((_, index) => (
            <div
              key={index}
              className="relative w-[24rem] bg-[#d3d3d3] p-[0.8rem]"
            >
              <div className="h-[19rem]">
                <img
                  src={images.treatment_2}
                  className="w-full h-full object-cover"
                  alt={`Treatment ${index + 1}`}
                />
              </div>
              <div className="absolute top-[1.2rem] left-[0.8rem] bg-[#FF9800] p-[0.2rem_1.2rem]">
                <p className="text-white text-[1.4rem] font-[500]">9.5</p>
              </div>

              <div className="mt-[0.8rem]">
                <p className="text-[1.6rem] font-[500]">Glow Spa</p>
                <p className="text-[1.4rem]">Relaxation</p>
              </div>
              <div className="flex justify-between items-center">
                <p className="text-[1.6rem] font-[600]">from $80/session</p>
                <div className="w-[2.4rem] h-[2.4rem]">
                  <img
                    src={svgs.arrowLeft}
                    className="w-full h-full rotate-180"
                    alt="Arrow"
                  />
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default Booking;
