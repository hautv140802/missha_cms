import { Spin } from "antd";
import { BaseData } from "../../../../types/base/baseData";
import { BookingType } from "../../../../types/response/booking";
import BookingItem from "./BookingItem";

interface IWrapperListBookingProps {
  dataBookings: BaseData<BookingType>[];
  isLoading?: boolean;
}
const WrapperListBooking = (props: IWrapperListBookingProps) => {
  const { dataBookings, isLoading } = props;

  if (isLoading)
    return (
      <div className="bg-white p-[2.4rem] flex justify-center items-center py-[10rem]">
        <Spin size="large" />
      </div>
    );

  if (!isLoading && dataBookings.length === 0)
    return (
      <div className="bg-white p-[2.4rem] py-[10rem] flex justify-center items-center">
        <p className="text-center text-[2rem] py-[10rem] text-[#ff9900]">
          Chưa có đặt lịch SPA!
        </p>
      </div>
    );

  return (
    <div className="flex flex-col gap-[1.2rem] bg-[#F7F7F7]">
      {dataBookings?.map((booking, index) => (
        <BookingItem key={index} booking={booking} />
      ))}
    </div>
  );
};

export default WrapperListBooking;
