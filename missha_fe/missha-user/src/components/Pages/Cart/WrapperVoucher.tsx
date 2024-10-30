import { Divider } from "antd";
import ScrollbarComponent from "../../Scrollbar";
import VoucherComponent from "../../Voucher";
import ButtonComponent from "../../Button";
import { useQueryUserVouchers } from "../../../hooks/queries/userVouchers.query";
import { getUserProfile } from "../../../utils/functions/getUserInfo";
import variables from "../../../utils/constants/variables";
import { BaseData } from "../../../types/base/baseData";
import { VoucherType } from "../../../types/response/voucher";
import clsx from "clsx";

interface IWrapperVoucher {
  selectedVoucher?: BaseData<VoucherType>;
  setSelectedVoucher: (_selectedVoucher?: BaseData<VoucherType>) => void;
}
const WrapperVoucher = (props: IWrapperVoucher) => {
  const { selectedVoucher, setSelectedVoucher } = props;
  const user = getUserProfile() || {};

  const { data: dataUserVouchers, isLoading: isLoadingVouchers } =
    useQueryUserVouchers({
      populate: "deep, 3",
      "filters[user]": user?.id,
      "filters[status]": variables.UNUSED,
    });

  const handleNotApply = () => {
    setSelectedVoucher();
  };

  if (!isLoadingVouchers && dataUserVouchers.length === 0)
    return (
      <div className="shadow-md p-[2.4rem] bg-white">
        <p className="text-[2rem] font-[500] uppercase text-center">Vouchers</p>
        <Divider className="my-[0.8rem]" />
        <p className="text-[1.4rem] text-center">Không có vouchers!</p>
      </div>
    );
  return (
    <div className="shadow-md p-[2.4rem] bg-white">
      <p className="text-[2rem] font-[500] uppercase text-center">Vouchers</p>
      <Divider className="my-[0.8rem]" />
      <div className="flex flex-col gap-[1.2rem]">
        <ScrollbarComponent height="200px">
          <div className="flex flex-col gap-[1.2rem] w-[98%]">
            {dataUserVouchers?.map((item, index) => (
              <VoucherComponent
                key={index}
                isActive={
                  item?.attributes?.voucher?.data?.id === selectedVoucher?.id
                }
                page="cart"
                voucher={item?.attributes?.voucher?.data}
                setSelectedVoucher={setSelectedVoucher}
              />
            ))}
          </div>
        </ScrollbarComponent>
        <div className="flex justify-between items-center gap-[1.2rem]">
          <ButtonComponent
            type="text"
            text="Không sử dụng"
            className="border border-solid border-gray-500"
            textClassName="text-[1.6rem] uppercase"
            onClick={handleNotApply}
            disabled={!selectedVoucher?.id}
          />
          <ButtonComponent
            type={"primary"}
            text="Áp dụng"
            textClassName="text-[1.6rem] uppercase"
            disabled={!selectedVoucher?.id}
          />
        </div>
      </div>
    </div>
  );
};

export default WrapperVoucher;
