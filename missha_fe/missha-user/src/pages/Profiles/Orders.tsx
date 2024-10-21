import BookingItem from "../../components/Pages/Profile/Booking.tsx/BookingItem";
import WrapperStatus from "../../components/Pages/Profile/WrapperStatus";
import orderStatus from "../../utils/constants/orderStatus";
import paths from "../../utils/constants/paths";

const Orders = () => {
  return (
    <div className="w-ful bg-white">
      <div className="p-[2.4rem]">
        <p className="text-[1.6rem] font-[500] uppercase">Đơn hàng</p>
        <WrapperStatus status={orderStatus} path={paths.PROFILE_ORDERS} />
      </div>
      <div className="w-full h-[1.6rem] bg-[#F7F7F7]"></div>
      <div className="flex flex-col gap-[1.2rem] bg-[#F7F7F7]">
        {Array.from({ length: 5 }).map((_, index) => (
          <BookingItem key={index} />
        ))}
      </div>
    </div>
  );
};

export default Orders;
