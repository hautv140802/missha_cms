import OrderList from "../../components/Pages/Profile/Orders/OrderList";
import WrapperStatus from "../../components/Pages/Profile/Orders/WrapperStatus";

const Orders = () => {
  return (
    <div className="w-ful bg-white">
      <div className="p-[2.4rem]">
        <p className="text-[1.6rem] font-[500] uppercase">Đơn hàng</p>
        <WrapperStatus />
      </div>
      <div className="w-full h-[1.6rem] bg-[#F7F7F7]"></div>
      <div className="flex flex-col gap-[1.2rem] bg-[#F7F7F7]">
        <OrderList />
        <OrderList />
        <OrderList />
      </div>
    </div>
  );
};

export default Orders;
