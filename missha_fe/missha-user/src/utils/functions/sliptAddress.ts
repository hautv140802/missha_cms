const sliptAddress = (address?: string) => {
  if (!address)
    return {
      address: undefined,
      ward: undefined,
      district: undefined,
      city: undefined,
    };

  const [ward, district, city, ...restOfAddress] = address
    .split(", ")
    .reverse();

  return {
    address: restOfAddress?.reverse()?.join(", "),
    ward,
    district,
    city,
  };
};

export default sliptAddress;
