import { BaseData } from '../base/baseData';
import { ImageType } from '../common/image';

export type VoucherResponseType = {
  code: string;
  amount_decrease: number;
  title: string;
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
  image: {
    data: BaseData<ImageType>;
  };
  public: boolean;
};
