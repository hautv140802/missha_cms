import axiosClient from '..';
import urls from '@/utils/constants/urls';

const useDeleteUserVoucher = async (id: number) => {
  const response = await axiosClient.delete(`${urls.USER_VOUCHERS}/${id}`);
  return response.data;
};
export default useDeleteUserVoucher;
