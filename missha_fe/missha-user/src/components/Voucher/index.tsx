import clsx from "clsx";
import { UserVoucherType } from "../../types/response/user";
import { BaseData } from "../../types/base/baseData";
import { formatPrice } from "../../utils/functions/formatPrice";
import { VoucherType } from "../../types/response/voucher";
import toast from "react-hot-toast";

interface IVoucherComponentProps {
  isActive?: boolean;
  page: "cart" | "profile";
  userVoucher: BaseData<UserVoucherType>;
  setSelectedVoucher?: (_selectedVoucher?: BaseData<VoucherType>) => void;
}
const VoucherComponent = (props: IVoucherComponentProps) => {
  const { isActive, page, userVoucher, setSelectedVoucher } = props;

  const handleSelectedVoucher = () => {
    setSelectedVoucher?.(userVoucher?.attributes?.voucher.data);
    toast.success("Bạn đã chọn thành công 1 voucher");
  };
  if (page === "profile")
    return (
      <div className="flex justify-between items-center gap-[0.8rem] border border-solid  rounded-[1.6rem] pr-[1.2rem] bg-white overflow-hidden before:order-gray-400">
        <div className="w-[30%] h-[7.6rem] flex justify-center items-center bg-[#f7f7f7] border">
          <p className="text-[1.4rem] font-[500] text-[#FF9800]">
            {userVoucher?.attributes?.voucher?.data?.attributes?.code}
          </p>
        </div>
        <div className="w-[60%] flex flex-col items-end gap-[0.8rem] p-[1.2rem_0.4rem]">
          <p className="text-[1.4rem]">
            Giảm{" "}
            {formatPrice(
              Number(
                userVoucher?.attributes?.voucher?.data?.attributes
                  ?.amount_decrease
              )
            )}{" "}
            giá trị đơn hàng
          </p>
        </div>
      </div>
    );
  if (page === "cart")
    return (
      <div
        className={clsx(
          "flex items-center gap-[0.8rem] border border-solid  rounded-[1.6rem] pr-[1.2rem] bg-white overflow-hidden",
          isActive ? "border-black" : "border-gray-400"
        )}
        onClick={handleSelectedVoucher}
      >
        <div className="w-[30%] h-[7.6rem] flex justify-center items-center bg-[#FF9800]">
          <p className="text-[1.4rem] font-[500] text-white">
            {userVoucher?.attributes?.voucher?.data?.attributes?.code}
          </p>
        </div>
        <div className="w-[60%] flex flex-col gap-[0.8rem] p-[1.2rem_0.4rem]">
          <p className="text-[1.4rem]">
            Giảm{" "}
            {formatPrice(
              Number(
                userVoucher?.attributes?.voucher?.data?.attributes
                  ?.amount_decrease
              )
            )}{" "}
            giá trị đơn hàng
          </p>
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
