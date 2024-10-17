import images from "../assets/images";
import svgs from "../assets/svgs";
import BannerBooking from "../components/Pages/Booking/BannerBooking";
import TreatmentComponent from "../components/Treatments";
const Booking = () => {
  return (
    <div className="w-ful mt-[0.4rem] pt-[1.2rem] pb-[3.2rem] bg-white">
      <BannerBooking />

      <TreatmentComponent page="booking" />

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
