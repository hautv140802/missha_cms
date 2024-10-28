import { Divider, Spin } from "antd";
import OrderItem from "./OrderItem";
import { useState } from "react";
import svgs from "../../../../assets/svgs";
import { useNavigate } from "react-router-dom";
import paths from "../../../../utils/constants/paths";
import { BaseData } from "../../../../types/base/baseData";
import { OrderType } from "../../../../types/response/order";
import { formatPrice } from "../../../../utils/functions/formatPrice";
import ButtonComponent from "../../../Button";
import orderStatus from "../../../../utils/constants/orderStatus";
import orderApis from "../../../../apis/orderApis";
import toast from "react-hot-toast";
import axios from "axios";
import { addToCart } from "../../../../utils/functions/addToCart";
import formatUrl from "../../../../utils/functions/formatUrl";
import StatusOrder from "../../../StatusOrder";
interface IOrderListProps {
  showHeader?: boolean;
  order: BaseData<OrderType>;
}
const OrderList = (props: IOrderListProps) => {
  const { showHeader, order } = props;
  const navigate = useNavigate();
  const [showAll, setShowAll] = useState<boolean>(false);

  const newOrderDetail = showAll
    ? order?.attributes?.order_details?.data
    : order?.attributes?.order_details?.data?.slice(0, 3);

  const totalQuantity = order?.attributes?.order_details?.data.reduce(
    (acc, order_detail) => acc + (order_detail.attributes.quantity || 0),
    0
  );

  const handleCancel = async () => {
    try {
      const resOrder = await orderApis.update(order.id, orderStatus["CANCEL"]);

      if (resOrder?.data?.data) {
        toast.success("Hủy đơn hàng thành công!");
        navigate(`${paths.PROFILE_ORDERS}?status=CANCEL`);
      }
    } catch (error) {
      console.log(error);
      if (axios.isAxiosError(error)) {
        toast.error(
          `Hủy đơn hàng thất bại: ${error?.response?.data?.error?.message}`
        );
      } else {
        toast.error(`Hủy đơn hàng thất bại: ${error}`);
      }
    }
  };

  const handleBuyAgain = () => {
    for (const orderDetail of order?.attributes?.order_details?.data || []) {
      const product = orderDetail.attributes.product.data;
      addToCart({
        id: product.id,
        avatar: formatUrl(product.attributes.avatar.data.attributes.url) || "",
        name: product.attributes.name,
        price: product.attributes.price,
        sale_price: product.attributes.sale_price,
        slug: product.attributes.slug,
        quantity: orderDetail.attributes.quantity,
      });
    }

    toast.success("Mua lại thành công!");
  };

  const handleReturn = async () => {
    try {
      const resOrder = await orderApis.update(order.id, orderStatus["RETURN"]);

      if (resOrder?.data?.data) {
        toast.success("Trả hàng thành công!");
        navigate(`${paths.PROFILE_ORDERS}?status=RETURN`);
      }
    } catch (error) {
      console.log(error);
      if (axios.isAxiosError(error)) {
        toast.error(
          `Trả hàng thất bại: ${error?.response?.data?.error?.message}`
        );
      } else {
        toast.error(`Trả hàng thất bại: ${error}`);
      }
    }
  };

  return (
    <div className="bg-white p-[2.4rem]">
      {showHeader && (
        <div className="flex justify-between items-center">
          <p className="text-[1.6rem]">
            Mã đơn hàng:{" "}
            <span className="text-[1.6rem] font-[500]">
              {order?.attributes?.order_code}
            </span>
          </p>
          <StatusOrder status={order?.attributes?.status} />
        </div>
      )}
      <Divider className="my-[1.2rem]" />
      <div className="bg-white flex flex-col gap-[1.2rem] cursor-pointer">
        <div
          onClick={() =>
            navigate(`${paths.PROFILE_ORDERS}/${order?.attributes?.order_code}`)
          }
        >
          {newOrderDetail?.map((order_detail, index) => (
            <OrderItem key={index} order_detail={order_detail} />
          ))}
        </div>

        {order?.attributes?.order_details?.data?.length > 3 && (
          <div
            className="flex justify-start items-center gap-[1.2rem] mt-[1.2rem] cursor-pointer"
            onClick={() => setShowAll(!showAll)}
          >
            <p className="text-[1.4rem] text-[rgba(0,0,0,0.54)]">
              {showAll ? "Thu gọn" : "Xem thêm"}{" "}
              {order?.attributes?.order_details?.data?.length - 3} sản phẩm
            </p>
            <div className="w-[1.2rem] h-[1.2rem]">
              <img
                src={showAll ? svgs.chevonDobuleUp : svgs?.chevonDobuleDown}
                className="w-full h-full"
              />
            </div>
          </div>
        )}
      </div>
      <Divider className="my-[1.2rem]" />
      <div className="flex flex-col justify-start items-end gap-[1rem]">
        <p className="text-[rgba(0,0,0,0.54)] text-[1.6rem]">
          Tổng sản phẩm:{" "}
          <span className="text-[1.6rem] text-black font-[500]">
            {totalQuantity}
          </span>
        </p>
        <p className="text-[rgba(0,0,0,0.54)] text-[2.4rem]">
          Thành tiền:{" "}
          <span className="text-[2.4rem] text-[#ff9900]">
            {formatPrice(Number(order?.attributes?.total))}
          </span>
        </p>
      </div>
      <div className="flex justify-end items-end gap-[1.6rem] mt-[1.6rem]">
        {order?.attributes?.status === orderStatus["WAITING_CONFIRM"] && (
          <div className="w-[25%]">
            <ButtonComponent text="Hủy đơn hàng" onClick={handleCancel} />
          </div>
        )}
        {(order?.attributes?.status === orderStatus["CANCEL"] ||
          order?.attributes?.status === orderStatus["RETURN"]) && (
          <div className="w-[25%]">
            <ButtonComponent
              type="primary"
              text="Mua lại"
              onClick={handleBuyAgain}
            />
          </div>
        )}
        {order?.attributes?.status === orderStatus["COMPLETE"] && (
          <div className="w-[25%]">
            <ButtonComponent text="Trả hàng" onClick={handleReturn} />
          </div>
        )}
      </div>
    </div>
  );
};

export default OrderList;
