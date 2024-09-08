import { BASE_URL } from '@/utils/constants/base';
import { Avatar, AvatarProps } from 'antd';

interface IAvatarProps extends AvatarProps {}

const AvatarComponent = (props: IAvatarProps) => {
  const { ...rest } = props;

  if (!props.src) return <p className="w-full text-center">-</p>;

  return (
    <Avatar
      {...rest}
      src={`${BASE_URL}${props.src}`}
      className="object-cover"
    />
  );
};

export default AvatarComponent;
