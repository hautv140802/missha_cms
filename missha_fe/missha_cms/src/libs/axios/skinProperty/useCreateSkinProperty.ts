import urls from '@/utils/constants/urls';
import axiosClient from '..';
import axios from 'axios';
import { FormSkinPropertyType } from '@/types/request/form/formSkinProperty';

const useCreateSkinProperty = async (body: FormSkinPropertyType) => {
  try {
    const response = await axiosClient.post(urls.SKIN_PROPERTIES, {
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
export default useCreateSkinProperty;
