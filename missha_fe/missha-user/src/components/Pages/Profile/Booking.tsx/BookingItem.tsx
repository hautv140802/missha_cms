import { Divider } from "antd";
import images from "../../../../assets/images";
import ButtonComponent from "../../../Button";

const BookingItem = () => {
  return (
    <div className="flex flex-col gap-[1.2rem] bg-white p-[1.2rem]">
      <div className="flex justify-start items-center gap-[1.2rem]">
        <div className="min-w-[8.2rem] w-[8.2rem] min-h-[8.2rem] h-[8.2rem] border">
          <img
            src={images.treatment_1}
            className="w-full h-full object-cover"
          />
        </div>

        <div className="w-full flex justify-between items-start h-[8.2rem]">
          <div className="w-full flex flex-col gap-[0.8rem]">
            <p className="text-[1.6rem] leading-[2.2rem] text-[rgba(0,0,0,0.87)] max-w-[30rem] line-clamp-1">
              Bộ Chăn Gối Văn Phòng 3 trong 1 Fhome
            </p>
            <div className="flex justify-between items-end">
              <span className="text-[1.4rem] text-black"> 450.000 đ</span>
            </div>
          </div>
          <div className="flex flex-col gap-[0.4rem]">
            <p className="text-nowrap text-[1.4rem]">
              Ngày booking: <span>23/20/2024</span>
            </p>
            <p className="text-nowrap text-[1.6rem] text-[#26AA96]">
              Chờ xác nhận
            </p>
            <div>
              <p className="text-[1.2rem]">034 456 7890</p>
              <p className="text-[1.2rem]">Nguyễn Văn A</p>
            </div>
          </div>
        </div>
      </div>
      <Divider className="my-0" />
      <div className="flex justify-end items-center">
        <ButtonComponent
          type="text"
          text="Hủy"
          className="!w-[10rem] !border !border-solid !border-[rgba(0,0,0,0.87)]"
        />
      </div>
    </div>
  );
};

export default BookingItem;
