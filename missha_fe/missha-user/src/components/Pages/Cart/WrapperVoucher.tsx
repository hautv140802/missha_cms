import { Divider } from "antd";
import ScrollbarComponent from "../../Scrollbar";
import VoucherComponent from "../../Voucher";
import ButtonComponent from "../../Button";

const WrapperVoucher = () => {
  const vouchers = Array.from({ length: 4 });

  return (
    <div className="shadow-md p-[2.4rem]  bg-white">
      <p className="text-[2rem] font-[500] uppercase text-center">Vouchers</p>
      <Divider className="my-[0.8rem]" />
      <div className="flex flex-col gap-[1.2rem]">
        <ScrollbarComponent height="200px">
          <div className="flex flex-col gap-[1.2rem] w-[98%]">
            {Array.from({ length: 4 }).map((_, index) => (
              <VoucherComponent isActive={index === 1} page="cart" />
            ))}
          </div>
        </ScrollbarComponent>
        <div className="flex justify-between items-center gap-[1.2rem]">
          <ButtonComponent
            type="text"
            text="Không sử dụng"
            className="border border-solid border-gray-500"
            textClassName="text-[1.6rem] uppercase"
          />
          <ButtonComponent
            type="primary"
            text="Áp dụng"
            textClassName="text-[1.6rem] uppercase text-white"
          />
        </div>
      </div>
    </div>
  );
};

export default WrapperVoucher;
