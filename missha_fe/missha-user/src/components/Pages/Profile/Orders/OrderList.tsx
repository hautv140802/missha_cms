import { Divider } from "antd";
import OrderItem from "./OrderItem";
import { useState } from "react";
import svgs from "../../../../assets/svgs";

const OrderList = () => {
  const [showAll, setShowAll] = useState<boolean>(false);
  return (
    <div className="bg-white p-[2.4rem]">
      <div className="flex justify-between items-center">
        <p className="text-[1.6rem]">
          Mã đơn hàng:{" "}
          <span className="text-[1.6rem] font-[500]">ABCXYAZ1</span>
        </p>
        <p className="text-[#26AA96] text-[1.6rem]">Đang giao hàng</p>
      </div>
      <Divider className="my-[1.2rem]" />
      <div className="bg-white flex flex-col gap-[1.2rem]">
        {Array.from({ length: showAll ? 3 : 1 }).map((_, index) => (
          <OrderItem key={index} />
        ))}
        <div
          className="flex justify-start items-center gap-[1.2rem] mt-[1.2rem] cursor-pointer"
          onClick={() => setShowAll(!showAll)}
        >
          <p className="text-[1.4rem] text-[rgba(0,0,0,0.54)]">
            {showAll ? "Thu gọn" : "Xem thêm"} 2 sản phẩm
          </p>
          <div className="w-[1.2rem] h-[1.2rem]">
            <img
              src={showAll ? svgs.chevonDobuleUp : svgs?.chevonDobuleDown}
              className="w-full h-full"
            />
          </div>
        </div>
      </div>
      <Divider className="my-[1.2rem]" />
      <div className="flex flex-col justify-start items-end gap-[1rem]">
        <p className="text-[rgba(0,0,0,0.54)] text-[1.6rem]">
          Tổng sản phẩm:{" "}
          <span className="text-[1.6rem] text-black font-[500]">9</span>
        </p>
        <p className="text-[rgba(0,0,0,0.54)] text-[2.4rem]">
          Thành tiền:{" "}
          <span className="text-[2.4rem] text-[#ff9900]">2.000.000 đ</span>
        </p>
      </div>
    </div>
  );
};

export default OrderList;
