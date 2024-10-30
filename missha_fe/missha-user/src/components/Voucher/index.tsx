import clsx from "clsx";
import { BaseData } from "../../types/base/baseData";
import { formatPrice } from "../../utils/functions/formatPrice";
import { VoucherType } from "../../types/response/voucher";
import toast from "react-hot-toast";
import {
  getAccessToken,
  getUserProfile,
} from "../../utils/functions/getUserInfo";
import userApis from "../../apis/userApis";
import variables from "../../utils/constants/variables";
import axios from "axios";

interface IVoucherComponentProps {
  isActive?: boolean;
  page: "cart" | "profile" | "home";
  voucher: BaseData<VoucherType>;
  setSelectedVoucher?: (_selectedVoucher?: BaseData<VoucherType>) => void;
  handleGetVoucherSuccess?: () => void;
}
const VoucherComponent = (props: IVoucherComponentProps) => {
  const {
    isActive,
    page,
    voucher,
    setSelectedVoucher,
    handleGetVoucherSuccess,
  } = props;

  const handleSelectedVoucher = () => {
    setSelectedVoucher?.(voucher);
    toast.success("Bạn đã chọn thành công 1 voucher");
  };

  const handleGetVoucher = async () => {
    const isLogin = getAccessToken();
    const profile = getUserProfile() || {};

    if (isLogin && profile) {
      try {
        const resUserVoucher = await userApis.getCreateUserVoucher({
          voucher: voucher?.id,
          user: profile?.id,
          status: variables.UNUSED,
        });
        if (resUserVoucher?.data) {
          toast.success(`Lấy voucher ${voucher?.attributes?.code} thành công!`);
          handleGetVoucherSuccess?.();
        }
      } catch (error) {
        if (axios.isAxiosError(error)) {
          toast.error(
            `Lấy voucher thất bại: ${error?.response?.data?.error?.message}`
          );
        } else {
          toast.error(`Lấy voucher thất bại: ${error}`);
        }
      }
    } else {
      toast.error("Vui lòng đăng nhập, để lấy voucher");
    }
  };
  if (page === "profile")
    return (
      <div className="flex justify-between items-center gap-[0.8rem] border border-solid  rounded-[1.6rem] pr-[1.2rem] bg-white overflow-hidden before:order-gray-400">
        <div className="w-[30%] h-[7.6rem] flex justify-center items-center bg-[#f7f7f7] border-r px-[0.4rem]">
          <p className="text-[1.4rem] font-[500] text-[#FF9800]">
            {voucher?.attributes?.code}
          </p>
        </div>
        <div className="w-[60%] flex flex-col items-end gap-[0.8rem] p-[1.2rem_0.4rem]">
          <p className="text-[1.4rem]">
            Giảm {formatPrice(Number(voucher?.attributes?.amount_decrease))} giá
            trị đơn hàng
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
        <div className="w-[30%] h-[7.6rem] flex justify-center items-center bg-[#FF9800] px-[0.4rem]">
          <p className="text-[1.4rem] font-[500] text-white">
            {voucher?.attributes?.code}
          </p>
        </div>
        <div className="w-[60%] flex flex-col gap-[0.8rem] p-[1.2rem_0.4rem]">
          <p className="text-[1.4rem]">
            Giảm {formatPrice(Number(voucher?.attributes?.amount_decrease))} giá
            trị đơn hàng
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

  if (page === "home")
    return (
      <div className="min-w-[40rem] flex justify-between items-center gap-[0.8rem] border border-solid rounded-[1.6rem] pr-[1.2rem] bg-white overflow-hidden before:order-gray-400">
        <div className="w-[30%] h-[7.6rem] flex justify-center items-center bg-[#f7f7f7] border-r px-[0.4rem]">
          <p className="text-[1.4rem] font-[500] text-[#FF9800] break-all text-center line-clamp-3">
            {voucher?.attributes?.code}
          </p>
        </div>
        <div className="w-[60%] flex flex-col items-end gap-[0.8rem] p-[1.2rem_0.4rem]">
          <p className="text-[1.4rem]">
            Giảm {formatPrice(Number(voucher?.attributes?.amount_decrease))} giá
            trị đơn hàng
          </p>

          <span
            className="text-[1.4rem] text-[#ff9900] cursor-pointer underline underline-offset-2"
            onClick={handleGetVoucher}
          >
            Lấy mã
          </span>
        </div>
      </div>
    );
};

export default VoucherComponent;
