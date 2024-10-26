import { useEffect, useState } from "react";
import { useQueryMyProfile } from "../../../hooks/queries/myProfile.query";
import { getAccessToken } from "../../../utils/functions/getUserInfo";
import { useLocation, useNavigate } from "react-router-dom";
import paths from "../../../utils/constants/paths";
import variables from "../../../utils/constants/variables";
import FormModalInformation from "../../forms/FormModalInformation";
import { ReceivedInformationType } from "../../../types/common/receivedInformation";
import ModalInformation from "../../ModalInformation";

interface IReceivedInformationProps {
  setInformation: (_info: ReceivedInformationType) => void;
  information?: ReceivedInformationType;
  isInformation: boolean;
}
const ReceivedInformation = (props: IReceivedInformationProps) => {
  const { setInformation, isInformation, information } = props;
  const navigate = useNavigate();
  const location = useLocation();
  const { data: dataMyProfile, isLoading: isLoadingMyProfile } =
    useQueryMyProfile();

  const access_token = getAccessToken();

  const [openFormInformation, setOpenFormInformation] = useState(false);

  const handleCancelFormInfo = () => {
    setOpenFormInformation(false);
  };

  useEffect(() => {
    if (dataMyProfile) {
      setInformation({
        full_name: dataMyProfile?.full_name,
        phone: dataMyProfile?.phone,
        email: dataMyProfile?.email,
        address: dataMyProfile?.address,
      });
    }
  }, [isLoadingMyProfile]);

  if (!access_token)
    return (
      <div className="w-[140rem] mx-auto p-[2.4rem] bg-white mb-[1.6rem] shadow-md">
        <p className="text-[2rem] font-[500] uppercase">Thông tin nhận hàng</p>
        <div className="w-full">
          <p className="text-center text-[1.6rem] font-[500] text-[#ff9900]">
            Vui lòng đăng nhập!{" "}
            <span
              className="underline cursor-pointer"
              onClick={() =>
                navigate(
                  `${paths.LOGIN}?${variables.REDIRECT_URL}=${location.pathname}`
                )
              }
            >
              Tại đây
            </span>
          </p>
        </div>
      </div>
    );
  if (!isInformation)
    return (
      <FormModalInformation
        receivedInformation={information}
        setReceivedInformation={setInformation}
      />
    );
  return (
    <div className="w-[140rem] mx-auto p-[2.4rem] bg-white mb-[1.6rem] shadow-md">
      <p className="text-[2rem] font-[500] uppercase">Thông tin nhận hàng</p>
      <div className="flex justify-between items-end ">
        <div className="flex flex-col justify-start items-start gap-[0.6rem] mt-[1.6rem]">
          <div className="flex gap-[1.2rem] *:text-[1.6rem] *:font-[500]">
            <p>{information?.full_name}</p>
            <p>{information?.phone}</p>
          </div>
          <div className="*:text-[1.6rem] *:font-[500]">
            <p>{information?.address}</p>
          </div>
        </div>

        <div>
          <p
            className="text-[1.4rem] font-[500] text-[#ff9900] underline cursor-pointer"
            onClick={() => setOpenFormInformation(true)}
          >
            Thay đổi thông tin
          </p>
        </div>
      </div>
      {openFormInformation && (
        <ModalInformation
          openModal={openFormInformation}
          handleCancelModal={handleCancelFormInfo}
          setReceivedInformation={setInformation}
          receivedInformation={information}
        />
      )}
    </div>
  );
};

export default ReceivedInformation;
