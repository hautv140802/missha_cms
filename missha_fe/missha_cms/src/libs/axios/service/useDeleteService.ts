import axiosClient from '..';
import urls from '@/utils/constants/urls';

const useDeleteService = async (id: number) => {
  const response = await axiosClient.delete(`${urls.SERVICES}/${id}`);
  return response.data;
};
export default useDeleteService;
