import axiosClient from '..';
import axios from 'axios';
import urls from '@/utils/constants/urls';
import { FormUserRequestType } from '@/types/request/form/formCustomer';

const useUpdateCustomer = async (id: number, body: FormUserRequestType) => {
  try {
    const response = await axiosClient.put(`${urls.CUSTOMERS}/${id}`, body);
    return response.data;
  } catch (error) {
    if (axios.isAxiosError(error)) {
      console.error('Error message:', error.message);
    } else {
      console.error('Unexpected error:', error);
    }

    return error;
  }
};
export default useUpdateCustomer;
