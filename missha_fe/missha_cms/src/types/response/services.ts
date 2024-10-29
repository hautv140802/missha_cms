import { BaseData } from '../base/baseData';
import { ImageType } from '../common/image';

export type ServiceType = {
  title: string;
  banner: { data: BaseData<ImageType> };
  short_description: string;
  price: number;
  slug: string;
};
