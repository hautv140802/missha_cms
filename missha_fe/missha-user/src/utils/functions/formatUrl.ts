import { BASE_URL } from "../constants/base";

const formatUrl = (url?: string) => {
  if (!url) return;
  return `${BASE_URL}${url}`;
};

export default formatUrl;
