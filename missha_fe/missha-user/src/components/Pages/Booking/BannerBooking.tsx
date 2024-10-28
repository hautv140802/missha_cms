import { Divider } from "antd";
import svgs from "../../../assets/svgs";
import images from "../../../assets/images";
import { getUserProfile } from "../../../utils/functions/getUserInfo";
import { BaseData } from "../../../types/base/baseData";
import { ServiceType } from "../../../types/response/service";

interface IBannerBookingProps {
  setOpenBookingForm: (_open: boolean) => void;
  treatmentSelected?: BaseData<ServiceType>;
}
const BannerBooking = (props: IBannerBookingProps) => {
  const { setOpenBookingForm, treatmentSelected } = props;
  const user = getUserProfile() || {};
  return (
    <div className="relative w-[140rem] h-[29rem] mx-auto">
      <img src={images.banner_booking} className="w-full h-full object-cover" />
      <div className="absolute top-[50%] left-[50%] translate-x-[-50%] translate-y-[-50%] backdrop-blur p-[1.2rem_1.2rem] rounded-[0.8rem] shadow-md">
        <p className="text-[4rem] font-[600] italic text-center">
          Schedule your skincare appointment now
        </p>
        <p className="text-[2rem] text-center">
          Find the perfect treatment for your skin needs!
        </p>
      </div>

      <div className="absolute bg-[#f7f7f7] overflow-hidden rounded-[3.2rem] bottom-0 left-[50%] translate-x-[-50%] translate-y-[50%]">
        <div className="flex justify-between items-center px-[2.4rem] shadow-md">
          <div className="w-[90rem] flex justify-between px-[1.6rem_4.8rem] ">
            <div className="flex flex-col justify-center items-center min-w-[18rem] min-h-[8rem]">
              <p className="text-[2rem] font-[500]">Khách hàng</p>
              <p className="text-[1.6rem]">{user?.full_name}</p>
            </div>
            <div className="py-[1rem]">
              <Divider className="my-0 h-full bg-[#d3d3d3] " type="vertical" />
            </div>
            <div className="flex flex-col justify-center items-center min-w-[18rem] min-h-[8rem]">
              <p className="text-[2rem] font-[500]">Email</p>
              <p className="text-[1.6rem]">{user?.email}</p>
            </div>
            <div className="py-[1rem]">
              <Divider className="my-0 h-full bg-[#d3d3d3]" type="vertical" />
            </div>
            <div className="flex flex-col justify-center items-center min-w-[18rem] min-h-[8rem]">
              <p className="text-[2rem] font-[500]">Số điện thoại</p>
              <p className="text-[1.6rem]">{user?.phone}</p>
            </div>
            <div className="py-[1rem]">
              <Divider className="my-0 h-full bg-[#d3d3d3]" type="vertical" />
            </div>
            <div className="flex flex-col justify-center items-center min-w-[18rem] min-h-[8rem]">
              <p className="text-[2rem] font-[500]">Dịch vụ</p>
              <p className="text-[1.6rem]">
                {treatmentSelected?.id
                  ? treatmentSelected?.attributes?.title
                  : "Vui lòng chọn dịch vụ"}
              </p>
            </div>
          </div>
          <div
            className="w-[5rem] h-[5rem] bg-[#FF9800] p-[1.2rem] cursor-pointer"
            onClick={() => setOpenBookingForm(true)}
          >
            <img
              src={svgs.arrowLongRight}
              alt="arrow long right icon"
              className="w-full h-full"
            />
          </div>
        </div>
      </div>
    </div>
  );
};

export default BannerBooking;
