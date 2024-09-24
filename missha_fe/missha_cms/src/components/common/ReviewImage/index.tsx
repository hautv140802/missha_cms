import { UploadLocalType } from '@/types/common/UploadLocalType';
import { DeleteOutlined } from '@ant-design/icons';
import { Image } from 'antd';

interface IReviewImageProps {
  listImage?: UploadLocalType[] | UploadLocalType | null;
  onDelete?: (id?: number | string) => void;
  disabled?: boolean;
}
const ReviewImage = (props: IReviewImageProps) => {
  const { listImage, onDelete, disabled } = props;
  const imagesArray = Array.isArray(listImage)
    ? listImage
    : listImage
    ? [listImage]
    : [];
  if (!imagesArray.length) return <p className="italic">Chưa có ảnh</p>;

  return (
    <div className="grid grid-cols-3 gap-[1.2rem]">
      {(imagesArray || []).map(item => (
        <div
          key={item.id}
          className="relative border flex justify-center items-center"
        >
          <Image
            src={item.url}
            className="object-cover max-w-[15rem]"
            loading="lazy"
          />
          {!disabled && (
            <div
              className="absolute top-[2%] right-[2%] flex justify-center items-center cursor-pointer w-[3rem] h-[3rem] bg-[#FFFFFF] rounded-full"
              onClick={() => onDelete?.(item.id)}
            >
              <DeleteOutlined />
            </div>
          )}
        </div>
      ))}
    </div>
  );
};

export default ReviewImage;
