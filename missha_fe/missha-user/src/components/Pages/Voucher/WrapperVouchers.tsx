import { Spin } from "antd";
import { BaseData } from "../../../types/base/baseData";
import VoucherComponent from "../../Voucher";
import { UserVoucherType } from "../../../types/response/user";

interface IWrapperVouchersProps {
  dataVouchers: BaseData<UserVoucherType>[];
  isLoading?: boolean;
}
const WrapperVouchers = (props: IWrapperVouchersProps) => {
  const { dataVouchers, isLoading } = props;

  if (isLoading)
    return (
      <div className="flex justify-center items-center py-[10rem]">
        <Spin size="large" />
      </div>
    );

  if (!isLoading && dataVouchers.length === 0)
    return (
      <div className="bg-white p-[2.4rem] py-[10rem] flex justify-center items-center">
        <p className="text-center text-[2rem] py-[10rem] text-[#ff9900]">
          Không có voucher!
        </p>
      </div>
    );

  return (
    <div className="flex flex-col gap-[1.6rem] mt-[2.4rem]">
      {dataVouchers.map((voucher, index) => (
        <VoucherComponent key={index} page="profile" userVoucher={voucher} />
      ))}
    </div>
  );
};

export default WrapperVouchers;
