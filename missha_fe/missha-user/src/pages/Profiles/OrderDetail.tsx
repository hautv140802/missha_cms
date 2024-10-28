import { useNavigate, useParams } from "react-router-dom";
import svgs from "../../assets/svgs";
import OrderItem from "../../components/Pages/Profile/Orders/OrderItem";
import paths from "../../utils/constants/paths";
import { useQueryOrderBySlug } from "../../hooks/queries/orderBySlug.query";
import dayjs from "dayjs";
import { formatPrice } from "../../utils/functions/formatPrice";
import clsx from "clsx";
import orderStatus from "../../utils/constants/orderStatus";
import ButtonComponent from "../../components/Button";
import orderApis from "../../apis/orderApis";
import toast from "react-hot-toast";
import axios from "axios";
import { addToCart } from "../../utils/functions/addToCart";
import formatUrl from "../../utils/functions/formatUrl";
import { Spin } from "antd";

const OrderDetail = () => {
  const { orderCode } = useParams() || {};
  const navigate = useNavigate();
  const statusStyles: Record<string, string> = {
    "Chờ xác nhận": "text-[#25ebca] border-[#25ebca]",
    "Xác nhận": "text-[#26AA96] border-[#26AA96]",
    "Đang vận chuyển": "text-[#26AA96] border-[#26AA96]",
    "Hoàn thành": "text-[#096b63] border-[#096b63]",
    Huỷ: "text-[#eb6464] border-[#eb6464]",
    "Trả hàng": "text-[#eb6464] border-[#eb6464]",
  };

  const { data: dataOrder, isLoading: isLoadingOrder } = useQueryOrderBySlug({
    populate: "deep, 4",
    "filters[order_code]": orderCode,
  });

  const totalQuantity = dataOrder?.attributes?.order_details?.data.reduce(
    (acc, order_detail) => acc + (order_detail.attributes.quantity || 0),
    0
  );

  const handleCancel = async () => {
    if (!dataOrder?.id) return;
    try {
      const resOrder = await orderApis.update(
        dataOrder.id,
        orderStatus["CANCEL"]
      );

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
    for (const orderDetail of dataOrder?.attributes?.order_details?.data ||
      []) {
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
    if (!dataOrder?.id) return;
    try {
      const resOrder = await orderApis.update(
        dataOrder.id,
        orderStatus["RETURN"]
      );

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

  if (isLoadingOrder)
    return (
      <div className="w-ful bg-white p-[2.4rem] my-[10rem] flex justify-center items-center">
        <Spin size="large" />
      </div>
    );
  if (!isLoadingOrder && dataOrder?.id === undefined)
    return (
      <div className="bg-white p-[2.4rem] py-[10rem] flex justify-center items-center">
        <p className="text-center text-[2rem] py-[10rem] text-[#ff9900]">
          Đơn hàng không tồn tại!
        </p>
      </div>
    );
  return (
    <div className="w-ful bg-white p-[2.4rem]">
      <div className="flex flex-col gap-[1.6rem]">
        <div className="flex justify-between items-center border-b-[0.1rem] pb-[1.2rem]">
          <div
            className="flex justify-start items-center gap-[1.2rem] cursor-pointer"
            onClick={() => navigate(paths.PROFILE_ORDERS)}
          >
            <div className="w-[2rem] h-[2rem] p-[0.1rem]">
              <img src={svgs.arrowLeft} alt="back" />
            </div>
            <p className="text-[1.6rem] text-[#0000008a]">Trở lại</p>
          </div>
          <div className="flex justify-end items-center">
            <div className="text-[1.4rem] text-[#0000008a]">
              Mã đơn hàng:{" "}
              <span className="text-[1.4rem] font-[500]">{orderCode}</span>
            </div>
            <span className="mx-[0.3rem] text-[1.6rem] text-[#0000008a]">
              |
            </span>
            <div className="text-[1.4rem] text-[#0000008a]">
              Thời gian:{" "}
              <span className="text-[1.4rem] font-[500]">
                {dayjs(dataOrder?.attributes.createdAt).format(
                  "HH:mm DD [Th]MM YYYY"
                )}
              </span>
            </div>
          </div>
        </div>
        <div className="w-full flex justify-between items-center gap-[1.2rem]">
          <div
            className={clsx(
              "w-fit border border-solid border-[#26AA96] p-[0.4rem_1.2rem]",
              statusStyles[dataOrder?.attributes?.status || ""]
            )}
          >
            <p
              className={clsx(
                "text-[#26AA96] text-[1.6rem] uppercase",
                statusStyles[dataOrder?.attributes?.status || ""]
              )}
            >
              {dataOrder?.attributes?.status}
            </p>
          </div>
          <p className="text-[1.4rem] text-[#0000008a]">
            Đơn hàng sẽ sớm vận chuyển vào ngày:{" "}
            <span className="text-[1.4rem] font-[500]">
              {dayjs(dataOrder?.attributes.createdAt)
                .add(4, "day")
                .format("HH:mm DD [Th]MM YYYY")}
            </span>
          </p>
        </div>
        <div className="border-b-[0.1rem] pb-[1.2rem]">
          <p className="text-[1.6rem]">Địa chỉ giao hàng</p>
          <div className="fex flex-col gap-[1.2rem] *:text-[1.4rem] *:text-[#0000008a]">
            <p className="font-[500]">
              {dataOrder?.attributes.customer_full_name}
            </p>
            <p> {dataOrder?.attributes.customer_phone}</p>
            <p>{dataOrder?.attributes?.shipping_address}</p>
          </div>
        </div>

        <div className="border-b-[0.1rem] pb-[1.2rem]">
          <p className="text-[1.6rem]">Thông tin đơn hàng</p>
          <div className="flex flex-col gap-[1.2rem] my-[1.6rem]">
            {dataOrder?.attributes?.order_details?.data?.map((item, index) => (
              <OrderItem key={index} order_detail={item} />
            ))}
          </div>
        </div>
        <div className="flex flex-col gap-[1.2rem]">
          <div className="flex justify-end items-center gap-[1.2rem]">
            <p className="text-[1.6rem] text-[#0000008a]">Tổng sản phẩm:</p>
            <p className="text-[1.6rem] min-w-[15rem] text-right">
              {totalQuantity}
            </p>
          </div>
          <div className="flex justify-end items-center gap-[1.2rem]">
            <p className="text-[1.6rem] text-[#0000008a]">Tổng tiền hàng:</p>
            <p className="text-[1.6rem] min-w-[15rem] text-right">
              {formatPrice(
                Number(dataOrder?.attributes?.total) -
                  Number(dataOrder?.attributes?.transport_fee) +
                  Number(
                    dataOrder?.attributes?.voucher?.data?.attributes
                      ?.amount_decrease || 0
                  )
              )}
            </p>
          </div>
          <div className="flex justify-end items-center gap-[1.2rem]">
            <p className="text-[1.6rem] text-[#0000008a]">Phí vận chuyển:</p>
            <p className="text-[1.6rem] min-w-[15rem] text-right">
              {formatPrice(Number(dataOrder?.attributes?.transport_fee))}
            </p>
          </div>
          {dataOrder?.attributes?.voucher?.data?.attributes
            ?.amount_decrease && (
            <div className="flex justify-end items-center gap-[1.2rem]">
              <p className="text-[1.6rem] text-[#0000008a]">
                Voucher từ Missha:
              </p>
              <p className="text-[1.6rem] min-w-[15rem] text-right">
                -{" "}
                {formatPrice(
                  Number(
                    dataOrder?.attributes?.voucher?.data?.attributes
                      ?.amount_decrease
                  )
                )}
              </p>
            </div>
          )}
          <div className="flex justify-end items-center gap-[1.2rem]">
            <p className="text-[2rem] font-[500]">Thành tiền:</p>
            <p className="min-w-[15rem] text-[2rem] text-[#ff9900] font-[500]  text-right">
              {formatPrice(Number(dataOrder?.attributes?.total))}
            </p>
          </div>
        </div>
      </div>
      <div className="flex justify-end items-end gap-[1.6rem] mt-[1.6rem]">
        {dataOrder?.attributes?.status === orderStatus["WAITING_CONFIRM"] && (
          <div className="w-[25%]">
            <ButtonComponent text="Hủy đơn hàng" onClick={handleCancel} />
          </div>
        )}
        {(dataOrder?.attributes?.status === orderStatus["CANCEL"] ||
          dataOrder?.attributes?.status === orderStatus["RETURN"]) && (
          <div className="w-[25%]">
            <ButtonComponent
              type="primary"
              text="Mua lại"
              onClick={handleBuyAgain}
            />
          </div>
        )}
        {dataOrder?.attributes?.status === orderStatus["COMPLETE"] && (
          <div className="w-[25%]">
            <ButtonComponent text="Trả hàng" onClick={handleReturn} />
          </div>
        )}
      </div>
    </div>
  );
};

export default OrderDetail;
