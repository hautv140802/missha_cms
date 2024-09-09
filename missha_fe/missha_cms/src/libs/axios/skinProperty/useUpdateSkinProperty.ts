import axiosClient from '..';
import axios from 'axios';
import urls from '@/utils/constants/urls';
import { FormSkinPropertyType } from '@/types/request/form/formSkinProperty';

const useUpdateSkinProperty = async (
  id: number,
  body: FormSkinPropertyType
) => {
  try {
    const response = await axiosClient.put(`${urls.SKIN_PROPERTIES}/${id}`, {
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
export default useUpdateSkinProperty;
