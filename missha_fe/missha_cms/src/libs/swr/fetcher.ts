import axiosClient from '../axios';

export const fetcher = (url: string) =>
  axiosClient.get(url).then(res => res.data);
