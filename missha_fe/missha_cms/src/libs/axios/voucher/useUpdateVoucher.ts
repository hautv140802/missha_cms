import axiosClient from '..';
import axios from 'axios';
import urls from '@/utils/constants/urls';
import { VoucherRequestType } from '@/types/request/voucher';

const useUpdateVoucher = async (id: number, body: VoucherRequestType) => {
  try {
    const response = await axiosClient.put(`${urls.VOUCHERS}/${id}`, {
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
export default useUpdateVoucher;
