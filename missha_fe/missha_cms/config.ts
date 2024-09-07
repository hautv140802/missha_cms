const environment = {
  api_host: '',
  api_endpoint: '',
  ghn_token: '',
};

const envi = import.meta.env;

if (envi.MODE === 'development') {
  environment.api_host = envi.VITE_BASE_URL_DEV;
  environment.api_endpoint = envi.VITE_END_POINT_DEV;
  environment.ghn_token = envi.VITE_GHN_TOKEN;
} else if (envi.MODE === 'production') {
  environment.api_host = envi.VITE_BASE_URL_PRO;
  environment.api_endpoint = envi.VITE_END_POINT_PRO;
  environment.ghn_token = envi.VITE_GHN_TOKEN;
}

export default { baseUrl: environment.api_host, environment };
