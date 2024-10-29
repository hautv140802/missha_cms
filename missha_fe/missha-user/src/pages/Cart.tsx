import { useNavigate } from "react-router-dom";
import paths from "../utils/constants/paths";
import useCartStore from "../stores/useCartStore";
import { useState } from "react";
import BreadcrumbComponent from "../components/Breadcrumb";
import ReceivedInformation from "../components/Pages/Cart/ReceivedInformation";
import { Divider } from "antd";
import ScrollbarComponent from "../components/Scrollbar";
import CartItemComponent from "../components/CartItem";
import DividerComponent from "../components/Divider";
import WrapperVoucher from "../components/Pages/Cart/WrapperVoucher";
import { formatPrice } from "../utils/functions/formatPrice";
import ButtonComponent from "../components/Button";
import SelectComponent from "../components/Select";
import { VoucherType } from "../types/response/voucher";
import { BaseData } from "../types/base/baseData";
import orderDetailApis from "../apis/orderDetailApis";

import orderApis from "../apis/orderApis";
import { ReceivedInformationType } from "../types/common/receivedInformation";
import { getUserProfile } from "../utils/functions/getUserInfo";
import toast from "react-hot-toast";
import axios from "axios";

const breadcrumb = [
  {
    href: paths.HOME,
    title: "Trang chủ",
  },
  {
    href: paths.CART,
    title: "Giỏ hàng",
  },
];
const Cart = () => {
  const navigate = useNavigate();
  const { items, getTotalPrice, getTotalSaveMoney, clearCart } = useCartStore();
  const [information, setInformation] = useState<ReceivedInformationType>();
  const [selectedVoucher, setSelectedVoucher] = useState<
    BaseData<VoucherType> | undefined
  >();

  const totalPrice = getTotalPrice();
  const totalSaveMoney = getTotalSaveMoney();

  const discountValue = Number(
    selectedVoucher?.attributes?.amount_decrease || 0
  );
  const feeShip = 35000;

  const isInformation =
    information?.full_name &&
    information?.email &&
    information?.phone &&
    information?.address;

  const handleCreateOrderDetail = async () => {
    const orderDetailId: number[] = [];

    for (const item of items || []) {
      try {
        const resOrderDetail = await orderDetailApis.create({
          product: item?.id,
          quantity: item?.quantity,
          unit_price:
            Number(item?.sale_price) > 0 &&
            Number(item?.sale_price) < Number(item?.price)
              ? item?.sale_price?.toString()
              : item?.price?.toString(),
        });

        if (resOrderDetail) {
          orderDetailId.push(resOrderDetail?.data?.data?.id);
        }
      } catch (error) {
        console.log(error);
      }
    }

    return orderDetailId;
  };

  const handleCheckout = async () => {
    const orderDetails = await handleCreateOrderDetail();
    const user = getUserProfile();
    try {
      const resOrder = await orderApis.create({
        customer_email: information?.email || "",
        customer_full_name: information?.full_name || "",
        customer_phone: information?.phone || "",
        shipping_address: information?.address || "",
        order_details: orderDetails,
        payment_method: "COD",
        shipping_method: "Giao qua đối tác",
        status: "Chờ xác nhận",
        user: user?.id,
        reason: "",
        total: (totalPrice + feeShip - discountValue).toString(),
        transport_fee: "35000",
        voucher: selectedVoucher?.id,
      });

      if (resOrder) {
        toast.success("Đặt hàng thành công!");
        clearCart();
        navigate(paths.PROFILE_ORDERS);
      }
    } catch (error) {
      console.log(error);
      if (axios.isAxiosError(error)) {
        toast.error(
          `Đặt hàng thất bại: ${error?.response?.data?.error?.message}`
        );
      } else {
        toast.error(`Đặt hàng thất bại: ${error}`);
      }
    }
  };
  return (
    <div className="py-[1.2rem] mt-[5.8rem] bg-background">
      <div className="w-[140rem] mx-auto">
        <BreadcrumbComponent items={breadcrumb} />
      </div>

      <div className="w-[140rem] mx-auto p-[2.4rem]">
        <p className="text-[2.4rem] font-[600] uppercase text-center">
          Giỏ hàng
        </p>
      </div>

      <ReceivedInformation
        setInformation={setInformation}
        isInformation={!!isInformation}
        information={information}
      />
      {items?.length > 0 ? (
        <div className="w-[140rem] mx-auto flex justify-between items-start gap-[1.2rem]">
          <div className="w-[60%] shadow-md bg-white p-[2.4rem]">
            <div className="w-full flex justify-between items-center  ">
              <span className="w-[60%] text-[1.6rem] font-[500] text-black">
                Sản phẩm
              </span>

              <span className="w-[20%] text-[1.6rem] font-[500] text-black text-right">
                Số lượng
              </span>
              <span className="w-[20%] text-[1.6rem] font-[500] text-black text-right">
                Tổng
              </span>
              <span className="min-w-[10%]"></span>
            </div>

            <Divider />
            <div className="flex flex-col gap-[1.2rem] mt-[1.2rem]">
              <ScrollbarComponent height="67.6rem">
                {items?.length > 0 ? (
                  <div className="w-[99%]">
                    {items?.map((item, index) => (
                      <div key={index}>
                        <div className="py-[0.8rem]">
                          <CartItemComponent cart={item} />
                        </div>
                        <DividerComponent />
                      </div>
                    ))}
                  </div>
                ) : (
                  <div className="w-full h-[67.6rem] flex flex-col justify-center items-center gap-[1.6rem]">
                    <p className="text-center text-[2rem]">
                      Không có sản phẩm trong giỏ hàng
                    </p>
                    <p
                      className="text-center text-[2.4rem] text-[#ff9900] font-[500] underline cursor-pointer"
                      onClick={() => navigate(paths.HOME)}
                    >
                      Tiếp tục mua hàng!
                    </p>
                  </div>
                )}
              </ScrollbarComponent>
            </div>
          </div>
          <div className="w-[40%] flex flex-col gap-[1.6rem]">
            <WrapperVoucher
              selectedVoucher={selectedVoucher}
              setSelectedVoucher={setSelectedVoucher}
            />
            <div className="shadow-md p-[2.4rem]  bg-white">
              <p className="text-[2rem] font-[500] uppercase text-center">
                Phương thức giao hàng
              </p>
              <Divider className="my-[0.8rem]" />
              <div className="flex flex-col gap-[1.2rem]">
                <div className="w-full">
                  <SelectComponent
                    name="shippingPayment"
                    className="w-full text-[1.6rem]"
                    value={"GHTC"}
                    options={[
                      {
                        value: "GHTC",
                        label: "Giao hàng tiêu chuẩn (35.000 đ)",
                      },
                    ]}
                  />
                </div>
              </div>
            </div>

            <div className="shadow-md p-[2.4rem]  bg-white">
              <p className="text-[2rem] font-[500] uppercase text-center">
                Thông tin đơn hàng
              </p>
              <Divider className="my-[0.8rem]" />
              <div className="flex flex-col gap-[1.2rem]">
                <div className="flex flex-col gap-[0.4rem]">
                  <div className="flex justify-between items-center">
                    <p className="text-[1.4rem] font-[500]">Tạm tính:</p>
                    <p className="text-[1.6rem] font-[600]">
                      {formatPrice(totalPrice)}
                    </p>
                  </div>
                  <div className="flex justify-between items-center">
                    <p className="text-[1.4rem] font-[500]">Tiết kiệm:</p>
                    <p className="text-[1.6rem] font-[600]">
                      {formatPrice(totalSaveMoney)}
                    </p>
                  </div>
                  <div className="flex justify-between items-center">
                    <p className="text-[1.4rem] font-[500]">Phí vận chuyển:</p>
                    <p className="text-[1.6rem] font-[600]">35.000 đ</p>
                  </div>

                  <div className="flex justify-between items-center">
                    <p className="text-[1.4rem] font-[500]">Giảm giá:</p>
                    <p className="text-[1.6rem] font-[600]">
                      - {formatPrice(discountValue)}
                    </p>
                  </div>
                  <div className="flex justify-between items-center mt-[0.4rem]">
                    <p className="text-[1.8rem] font-[600]">Tổng thanh toán:</p>
                    <p className="text-[1.8rem] font-[600]">
                      {formatPrice(totalPrice + feeShip - discountValue)}
                    </p>
                  </div>
                  <ButtonComponent
                    type="primary"
                    text="Thanh toán"
                    className="mt-[1.2rem]"
                    textClassName="text-[1.6rem] font-[500] uppercase text-white"
                    disabled={!isInformation}
                    onClick={handleCheckout}
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      ) : (
        <div className="w-[140rem] mx-auto h-[67.6rem] flex flex-col justify-center items-center gap-[1.6rem] bg-white shadow-md">
          <p className="text-center text-[2rem]">
            Không có sản phẩm trong giỏ hàng
          </p>
          <p
            className="text-center text-[2.4rem] text-[#ff9900] font-[500] underline cursor-pointer"
            onClick={() => navigate(paths.HOME)}
          >
            Tiếp tục mua hàng!
          </p>
        </div>
      )}
    </div>
  );
};

export default Cart;
