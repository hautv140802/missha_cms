import axiosClient from '..';
import axios from 'axios';
import urls from '@/utils/constants/urls';
import { OrderRequestTye } from '@/types/request/order';

const useUpdateOrder = async (id: number, body: OrderRequestTye) => {
  try {
    const response = await axiosClient.put(`${urls.ORDERS}/${id}`, {
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
export default useUpdateOrder;
