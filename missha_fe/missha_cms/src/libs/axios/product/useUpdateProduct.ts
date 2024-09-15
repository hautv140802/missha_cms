import axiosClient from '..';
import axios from 'axios';
import urls from '@/utils/constants/urls';
import { ProductRequestType } from '@/types/request/product';

const useUpdateProduct = async (id: number, body: ProductRequestType) => {
  try {
    const response = await axiosClient.put(`${urls.PRODUCTS}/${id}`, {
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
export default useUpdateProduct;
