import urls from '@/utils/constants/urls';
import axiosClient from '..';
import axios from 'axios';
import { FormUserRequestType } from '@/types/request/form/formCustomer';

const useCreateCustomer = async (body: FormUserRequestType) => {
  try {
    const response = await axiosClient.post(urls.CUSTOMERS, body);
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
export default useCreateCustomer;
