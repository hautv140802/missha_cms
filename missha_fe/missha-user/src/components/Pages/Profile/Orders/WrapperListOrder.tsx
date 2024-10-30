import { Pagination, Spin } from "antd";
import { BaseData } from "../../../../types/base/baseData";
import { OrderType } from "../../../../types/response/order";
import OrderList from "./OrderList";
import { PaginationResponseType } from "../../../../types/common/pagination";

interface IWrapperListOrderProps {
  dataOrders: BaseData<OrderType>[];
  isLoading?: boolean;
  paginationOrders: PaginationResponseType | null;
  setCurrentPage: (_page: number) => void;
}
const WrapperListOrder = (props: IWrapperListOrderProps) => {
  const { dataOrders, isLoading, paginationOrders, setCurrentPage } = props;

  if (isLoading)
    return (
      <div className="bg-white p-[2.4rem] flex justify-center items-center py-[10rem]">
        <Spin size="large" />
      </div>
    );

  if (!isLoading && dataOrders.length === 0)
    return (
      <div className="bg-white p-[2.4rem] py-[10rem] flex justify-center items-center">
        <p className="text-center text-[2rem] py-[10rem] text-[#ff9900]">
          Chưa có đơn hàng!
        </p>
      </div>
    );

  return (
    <div className="flex flex-col gap-[1.2rem] bg-background">
      {dataOrders.map((order, index) => (
        <OrderList key={index} order={order} showHeader />
      ))}
      <div className="flex justify-end items-center py-[1.2rem]">
        <Pagination
          total={paginationOrders?.total || 0}
          current={paginationOrders?.page || 0}
          pageSize={paginationOrders?.pageSize || 5}
          onChange={(page) => setCurrentPage(page)}
        />
      </div>
    </div>
  );
};

export default WrapperListOrder;
