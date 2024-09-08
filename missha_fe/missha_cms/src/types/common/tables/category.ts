import { BaseData } from '@/types/base/baseData';
import { BaseResponse } from '@/types/base/baseResponse';
import { ImageType } from '../image';
import { ProductResponseType } from '@/types/response/product';

export type CategoryTableType = {
  key: number;
  id: number;
  name: string;
  slug: string;
  createdAt: string;
  updatedAt: string;
  banner: {
    data: BaseResponse<BaseData<ImageType>>;
  };
  products: {
    data: BaseResponse<BaseData<ProductResponseType>[]>;
  };
};
