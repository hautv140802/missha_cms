import urls from '@/utils/constants/urls';
import axiosClient from '..';
import axios from 'axios';
import { FormOrderType } from '@/types/request/form/formOrder';

const useCreateOrder = async (body: FormOrderType) => {
  try {
    const response = await axiosClient.post(urls.ORDERS, {
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
export default useCreateOrder;
