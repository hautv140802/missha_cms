import urls from '@/utils/constants/urls';
import axiosClient from '..';
import axios from 'axios';
import { VoucherRequestType } from '@/types/request/voucher';

const useCreateVoucher = async (body: VoucherRequestType) => {
  try {
    const response = await axiosClient.post(urls.VOUCHERS, {
      data: body,
    });
    return response.data;
  } catch (error) {
    if (axios.isAxiosError(error)) {
      console.error('Error message:', error.message);
    } else {
      console.error('Unexpected error:', error);
    }
  }
};
export default useCreateVoucher;
