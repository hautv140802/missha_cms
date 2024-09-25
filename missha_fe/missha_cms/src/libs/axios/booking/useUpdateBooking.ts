import axiosClient from '..';
import axios from 'axios';
import urls from '@/utils/constants/urls';
import { FormBookingType } from '@/types/request/form/formBooking';

const useUpdateBooking = async (id: number, body: FormBookingType) => {
  try {
    const response = await axiosClient.put(`${urls.BOOKINGS}/${id}`, {
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
export default useUpdateBooking;
