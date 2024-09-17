const formatNumberPhone = (numberPhone?: string) => {
  if (!numberPhone) return '-';

  return `${numberPhone.slice(0, 4)} ${numberPhone.slice(
    4,
    7
  )} ${numberPhone.slice(7)}`;
};

export default formatNumberPhone;
