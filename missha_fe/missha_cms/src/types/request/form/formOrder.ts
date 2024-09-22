export type FormOrderType = {
  customer_email?: string;
  customer_full_name?: string;
  customer_phone?: string;
  shipping_address?: string;
  shipping_method?: string;
  payment_method: string;
  total?: number;
  status?: string;
  transport_fee?: number;
  order_code?: string;
  publishedAt: string;
  voucher?: string;
};
