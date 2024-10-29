import { FormUserVoucherType } from '@/types/request/form/formUserVoucher';
import axiosClient from '..';
import urls from '@/utils/constants/urls';

const useUpdateUserVoucher = async (id: number, body: FormUserVoucherType) => {
  const response = await axiosClient.put(`${urls.USER_VOUCHERS}/${id}`, {
    data: body,
  });
  return response.data;
};
export default useUpdateUserVoucher;
