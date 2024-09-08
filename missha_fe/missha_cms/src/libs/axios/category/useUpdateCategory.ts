import { FormCategoryType } from '@/types/request/form/formCategoryType';
import axiosClient from '..';
import axios from 'axios';
import urls from '@/utils/constants/urls';

const useUpdateCategory = async (id: number, body: FormCategoryType) => {
  try {
    const response = await axiosClient.put(`${urls.CATEGORIES}/${id}`, {
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
export default useUpdateCategory;
