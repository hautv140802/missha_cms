import axiosClient from '..';
import urls from '@/utils/constants/urls';
import { FormServiceType } from '@/types/request/form/formService';

const useUpdateService = async (id: number, body: FormServiceType) => {
  const response = await axiosClient.put(`${urls.SERVICES}/${id}`, {
    data: body,
  });
  return response.data;
};
export default useUpdateService;
