import { useState, useEffect } from "react";
import { useSearchParams } from "react-router-dom";
import WrapperStatus from "../../components/Pages/Profile/WrapperStatus";
import { useQueryBookings } from "../../hooks/queries/bookings.query";
import bookingStatus from "../../utils/constants/booking";
import paths from "../../utils/constants/paths";
import { Pagination } from "antd";
import WrapperListBooking from "../../components/Pages/Profile/Booking/WrapperListBooking";
import { getUserProfile } from "../../utils/functions/getUserInfo";

const Bookings = () => {
  const user = getUserProfile() || {};
  const [searchParams] = useSearchParams();
  const status = searchParams.get("status") || undefined;
  const [currentPage, setCurrentPage] = useState<number>(1);

  useEffect(() => {
    setCurrentPage(1);
  }, [status]);
  const {
    data: dataBookings,
    isLoading: isLoadingBookings,
    pagination: paginationBookings,
  } = useQueryBookings({
    populate: "deep, 3",
    "filters[status]":
      status === "ALL" || status === undefined
        ? undefined
        : bookingStatus[status],
    "pagination[pageSize]": 5,
    "pagination[page]": currentPage,
    "sort[0]": "updatedAt:desc",
    "filters[user]": user?.id?.toString(),
  });
  return (
    <div className="w-ful bg-white">
      <div className="p-[2.4rem]">
        <p className="text-[1.6rem] font-[500] uppercase">Đơn hàng</p>
        <WrapperStatus status={bookingStatus} path={paths.PROFILE_BOOKINGS} />
      </div>
      <div className="w-full h-[1.6rem] bg-background"></div>

      <WrapperListBooking
        dataBookings={dataBookings}
        isLoading={isLoadingBookings}
      />
      <div className="bg-background flex justify-end items-center py-[1.2rem]">
        <Pagination
          current={paginationBookings?.page || 1}
          total={paginationBookings?.total || 0}
          pageSize={paginationBookings?.pageSize || 5}
          onChange={(page) => setCurrentPage(page)}
        />
      </div>
    </div>
  );
};

export default Bookings;
