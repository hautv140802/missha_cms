import { useState } from "react";

import { ReceivedInformationType } from "../../types/common/receivedInformation";
import ModalInformation from "../ModalInformation";

interface IFormModalInformationProps {
  receivedInformation?: ReceivedInformationType;
  setReceivedInformation: (_information: ReceivedInformationType) => void;
}
const FormModalInformation = (props: IFormModalInformationProps) => {
  const { receivedInformation, setReceivedInformation } = props;
  const [openFormUpdateInformation, setOpenFormUpdateInformation] =
    useState(false);

  const handleCancelFormInfo = () => {
    setOpenFormUpdateInformation(false);
  };

  return (
    <div className="w-[140rem] mx-auto p-[2.4rem] bg-white mb-[1.6rem] shadow-md">
      <p className="text-[2rem] font-[500] uppercase">Thông tin nhận hàng</p>
      <div className="w-full">
        <p className="text-center text-[1.6rem] font-[500] text-[#ff9900]">
          Vui lòng thêm thông tin nhận hàng!{" "}
          <span
            className=" underline cursor-pointer"
            onClick={() => setOpenFormUpdateInformation(true)}
          >
            Tại Đây
          </span>
        </p>
      </div>

      {openFormUpdateInformation && (
        <ModalInformation
          openModal={openFormUpdateInformation}
          handleCancelModal={handleCancelFormInfo}
          setReceivedInformation={setReceivedInformation}
          receivedInformation={receivedInformation}
        />
      )}
    </div>
  );
};

export default FormModalInformation;
