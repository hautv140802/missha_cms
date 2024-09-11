import axiosClient from '..';
import urls from '@/utils/constants/urls';
import axios from 'axios';

const useDeleteProduct = async (id: number) => {
  try {
    const response = await axiosClient.delete(`${urls.PRODUCTS}/${id}`);
    return response.data;
  } catch (error) {
    if (axios.isAxiosError(error)) {
      console.error('Error message:', error.message);
    } else {
      console.error('Unexpected error:', error);
    }
  }
};
export default useDeleteProduct;
