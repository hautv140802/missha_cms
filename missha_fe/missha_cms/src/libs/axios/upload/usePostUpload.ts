import { RcFile, UploadFile } from 'antd/es/upload';
import axios from 'axios';

import urls from '@/utils/constants/urls';

import axiosClient from '..';
import toast from 'react-hot-toast';

export const usePostUploadFile = async (originFileObj: RcFile) => {
  try {
    const formData = new FormData();

    formData.append('files', originFileObj);

    const response = await axiosClient.post(urls.UPLOAD_FILES, formData, {
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    });

    return response.data;
  } catch (error) {
    if (axios.isAxiosError(error)) {
      console.error('Error message:', error.message);
    } else {
      console.error('Unexpected error:', error);
    }
    return null;
  }
};
