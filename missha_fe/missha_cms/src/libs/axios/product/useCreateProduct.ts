import urls from '@/utils/constants/urls';
import axiosClient from '..';
import axios from 'axios';
import { FormProductType } from '@/types/request/form/formProduct';

const useCreateProduct = async (body: FormProductType) => {
  try {
    const response = await axiosClient.post(urls.PRODUCTS, {
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
export default useCreateProduct;
