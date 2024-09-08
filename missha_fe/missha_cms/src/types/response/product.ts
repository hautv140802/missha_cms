import { BaseData } from '../base/baseData';
import { BaseResponse } from '../base/baseResponse';
import { ImageType } from '../common/image';

type FilterProductType = {
  name: string;
  slug: string;
};

type TimeInfoType = {
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
};

export type ProductLineResponseType = FilterProductType & TimeInfoType;

export type SkinPropertiesResponseType = FilterProductType & TimeInfoType;

export type ProductResponseType = {
  name: string;
  slug: string;
  price: number;
  sale_price: number;
  total_purchase: number;
  description: string;
  gallery: {
    data: BaseResponse<BaseData<ImageType>[]>;
  };
  avatar: {
    data: BaseResponse<BaseData<ImageType>>;
  };
  product_line: {
    data: BaseResponse<BaseData<ProductLineResponseType>>;
  };
  skin_properties: {
    data: BaseResponse<BaseData<SkinPropertiesResponseType>>;
  };
  createdAt: string;
  updatedAt: string;
};
