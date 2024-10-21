import { AddressType } from "../types/response/address";

const addressApis = {
  async getAddress() {
    const response = await fetch(
      "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json"
    );
    if (!response.ok) {
      console.log("Failed to fetch address data");
    }
    const data: AddressType = await response.json();
    return data;
  },
};

export default addressApis;
