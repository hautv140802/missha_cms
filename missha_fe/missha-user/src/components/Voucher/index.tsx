import clsx from "clsx";

interface IVoucherComponentProps {
  isActive?: boolean;
}
const VoucherComponent = (props: IVoucherComponentProps) => {
  const { isActive } = props;
  return (
    <div
      className={clsx(
        "flex items-center gap-[0.8rem] border border-solid  rounded-[1.6rem] pr-[1.2rem] bg-white overflow-hidden",
        isActive ? "border-black" : "border-gray-400"
      )}
    >
      <div className="w-[30%] h-[7.6rem] flex justify-center items-center bg-[#FF9800]">
        <p className="text-[1.4rem] font-[500] text-white">VOUCHERABC</p>
      </div>
      <div className="w-[60%] flex flex-col gap-[0.8rem] p-[1.2rem_0.4rem]">
        <p className="text-[1.4rem]">Giảm 20% giá trị đơn hàng</p>
        <p className="text-[1.4rem] italic">HSD: 10/10/2024</p>
      </div>

      <div
        className={clsx(
          "w-[2rem] h-[2rem] rounded-full shadow-activeColor bg-gray-400",
          isActive ? "shadow-activeColor" : "shadow-notActiveColor"
        )}
      ></div>
    </div>
  );
};

export default VoucherComponent;
