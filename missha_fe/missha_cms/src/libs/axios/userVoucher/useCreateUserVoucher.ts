import urls from '@/utils/constants/urls';
import axiosClient from '..';
import { FormUserVoucherType } from '@/types/request/form/formUserVoucher';

const useCreateUserVoucher = async (body: FormUserVoucherType) => {
  const response = await axiosClient.post(urls.USER_VOUCHERS, {
    data: body,
  });
  return response;
};
export default useCreateUserVoucher;
