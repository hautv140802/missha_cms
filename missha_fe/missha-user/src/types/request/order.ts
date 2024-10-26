export type OrderTypeRequest = {
  customer_email: string;
  customer_full_name: string;
  customer_phone: string;
  shipping_address: string;
  shipping_method: string;
  payment_method: string;
  total: string;
  status: string;
  user: number;
  voucher?: number;
  transport_fee: string;
  reason: string;
  order_details: number[];
};
