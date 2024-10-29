import urls from '@/utils/constants/urls';
import axiosClient from '..';
import axios from 'axios';
import { FormServiceType } from '@/types/request/form/formService';

const useCreateService = async (body: FormServiceType) => {
  const response = await axiosClient.post(urls.SERVICES, {
    data: body,
  });
  return response;
};
export default useCreateService;
