import images from "../../../../assets/images";
import { BaseData } from "../../../../types/base/baseData";
import { OrderDetailType } from "../../../../types/response/orderDetail";
import { formatPrice } from "../../../../utils/functions/formatPrice";
import formatUrl from "../../../../utils/functions/formatUrl";

interface IOrderItemProps {
  order_detail: BaseData<OrderDetailType>;
}
const OrderItem = (props: IOrderItemProps) => {
  const { order_detail } = props;
  return (
    <div className="flex justify-start items-center gap-[1.2rem]">
      <div className="min-w-[8.2rem] w-[8.2rem] min-h-[8.2rem] h-[8.2rem] border">
        <img
          src={
            formatUrl(
              order_detail?.attributes?.product?.data?.attributes?.avatar?.data
                ?.attributes?.url
            ) || images.imageEmpty
          }
          className="w-full h-full object-cover"
        />
      </div>
      <div className="w-full flex flex-col justify-between items-start h-[8.2rem]">
        <div className="w-full flex flex-col gap-[0.8rem]">
          <p className="text-[1.6rem] leading-[2.2rem] text-[rgba(0,0,0,0.87)] max-w-[30rem] line-clamp-1">
            {order_detail?.attributes?.product?.data?.attributes?.name}
          </p>
          <div className="flex justify-between items-end">
            <span className="text-[1.4rem] text-black">
              x{order_detail?.attributes?.quantity}
            </span>
          </div>
        </div>
        <div className="border border-solid border-[#26AA96] p-[0.2rem_0.4rem]">
          <p className="text-[#26AA96] text-[1.2rem]">
            Trả hàng miễn phí 15 ngày
          </p>
        </div>
      </div>

      <div className="w-full flex flex-col justify-center items-end ">
        <span className="text-[1.6rem] text-[#ff9900]">
          {formatPrice(order_detail?.attributes?.unit_price)}
        </span>
      </div>
    </div>
  );
};

export default OrderItem;
