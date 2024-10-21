import VoucherComponent from "../../components/Voucher";

const Vouchers = () => {
  return (
    <div className="w-ful bg-white p-[2.4rem]">
      <p className="text-[1.6rem] font-[500] uppercase">Đơn hàng</p>
      <div className="flex flex-col gap-[1.6rem] mt-[2.4rem]">
        {Array.from({ length: 5 }).map((_, index) => (
          <VoucherComponent key={index} page="profile" />
        ))}
      </div>
    </div>
  );
};

export default Vouchers;
