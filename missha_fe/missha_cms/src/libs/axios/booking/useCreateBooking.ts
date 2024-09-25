import urls from '@/utils/constants/urls';
import axiosClient from '..';
import axios from 'axios';
import { FormBookingType } from '@/types/request/form/formBooking';

const useCreateBooking = async (body: FormBookingType) => {
  try {
    const response = await axiosClient.post(urls.BOOKINGS, {
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
export default useCreateBooking;
