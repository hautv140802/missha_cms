import { Pagination } from "antd";
import WrapperVouchers from "../../components/Pages/Voucher/WrapperVouchers";
import VoucherComponent from "../../components/Voucher";
import { useQueryUserVouchers } from "../../hooks/queries/userVouchers.query";
import variables from "../../utils/constants/variables";
import { getUserProfile } from "../../utils/functions/getUserInfo";
import { useState } from "react";

const Vouchers = () => {
  const user = getUserProfile() || {};
  const [currentPage, setCurrentPage] = useState<number>(1);
  const {
    data: dataUserVouchers,
    isLoading: isLoadingUserVouchers,
    pagination: paginationUserVouchers,
  } = useQueryUserVouchers({
    "filters[user]": user?.id,
    "filters[status]": variables.UNUSED,
    "sort[0]": "createdAt:desc",
    populate: "deep, 3",
    "pagination[pageSize]": 5,
    "pagination[page]": currentPage,
  });
  return (
    <>
      <div className="w-ful bg-white p-[2.4rem]">
        <p className="text-[1.6rem] font-[500] uppercase">Vouchers</p>
        <WrapperVouchers
          dataVouchers={dataUserVouchers}
          isLoading={isLoadingUserVouchers}
        />
      </div>
      <div className="flex justify-end items-center py-[1.2rem]">
        <Pagination
          current={paginationUserVouchers?.page || 1}
          pageSize={paginationUserVouchers?.pageSize || 5}
          total={paginationUserVouchers?.total || 0}
          onChange={(page) => setCurrentPage(page)}
        />
      </div>
    </>
  );
};

export default Vouchers;
