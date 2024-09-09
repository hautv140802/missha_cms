import axiosClient from '..';
import axios from 'axios';
import urls from '@/utils/constants/urls';
import { FormProductLine } from '@/types/request/form/formProductLine';

const useUpdateProductLine = async (id: number, body: FormProductLine) => {
  try {
    const response = await axiosClient.put(`${urls.PRODUCT_LINES}/${id}`, {
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
export default useUpdateProductLine;
