import images from "../../assets/images";
interface ITreatmentComponentProps {
  page?: "product" | "booking";
}
const TreatmentComponent = (props: ITreatmentComponentProps) => {
  const { page } = props;

  if (page === "product") {
    return (
      <div className="max-w-[140rem] mx-auto">
        <p className="text-[2rem]">Popular treatments</p>
        <div className="mt-[2rem] flex justify-start items-center gap-[1.6rem]">
          <div className="relative w-[31.6rem] h-[24rem] border hover:bg-[rgba(0,0,0,0.3)] cursor-pointer">
            <img
              src={images.treatment_1}
              className="w-full h-full object-cover"
            />
            <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-sm">
              <p className="text-[1.6rem] text-black font-[500]">Facial</p>
            </div>
          </div>

          <div className="h-[24rem] grid grid-rows-[57%_37%] gap-[1.6rem]">
            <div className="relative w-[34.5rem] h-full border hover:bg-[rgba(0,0,0,0.3)] cursor-pointer">
              <img
                src={images.treatment_2}
                className="w-full h-full object-cover"
              />
              <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-sm">
                <p className="text-[1.6rem] text-black font-[500]">Facial</p>
              </div>
            </div>
            <div className="relative w-[34.5rem] h-full border hover:bg-[rgba(0,0,0,0.3)] cursor-pointer">
              <img
                src={images.treatment_3}
                className="w-full h-full object-cover"
              />
              <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-sm">
                <p className="text-[1.6rem] text-black font-[500]">Facial</p>
              </div>
            </div>
          </div>
          <div className="relative w-[34.5rem] h-[24rem] border hover:bg-[rgba(0,0,0,0.3)] cursor-pointer">
            <img
              src={images.treatment_2}
              className="w-full h-full object-cover"
            />
            <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-sm">
              <p className="text-[1.6rem] text-black font-[500]">Facial</p>
            </div>
          </div>

          <div className="h-[24rem] grid grid-rows-[38%_56%] gap-[1.6rem]">
            <div className="relative w-[34.5rem] h-full border hover:bg-[rgba(0,0,0,0.3)] cursor-pointer">
              <img
                src={images.treatment_3}
                className="w-full h-full object-cover"
              />
              <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-sm">
                <p className="text-[1.6rem] text-black font-[500]">Facial</p>
              </div>
            </div>
            <div className="relative w-[34.5rem] h-full border hover:bg-[rgba(0,0,0,0.3)] cursor-pointer">
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
    );
  }
  if (page === "booking") {
    return (
      <div className="max-w-[140rem] mx-auto">
        <p className="text-[2rem]">Popular treatments</p>
        <div className="mt-[2rem] flex justify-start items-center gap-[1.6rem]">
          <div className="relative w-[31.6rem] h-[35.2rem] border hover:bg-[rgba(0,0,0,0.3)] cursor-pointer">
            <img
              src={images.treatment_1}
              className="w-full h-full object-cover"
            />
            <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-sm">
              <p className="text-[1.6rem] text-black font-[500]">Facial</p>
            </div>
          </div>

          <div className="h-[35.2rem] grid grid-rows-[57%_38.5%] gap-[1.6rem]">
            <div className="relative w-[34.5rem] h-full border hover:bg-[rgba(0,0,0,0.3)] cursor-pointer">
              <img
                src={images.treatment_2}
                className="w-full h-full object-cover"
              />
              <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-sm">
                <p className="text-[1.6rem] text-black font-[500]">Facial</p>
              </div>
            </div>
            <div className="relative w-[34.5rem] h-full border hover:bg-[rgba(0,0,0,0.3)] cursor-pointer">
              <img
                src={images.treatment_3}
                className="w-full h-full object-cover"
              />
              <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-sm">
                <p className="text-[1.6rem] text-black font-[500]">Facial</p>
              </div>
            </div>
          </div>
          <div className="relative w-[34.5rem] h-[35.2rem] border hover:bg-[rgba(0,0,0,0.3)] cursor-pointer">
            <img
              src={images.treatment_2}
              className="w-full h-full object-cover"
            />
            <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-sm">
              <p className="text-[1.6rem] text-black font-[500]">Facial</p>
            </div>
          </div>

          <div className="h-[35.2rem] grid grid-rows-[38.5%_57%] gap-[1.6rem]">
            <div className="relative w-[34.5rem] h-full border hover:bg-[rgba(0,0,0,0.3)] cursor-pointer">
              <img
                src={images.treatment_3}
                className="w-full h-full object-cover"
              />
              <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-sm">
                <p className="text-[1.6rem] text-black font-[500]">Facial</p>
              </div>
            </div>
            <div className="relative w-[34.5rem] h-full border hover:bg-[rgba(0,0,0,0.3)] cursor-pointer">
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
    );
  }
};

export default TreatmentComponent;
