import urls from '@/utils/constants/urls';
import axiosClient from '..';
import axios from 'axios';
import { FormProductLine } from '@/types/request/form/formProductLine';

const useCreateProductLine = async (body: FormProductLine) => {
  try {
    const response = await axiosClient.post(urls.PRODUCT_LINES, {
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
export default useCreateProductLine;
