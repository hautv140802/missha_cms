import { useState, useEffect } from "react";
import { useSearchParams } from "react-router-dom";
import BookingItem from "../../components/Pages/Profile/Booking.tsx/BookingItem";
import WrapperStatus from "../../components/Pages/Profile/WrapperStatus";
import { useQueryBookings } from "../../hooks/queries/bookings.query";
import bookingStatus from "../../utils/constants/booking";
import paths from "../../utils/constants/paths";

const Bookings = () => {
  const [searchParams] = useSearchParams();
  const status = searchParams.get("status") || undefined;
  const [currentPage, setCurrentPage] = useState<number>(1);

  useEffect(() => {
    setCurrentPage(1);
  }, [status]);
  const { data: dataBookings } = useQueryBookings({
    populate: "deep, 3",
    "filters[status]":
      status === "ALL" || status === undefined
        ? undefined
        : bookingStatus[status],
    "pagination[pageSize]": 5,
    "pagination[page]": currentPage,
    "sort[0]": "updatedAt:desc",
  });
  return (
    <div className="w-ful bg-white">
      <div className="p-[2.4rem]">
        <p className="text-[1.6rem] font-[500] uppercase">Đơn hàng</p>
        <WrapperStatus status={bookingStatus} path={paths.PROFILE_BOOKINGS} />
      </div>
      <div className="w-full h-[1.6rem] bg-[#F7F7F7]"></div>

      <div className="flex flex-col gap-[1.2rem] bg-[#F7F7F7]">
        {dataBookings?.map((booking, index) => (
          <BookingItem key={index} booking={booking} />
        ))}
      </div>
    </div>
  );
};

export default Bookings;
