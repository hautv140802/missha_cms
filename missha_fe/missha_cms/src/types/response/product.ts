import { BaseData } from '../base/baseData';
import { BaseResponse } from '../base/baseResponse';
import { ImageType } from '../common/image';
import { CategoryResponseType } from './category';

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
    data: BaseData<ImageType>[];
  };
  avatar: {
    data: BaseData<ImageType>;
  };
  product_line: {
    data: BaseData<ProductLineResponseType>;
  };
  skin_properties: {
    data: BaseData<SkinPropertiesResponseType>;
  };
  categories: {
    data: BaseData<CategoryResponseType>[];
  };
  createdAt: string;
  updatedAt: string;
};
