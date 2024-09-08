import { BaseData } from '../base/baseData';
import { BaseResponse } from '../base/baseResponse';
import { ImageType } from '../common/image';
import { ProductResponseType } from './product';

export type CategoryResponseType = {
  name: string;
  slug: string;
  createdAt: string;
  updatedAt: string;
  banner: {
    data: BaseData<ImageType>;
  };
  products: {
    data: BaseData<ProductResponseType>[];
  };
};
