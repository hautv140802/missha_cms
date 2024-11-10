import { useEffect, useState } from "react";
import orderApis from "../apis/orderApis";
import { BaseData } from "../types/base/baseData";
import { OrderType } from "../types/response/order";
import { Link, useNavigate, useParams } from "react-router-dom";
import { Spin } from "antd";
import paths from "../utils/constants/paths";
import ProductComponent from "../components/Product";
import { formatPrice } from "../utils/functions/formatPrice";
import useCartStore from "../stores/useCartStore";

export default function OrderSuccess() {
  const { id } = useParams();
  const { clearCart } = useCartStore();
  const [isLoading, setIsLoading] = useState(true);
  const [dataOrder, setDataOrder] = useState<BaseData<OrderType>>();
  const [totalQuantity, setTotalQuantity] = useState(0);

  useEffect(() => {
    const fetchOrder = async (id: string) => {
      clearCart();
      try {
        const resOrder = await orderApis.get(id);

        const data = resOrder?.data?.data;

        setDataOrder(resOrder?.data?.data);

        const totalQuantity = data?.attributes?.order_details?.data?.reduce(
          (sum, item) => sum + (item?.attributes?.quantity || 0),
          0
        );
        setTotalQuantity(totalQuantity);
      } catch (error) {
        console.log(error);
      }
      setIsLoading(false);
    };
    if (id) {
      fetchOrder(id);
    }
  }, [id]);
  if (isLoading)
    return (
      <div>
        <Spin size="large" />
      </div>
    );

  return (
    <div className="md:container md:max-w-[140rem] md:mx-auto mt-[6.8rem] h-[calc(100vh-20rem)]">
      <section className="section__heading mx-4 my-8 md:mx-[120px]">
        <div className="section__heading-title text-[12px] text-[#484848] text-center md:text-[16px] font-normal md:text-left">
          <p className="section__heading-status--order my-0 text-[#484848] md:text-[#ff9900] font-bold md:font-light">
            Đặt hàng thành công.
          </p>
          <p>
            Đơn hàng đang chờ xử lý, theo dõi chi tiết{" "}
            <Link
              to={paths.PROFILE_ORDERS}
              className=" underline text-[#ff9900]"
            >
              tại đây
            </Link>{" "}
            bạn nhé!
          </p>
          <div className="section__order-continue-shopping text-center w-full md:block hidden mt-5">
            <Link
              to={paths.HOME}
              className="text-[#ff9900] underline text-[14px]"
            >
              Tiếp tục mua sắm
            </Link>
          </div>
        </div>
      </section>

      <section className="section__order mx-4 my-8 md:mx-[120px]">
        <div className="section__order-products md:block hidden">
          {dataOrder?.attributes?.order_details?.data?.map((detail, index) => (
            <ProductComponent
              product={detail?.attributes?.product?.data}
              key={index}
              page="product"
            />
          ))}
        </div>
        <div className="section__order-information my-8 md:mx-0 md:block hidden">
          <div className="section__order-information-quantity md:text-[14px]">
            Số lượng:{" "}
            <span className="font-bold">{totalQuantity} sản phẩm</span>
          </div>
          <div className="section__order-information-price md:text-[14px]">
            Tổng cộng:{" "}
            <span className="font-bold text-[16px] md:text-[20px]">
              {formatPrice(Number(dataOrder?.attributes?.total))}
            </span>
          </div>
        </div>
        <div className="section__order-continue-shopping text-center w-full md:hidden">
          <Link
            to={paths.HOME}
            className="text-[#ff9900] underline text-[14px]"
          >
            Tiếp tục mua sắm
          </Link>
        </div>
      </section>
    </div>
  );
}
