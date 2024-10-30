import { Swiper, SwiperSlide } from "swiper/react";
import { useQueryVouchers } from "../../../hooks/queries/vouchers.query";
import { BaseData } from "../../../types/base/baseData";
import { VoucherType } from "../../../types/response/voucher";
import VoucherComponent from "../../Voucher";
import { Navigation } from "swiper/modules";
import { useQueryUserVouchers } from "../../../hooks/queries/userVouchers.query";
import { getUserProfile } from "../../../utils/functions/getUserInfo";
import { useEffect, useState } from "react";
import "swiper/swiper-bundle.css";
const WrapperVoucher = () => {
  const user = getUserProfile() || {};
  const [updateFlag, setUpdateFlag] = useState<string>();

  const {
    data: dataUserVouchers,
    isLoading: isLoadingUserVouchers,
    isFetched: isFetchedUserVouchers,
  } = useQueryUserVouchers(
    {
      "filters[user]": user?.id,
      "sort[0]": "createdAt:desc",
      populate: "deep, 3",
      "pagination[pageSize]": 200,
    },
    updateFlag
  );
  const [filterVouchers, setFilterVouchers] = useState<BaseData<VoucherType>[]>(
    []
  );
  const { data: dataVouchers, isLoading: isLoadingVouchers } = useQueryVouchers(
    {
      populate: "deep, 2",
      "filters[public]": true,
      "sort[0]": "createdAt:desc",
      "pagination[pageSize]": 200,
    }
  );

  useEffect(() => {
    let voucherIDbyUser: number[] = [];
    if (!isLoadingVouchers) {
      voucherIDbyUser = dataUserVouchers?.map(
        (userVoucher) => userVoucher?.attributes?.voucher?.data?.id
      );
    }

    if (!isLoadingUserVouchers) {
      setFilterVouchers(
        dataVouchers.filter((voucher) => !voucherIDbyUser.includes(voucher?.id))
      );
    }
  }, [isLoadingVouchers, isFetchedUserVouchers, isLoadingUserVouchers]);

  const handleGetVoucherSuccess = () => {
    setTimeout(() => {
      setUpdateFlag(new Date().toString());
    }, 500);
  };
  const chunkArray = (array: BaseData<VoucherType>[], size: number) => {
    const result = [];
    for (let i = 0; i < array.length; i += size) {
      result.push(array.slice(i, i + size));
    }
    return result;
  };

  const desktopChunks = chunkArray(filterVouchers, 3);

  return (
    <div className="w-[140rem] mx-auto bg-white p-[2.4rem] mb-[1.2rem]">
      <p className="text-[2rem]">Vouchers từ shop</p>
      {filterVouchers?.length ? (
        <div className="flex flex-wrap justify-start items-center gap-[1.2rem] mt-[2rem]">
          <Swiper
            observer={true}
            observeParents={true}
            onSwiper={(swiper) => swiper.update()}
            modules={[Navigation]}
            navigation
            className="mySwiper px-[4rem] flex justify-start items-center mx-0"
            spaceBetween={10}
          >
            {desktopChunks.map((chunk, chunkIndex) => (
              <SwiperSlide
                key={chunkIndex}
                className="w-full flex justify-start items-center gap-[1.6rem] flex-wrap"
              >
                {chunk.map((voucher, index) => (
                  <VoucherComponent
                    key={index}
                    page="home"
                    voucher={voucher}
                    handleGetVoucherSuccess={handleGetVoucherSuccess}
                  />
                ))}
              </SwiperSlide>
            ))}
          </Swiper>
        </div>
      ) : (
        <div>
          <p className="text-[1.6rem] font-[500] text-center text-[#ff9900]">
            Hiện nay chưa có chương trình voucher của shop!
          </p>
        </div>
      )}
    </div>
  );
};

export default WrapperVoucher;
