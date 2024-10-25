import { BaseData } from "../base/baseData";
import { MediaType } from "../common/media";

export type VoucherType = {
  code: string;
  amount_decrease: string;
  title: string;
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
  image: {
    data: BaseData<MediaType>;
  };
};
