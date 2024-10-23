export const formatPrice = (price: number, currency: string = "₫"): string => {
  if (currency === "₫") {
    return new Intl.NumberFormat("vi-VN").format(price).trim() + " " + currency;
  } else {
    return `${currency}${price.toLocaleString("en-US")}`;
  }
};
