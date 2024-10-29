import { Divider } from "antd";
import ButtonComponent from "../../../Button";
import { BaseData } from "../../../../types/base/baseData";
import { BookingType } from "../../../../types/response/booking";
import formatUrl from "../../../../utils/functions/formatUrl";
import StatusOrder from "../../../StatusOrder";
import dayjs from "dayjs";
import { formatPrice } from "../../../../utils/functions/formatPrice";
import bookingStatus from "../../../../utils/constants/booking";
import bookingApis from "../../../../apis/bookingApis";
import toast from "react-hot-toast";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import paths from "../../../../utils/constants/paths";

interface IBookingItemProps {
  booking: BaseData<BookingType>;
}
const BookingItem = (props: IBookingItemProps) => {
  const { booking } = props;

  const navigate = useNavigate();
  const handleCancel = async () => {
    try {
      const resBooking = await bookingApis.updateStatus(
        booking.id,
        bookingStatus["CANCEL"]
      );

      if (resBooking?.data?.data) {
        toast.success("Hủy đặt lịch SPA thành công!");
        navigate(`${paths.PROFILE_BOOKINGS}?status=CANCEL`);
      }
    } catch (error) {
      console.log(error);
      if (axios.isAxiosError(error)) {
        toast.error(
          `Hủy đặt lịch SPA thất bại: ${error.response?.data?.error?.message}`
        );
      } else {
        toast.error(`Hủy đặt lịch SPA thất bại: ${error}`);
      }
    }
  };
  return (
    <div className="flex flex-col gap-[1.2rem] bg-white p-[1.2rem]">
      <div className="flex justify-start items-center gap-[1.2rem]">
        <div className="min-w-[8.2rem] w-[8.2rem] min-h-[8.2rem] h-[8.2rem] border">
          <img
            src={formatUrl(
              booking.attributes.service.data.attributes.banner.data.attributes
                .url
            )}
            className="w-full h-full object-cover"
            loading="lazy"
          />
        </div>

        <div className="w-full flex justify-between items-start h-[8.2rem]">
          <div className="w-full flex flex-col gap-[0.8rem]">
            <p className="text-[1.6rem] leading-[2.2rem] text-[rgba(0,0,0,0.87)] max-w-[30rem] line-clamp-1">
              {booking.attributes.service.data.attributes.title}
            </p>
            <div className="flex justify-between items-end">
              <span className="text-[1.4rem] text-black">
                {formatPrice(booking.attributes.service.data.attributes.price)}
              </span>
            </div>
          </div>
          <div className="flex flex-col gap-[0.4rem]">
            <p className="text-nowrap text-[1.4rem]">
              Ngày booking:{" "}
              <span>
                {dayjs(booking.attributes.date.toString()).format("DD/MM/YYYY")}
              </span>
            </p>

            <StatusOrder status={booking.attributes.status} />
            <div>
              <p className="text-[1.2rem]">
                {booking.attributes.customer_phone}
              </p>
              <p className="text-[1.2rem]">
                {booking.attributes.customer_full_name}
              </p>
            </div>
          </div>
        </div>
      </div>
      <Divider className="my-0" />
      <div className="flex justify-end items-center">
        {booking.attributes.status === bookingStatus["WAITING_CONFIRM"] && (
          <div className="w-[25%]">
            <ButtonComponent
              text="Hủy"
              className="!w-[10rem]"
              onClick={handleCancel}
            />
          </div>
        )}
      </div>
    </div>
  );
};

export default BookingItem;
