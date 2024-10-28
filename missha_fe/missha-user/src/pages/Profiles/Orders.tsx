import { useSearchParams } from "react-router-dom";
import WrapperStatus from "../../components/Pages/Profile/WrapperStatus";
import { useQueryOrders } from "../../hooks/queries/orders.query";
import orderStatus from "../../utils/constants/orderStatus";
import paths from "../../utils/constants/paths";
import { useEffect, useState } from "react";
import WrapperListOrder from "../../components/Pages/Profile/Orders/WrapperListOrder";

const Orders = () => {
  const [searchParams] = useSearchParams();
  const status = searchParams.get("status") || undefined;
  const [currentPage, setCurrentPage] = useState<number>(1);

  useEffect(() => {
    setCurrentPage(1);
  }, [status]);

  const {
    data: dataOrders,
    pagination: paginationOrders,
    isLoading: isLoadingOrders,
  } = useQueryOrders({
    populate: "deep, 4",
    "sort[0]": "updatedAt:desc",
    "filters[status]":
      status === "ALL" || status === undefined
        ? undefined
        : orderStatus[status],
    "pagination[pageSize]": 5,
    "pagination[page]": currentPage,
  });
  return (
    <div className="w-ful bg-white">
      <div className="p-[2.4rem]">
        <p className="text-[1.6rem] font-[500] uppercase">Đơn hàng</p>
        <WrapperStatus status={orderStatus} path={paths.PROFILE_ORDERS} />
      </div>
      <div className="w-full h-[1.6rem] bg-[#F7F7F7]"></div>
      <WrapperListOrder
        dataOrders={dataOrders}
        paginationOrders={paginationOrders}
        isLoading={isLoadingOrders}
        setCurrentPage={setCurrentPage}
      />
    </div>
  );
};

export default Orders;
