import { FormCategoryType } from '@/types/request/form/formCategoryType';
import urls from '@/utils/constants/urls';
import queryString from 'query-string';
import axiosClient from '..';
import axios from 'axios';

const useCreateCategory = async (body: FormCategoryType) => {
  try {
    const response = await axiosClient.post(urls.CATEGORIES, {
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
export default useCreateCategory;
