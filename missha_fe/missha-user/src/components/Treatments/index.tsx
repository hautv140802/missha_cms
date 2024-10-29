import { useNavigate } from "react-router-dom";
import { BaseData } from "../../types/base/baseData";
import { ServiceType } from "../../types/response/service";
import formatUrl from "../../utils/functions/formatUrl";
import paths from "../../utils/constants/paths";
import ClipBoardCustom from "../../assets/svgs/Custom/ClipBoard";
interface ITreatmentComponentProps {
  page?: "product" | "booking";
  treatments: BaseData<ServiceType>[];
}
const TreatmentComponent = (props: ITreatmentComponentProps) => {
  const { page, treatments } = props;

  const navigate = useNavigate();
  const handleBooking = (treatment: BaseData<ServiceType>) => {
    navigate(paths.BOOKING, {
      state: {
        treatmentSelected: treatment,
      },
    });
  };
  if (page === "product") {
    return (
      <div className="max-w-[140rem] mx-auto">
        <p className="text-[2rem]">Phương pháp trị liệu</p>
        <div className="mt-[2rem] flex justify-start items-center gap-[1.6rem]">
          {treatments?.[0] && (
            <div className="group relative w-[31.6rem] h-[24rem] border hover:bg-[rgba(0,0,0,0.3)] ">
              <img
                src={formatUrl(
                  treatments?.[0]?.attributes?.banner?.data?.attributes?.url
                )}
                className="w-full h-full object-cover"
                loading="lazy"
              />
              <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-lg">
                <p className="text-[1.6rem] text-white font-[500] max-w-[20rem] line-clamp-2">
                  {treatments?.[0]?.attributes?.title}
                </p>
              </div>

              <div className="absolute inset-0 bg-black bg-opacity-30  items-center justify-center hidden group-hover:flex ">
                <div
                  className="w-[8rem] h-[8rem] p-[1.5rem] rounded-full bg-[rgba(0,0,0,0.5)] cursor-pointer"
                  onClick={() => handleBooking(treatments?.[0])}
                >
                  <ClipBoardCustom stroke="#FFFFFF" className="w-full h-full" />
                </div>
              </div>
            </div>
          )}

          <div className="h-[24rem] grid grid-rows-[57%_37%] gap-[1.6rem]">
            {treatments?.[1] && (
              <div className="group relative w-[34.5rem] h-full border hover:bg-[rgba(0,0,0,0.3)] ">
                <img
                  src={formatUrl(
                    treatments?.[1]?.attributes?.banner?.data?.attributes?.url
                  )}
                  className="w-full h-full object-cover"
                  loading="lazy"
                />
                <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-lg">
                  <p className="text-[1.6rem] text-white font-[500] max-w-[20rem] line-clamp-2">
                    {treatments?.[1]?.attributes?.title}
                  </p>
                </div>
                <div className="absolute inset-0 bg-black bg-opacity-30  items-center justify-center hidden group-hover:flex ">
                  <div
                    className="w-[8rem] h-[8rem] p-[1.5rem] rounded-full bg-[rgba(0,0,0,0.5)] cursor-pointer"
                    onClick={() => handleBooking(treatments?.[1])}
                  >
                    <ClipBoardCustom
                      stroke="#FFFFFF"
                      className="w-full h-full"
                    />
                  </div>
                </div>
              </div>
            )}
            {treatments?.[2] && (
              <div className="group relative w-[34.5rem] h-full border hover:bg-[rgba(0,0,0,0.3)] ">
                <img
                  src={formatUrl(
                    treatments?.[2]?.attributes?.banner?.data?.attributes?.url
                  )}
                  className="w-full h-full object-cover"
                  loading="lazy"
                />
                <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-lg">
                  <p className="text-[1.6rem] text-white font-[500] max-w-[20rem] line-clamp-2">
                    {treatments?.[2]?.attributes?.title}
                  </p>
                </div>
                <div className="absolute inset-0 bg-black bg-opacity-30  items-center justify-center hidden group-hover:flex ">
                  <div
                    className="w-[8rem] h-[8rem] p-[1.5rem] rounded-full bg-[rgba(0,0,0,0.5)] cursor-pointer"
                    onClick={() => handleBooking(treatments?.[2])}
                  >
                    <ClipBoardCustom
                      stroke="#FFFFFF"
                      className="w-full h-full"
                    />
                  </div>
                </div>
              </div>
            )}
          </div>
          {treatments?.[3] && (
            <div className="group relative w-[34.5rem] h-[24rem] border hover:bg-[rgba(0,0,0,0.3)] ">
              <img
                src={formatUrl(
                  treatments?.[3]?.attributes?.banner?.data?.attributes?.url
                )}
                className="w-full h-full object-cover"
                loading="lazy"
              />
              <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-lg ">
                <p className="text-[1.6rem] text-white font-[500] max-w-[20rem] line-clamp-2">
                  {treatments?.[3]?.attributes?.title}
                </p>
              </div>
              <div className="absolute inset-0 bg-black bg-opacity-30  items-center justify-center hidden group-hover:flex ">
                <div
                  className="w-[8rem] h-[8rem] p-[1.5rem] rounded-full bg-[rgba(0,0,0,0.5)] cursor-pointer"
                  onClick={() => handleBooking(treatments?.[3])}
                >
                  <ClipBoardCustom stroke="#FFFFFF" className="w-full h-full" />
                </div>
              </div>
            </div>
          )}

          <div className="h-[24rem] grid grid-rows-[38%_56%] gap-[1.6rem]">
            {treatments?.[4] && (
              <div className="group relative w-[34.5rem] h-full border hover:bg-[rgba(0,0,0,0.3)] ">
                <img
                  src={formatUrl(
                    treatments?.[4]?.attributes?.banner?.data?.attributes?.url
                  )}
                  className="w-full h-full object-cover"
                  loading="lazy"
                />
                <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-lg">
                  <p className="text-[1.6rem] text-white font-[500] max-w-[20rem] line-clamp-2">
                    {treatments?.[4]?.attributes?.title}
                  </p>
                </div>
                <div className="absolute inset-0 bg-black bg-opacity-30  items-center justify-center hidden group-hover:flex ">
                  <div
                    className="w-[8rem] h-[8rem] p-[1.5rem] rounded-full bg-[rgba(0,0,0,0.5)] cursor-pointer"
                    onClick={() => handleBooking(treatments?.[4])}
                  >
                    <ClipBoardCustom
                      stroke="#FFFFFF"
                      className="w-full h-full"
                    />
                  </div>
                </div>
              </div>
            )}
            {treatments?.[5] && (
              <div className="group relative w-[34.5rem] h-full border hover:bg-[rgba(0,0,0,0.3)] ">
                <img
                  src={formatUrl(
                    treatments?.[5]?.attributes?.banner?.data?.attributes?.url
                  )}
                  className="w-full h-full object-cover"
                  loading="lazy"
                />
                <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-lg ">
                  <p className="text-[1.6rem] text-white font-[500] max-w-[20rem] line-clamp-2">
                    {treatments?.[5]?.attributes?.title}
                  </p>
                </div>
                <div className="absolute inset-0 bg-black bg-opacity-30  items-center justify-center hidden group-hover:flex ">
                  <div
                    className="w-[8rem] h-[8rem] p-[1.5rem] rounded-full bg-[rgba(0,0,0,0.5)] cursor-pointer"
                    onClick={() => handleBooking(treatments?.[5])}
                  >
                    <ClipBoardCustom
                      stroke="#FFFFFF"
                      className="w-full h-full"
                    />
                  </div>
                </div>
              </div>
            )}
          </div>
        </div>
      </div>
    );
  }
  if (page === "booking") {
    return (
      <div className="max-w-[140rem] mx-auto">
        <p className="text-[2rem]">Phương pháp trị liệu</p>
        <div className="mt-[2rem] flex justify-start items-center gap-[1.6rem]">
          {treatments?.[0] && (
            <div className="group relative w-[31.6rem] h-[35.2rem] border hover:bg-[rgba(0,0,0,0.3)] ">
              <img
                src={formatUrl(
                  treatments?.[0]?.attributes?.banner?.data?.attributes?.url
                )}
                className="w-full h-full object-cover"
                loading="lazy"
              />
              <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-lg">
                <p className="text-[1.6rem] text-white font-[500] max-w-[20rem] line-clamp-2">
                  {treatments?.[0]?.attributes?.title}
                </p>
              </div>
              <div className="absolute inset-0 bg-black bg-opacity-30  items-center justify-center hidden group-hover:flex ">
                <div
                  className="w-[8rem] h-[8rem] p-[1.5rem] rounded-full bg-[rgba(0,0,0,0.5)] cursor-pointer"
                  onClick={() => handleBooking(treatments?.[0])}
                >
                  <ClipBoardCustom stroke="#FFFFFF" className="w-full h-full" />
                </div>
              </div>
            </div>
          )}
          <div className="h-[35.2rem] grid grid-rows-[57%_38.5%] gap-[1.6rem]">
            {treatments?.[1] && (
              <div className="group relative w-[34.5rem] h-full border hover:bg-[rgba(0,0,0,0.3)] ">
                <img
                  src={formatUrl(
                    treatments?.[1]?.attributes?.banner?.data?.attributes?.url
                  )}
                  className="w-full h-full object-cover"
                  loading="lazy"
                />
                <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-lg">
                  <p className="text-[1.6rem] text-white font-[500] max-w-[20rem] line-clamp-2">
                    {treatments?.[1]?.attributes?.title}
                  </p>
                </div>
                <div className="absolute inset-0 bg-black bg-opacity-30  items-center justify-center hidden group-hover:flex ">
                  <div
                    className="w-[8rem] h-[8rem] p-[1.5rem] rounded-full bg-[rgba(0,0,0,0.5)] cursor-pointer"
                    onClick={() => handleBooking(treatments?.[1])}
                  >
                    <ClipBoardCustom
                      stroke="#FFFFFF"
                      className="w-full h-full"
                    />
                  </div>
                </div>
              </div>
            )}
            {treatments?.[2] && (
              <div className="group relative w-[34.5rem] h-full border hover:bg-[rgba(0,0,0,0.3)] ">
                <img
                  src={formatUrl(
                    treatments?.[2]?.attributes?.banner?.data?.attributes?.url
                  )}
                  className="w-full h-full object-cover"
                  loading="lazy"
                />
                <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-lg">
                  <p className="text-[1.6rem] text-white font-[500] max-w-[20rem] line-clamp-2">
                    {treatments?.[2]?.attributes?.title}
                  </p>
                </div>
                <div className="absolute inset-0 bg-black bg-opacity-30  items-center justify-center hidden group-hover:flex ">
                  <div
                    className="w-[8rem] h-[8rem] p-[1.5rem] rounded-full bg-[rgba(0,0,0,0.5)] cursor-pointer"
                    onClick={() => handleBooking(treatments?.[2])}
                  >
                    <ClipBoardCustom
                      stroke="#FFFFFF"
                      className="w-full h-full"
                    />
                  </div>
                </div>
              </div>
            )}
          </div>
          {treatments?.[3] && (
            <div className="group relative w-[34.5rem] h-[35.2rem] border hover:bg-[rgba(0,0,0,0.3)] ">
              <img
                src={formatUrl(
                  treatments?.[3]?.attributes?.banner?.data?.attributes?.url
                )}
                className="w-full h-full object-cover"
                loading="lazy"
              />
              <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-lg">
                <p className="text-[1.6rem] text-white font-[500] max-w-[20rem] line-clamp-2">
                  {treatments?.[3]?.attributes?.title}
                </p>
              </div>
              <div className="absolute inset-0 bg-black bg-opacity-30  items-center justify-center hidden group-hover:flex ">
                <div
                  className="w-[8rem] h-[8rem] p-[1.5rem] rounded-full bg-[rgba(0,0,0,0.5)] cursor-pointer"
                  onClick={() => handleBooking(treatments?.[3])}
                >
                  <ClipBoardCustom stroke="#FFFFFF" className="w-full h-full" />
                </div>
              </div>
            </div>
          )}

          <div className="h-[35.2rem] grid grid-rows-[38.5%_57%] gap-[1.6rem]">
            {treatments?.[4] && (
              <div className="group relative w-[34.5rem] h-full border hover:bg-[rgba(0,0,0,0.3)] ">
                <img
                  src={formatUrl(
                    treatments?.[4]?.attributes?.banner?.data?.attributes?.url
                  )}
                  className="w-full h-full object-cover"
                  loading="lazy"
                />
                <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-lg">
                  <p className="text-[1.6rem] text-white font-[500] max-w-[20rem] line-clamp-2">
                    {treatments?.[4]?.attributes?.title}
                  </p>
                </div>
                <div className="absolute inset-0 bg-black bg-opacity-30  items-center justify-center hidden group-hover:flex ">
                  <div
                    className="w-[8rem] h-[8rem] p-[1.5rem] rounded-full bg-[rgba(0,0,0,0.5)] cursor-pointer"
                    onClick={() => handleBooking(treatments?.[4])}
                  >
                    <ClipBoardCustom
                      stroke="#FFFFFF"
                      className="w-full h-full"
                    />
                  </div>
                </div>
              </div>
            )}
            {treatments?.[5] && (
              <div className="group relative w-[34.5rem] h-full border hover:bg-[rgba(0,0,0,0.3)] cursor-pointer">
                <img
                  src={formatUrl(
                    treatments?.[5]?.attributes?.banner?.data?.attributes?.url
                  )}
                  className="w-full h-full object-cover"
                  loading="lazy"
                />
                <div className="absolute bottom-[1.2rem] left-[1.2rem] p-[0.8rem_1.2rem] border border-solid border-white backdrop-blur-lg">
                  <p className="text-[1.6rem] text-white font-[500] max-w-[20rem] line-clamp-2">
                    {treatments?.[5]?.attributes?.title}
                  </p>
                </div>
                <div className="absolute inset-0 bg-black bg-opacity-30  items-center justify-center hidden group-hover:flex ">
                  <div
                    className="w-[8rem] h-[8rem] p-[1.5rem] rounded-full bg-[rgba(0,0,0,0.5)] cursor-pointer"
                    onClick={() => handleBooking(treatments?.[5])}
                  >
                    <ClipBoardCustom
                      stroke="#FFFFFF"
                      className="w-full h-full"
                    />
                  </div>
                </div>
              </div>
            )}
          </div>
        </div>
      </div>
    );
  }
};

export default TreatmentComponent;
