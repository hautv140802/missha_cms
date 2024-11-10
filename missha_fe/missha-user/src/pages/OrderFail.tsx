import { useState, useEffect } from "react";
import { useNavigate, useParams } from "react-router-dom";
import orderApis from "../apis/orderApis";
import { BaseData } from "../types/base/baseData";
import { OrderType } from "../types/response/order";
import { formatPrice } from "../utils/functions/formatPrice";
import ProductComponent from "../components/Product";
import { Spin } from "antd";
import ButtonComponent from "../components/Button";
import paths from "../utils/constants/paths";

export default function OrderFail() {
  const navigate = useNavigate();
  const { id } = useParams();

  const [isLoading, setIsLoading] = useState(true);
  const [dataOrder, setDataOrder] = useState<BaseData<OrderType>>();
  const [totalQuantity, setTotalQuantity] = useState(0);
  const [totalPrice, setTotalPrice] = useState(0);

  useEffect(() => {
    const fetchOrder = async (id: string) => {
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
          <h3 className="section__heading-status--order font-bold my-0 text-red-700">
            Đặt hàng không thành công
          </h3>
        </div>
      </section>

      <section className="section__order mx-4 my-8 md:mx-[120px]">
        <div className="section__order-products">
          {dataOrder?.attributes?.order_details?.data?.map((detail, index) => (
            <ProductComponent
              product={detail?.attributes?.product?.data}
              key={index}
              page="product"
            />
          ))}
        </div>
        <div className="section__order-information my-8 md:mx-0">
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
        <div className="section__order-continue-shopping flex justify-center items-center">
          <div className="w-[30rem]">
            <ButtonComponent
              type="primary"
              onClick={() => navigate(paths.CART)}
              text=" Đặt lại đơn hàng"
              className="w-fit"
              // className="text-[#ff9900] underline text-[14px] md:py-3 md:px-4 md:bg-piper-lolot md:text-white md:no-underline md:text-[16px] md:hover:opacity-70 md:duration-200"
            />
          </div>
        </div>
      </section>

      {/* <section className="section__history-watched mx-4 my-8 md:mx-[120px]">
        <HistoryComponent
          productsHistory={JSON.parse(
            localStorage.getItem("productWatched") || "[]"
          )}
        />
      </section> */}
    </div>
  );
}
