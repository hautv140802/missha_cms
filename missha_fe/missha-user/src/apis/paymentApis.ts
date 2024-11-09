import axiosClient from ".";
import { PaymentRequestType } from "../types/request/payment";
import urls from "../utils/constants/urls";

const paymentApis = {
  post: (payment: PaymentRequestType) => {
    return axiosClient.post(urls.PAYMENT_CRATE, payment);
  },
};

export default paymentApis;
