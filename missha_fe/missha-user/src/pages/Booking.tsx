import { useEffect, useState } from "react";
import svgs from "../assets/svgs";
import BannerBooking from "../components/Pages/Booking/BannerBooking";
import ModalComponent from "../components/Modal";
import BookingForm from "../components/forms/BookingForm";
import { useLocation, useNavigate } from "react-router-dom";
import WrapperTreatments from "../components/Pages/Booking/WrapperTreatments";
import { useQueryServices } from "../hooks/queries/services.query";
import formatUrl from "../utils/functions/formatUrl";
import { formatPrice } from "../utils/functions/formatPrice";
import paths from "../utils/constants/paths";
import CartCustom from "../assets/svgs/Custom/CartCustom";
import { ServiceType } from "../types/response/service";
import { BaseData } from "../types/base/baseData";
import ClipBoardCustom from "../assets/svgs/Custom/ClipBoard";
import { Tooltip } from "antd";
const Booking = () => {
  const navigate = useNavigate();
  const location = useLocation();
  const { treatmentSelected } = location.state || {};
  const [openBookingForm, setOpenBookingForm] = useState<boolean>(false);
  const { data: dateServices } = useQueryServices({
    populate: "deep, 3",
    "sort[0]": "createdAt:asc",
    "pagination[pageSize]": 200,
  });

  const { data: dataNewServices } = useQueryServices({
    populate: "deep, 3",
    "pagination[pageSize]": 6,
    "pagination[page]": 1,
    "sort[0]": "createdAt:desc",
  });
  const handleCancelForm = () => {
    setOpenBookingForm(false);
    navigate(paths.BOOKING);
  };

  useEffect(() => {
    if (treatmentSelected?.id) {
      setOpenBookingForm(true);
    }
    window.history.replaceState({}, "");
  }, [treatmentSelected]);

  const handleBooking = (treatment: BaseData<ServiceType>) => {
    navigate(paths.BOOKING, {
      state: {
        treatmentSelected: treatment,
      },
    });
  };
  return (
    <div className="w-ful pt-[1.2rem] pb-[3.2rem] bg-background mt-[5.8rem]">
      <BannerBooking
        setOpenBookingForm={setOpenBookingForm}
        treatmentSelected={treatmentSelected}
      />

      <WrapperTreatments treatments={dateServices} />

      <div className="max-w-[140rem] mx-auto bg-white p-[2.4rem]">
        <p className="text-[2rem]">Phương pháp trị liệu mới</p>
        <div className="mt-[2rem] flex justify-start items-center gap-[1.6rem]">
          {dataNewServices?.map((newServices, index) => (
            <div key={index} className="relative w-[24rem] bg-[#d3d3d3]">
              <div className="group relative">
                <div className="h-[19rem]">
                  <img
                    src={formatUrl(
                      newServices?.attributes?.banner?.data?.attributes?.url
                    )}
                    className="w-full h-full object-cover"
                    alt={`Treatment ${index + 1}`}
                  />
                </div>
                {/* <div className="absolute top-[1.2rem] left-[0.8rem] bg-[#FF9800] p-[0.2rem_1.2rem]">
                <p className="text-white text-[1.4rem] font-[500]">9.5</p>
              </div> */}
                <div className="absolute inset-0 bg-black bg-opacity-30  items-center justify-center hidden group-hover:flex ">
                  <div
                    className="w-[8rem] h-[8rem] p-[1.5rem] rounded-full bg-[rgba(0,0,0,0.5)] cursor-pointer"
                    onClick={() => handleBooking(newServices)}
                  >
                    <ClipBoardCustom
                      stroke="#FFFFFF"
                      className="w-full h-full"
                    />
                  </div>
                </div>
              </div>

              <div className="mt-[0.8rem] p-[0.8rem_0.8rem_0_0.8rem]">
                <p className="text-[1.6rem] font-[500]">
                  {newServices?.attributes?.title}
                </p>
              </div>
              <div className="flex justify-between items-center p-[0.8rem]">
                <p className="text-[1.6rem] font-[600]">
                  {formatPrice(newServices?.attributes?.price)}
                </p>
                <div className="w-[2.4rem] h-[2.4rem]">
                  <Tooltip title={newServices?.attributes?.short_description}>
                    <img
                      src={svgs.info}
                      className="w-full h-full rotate-180"
                      alt="Arrow"
                    />
                  </Tooltip>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>

      {openBookingForm && (
        <ModalComponent
          open={openBookingForm}
          onCancel={handleCancelForm}
          title="Lên lịch hẹn chăm sóc da"
          closable
        >
          <BookingForm
            treatmentSelected={treatmentSelected}
            handleCancel={handleCancelForm}
          />
        </ModalComponent>
      )}
    </div>
  );
};

export default Booking;
