import { BaseData } from "../base/baseData";
import { MediaType } from "../common/media";

export type ServiceType = {
  title: string;
  banner: {
    data: BaseData<MediaType>;
  };
  short_description: string;
  price: number;
  slug: string;
  createdAt: string;
  updatedAt: string;
};
