import urls from '@/utils/constants/urls';
import axiosClient from '..';
import axios from 'axios';
import { ProductRequestType } from '@/types/request/product';

const useCreateProduct = async (body: ProductRequestType) => {
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
