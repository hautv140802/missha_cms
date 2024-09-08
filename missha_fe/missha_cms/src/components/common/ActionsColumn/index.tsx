import { DeleteOutlined, EditOutlined, EyeOutlined } from '@ant-design/icons';
import { Button, ButtonProps, Space } from 'antd';
import DeleteConfirmComponent from '../ComfirmDelete';
interface IActionsColumnProp {
  containerClassName?: string;
  onHandleView?: () => void;
  onHandleUpdate?: () => void;
  onHandleDelete?: () => void;
}
const ActionsColumn = (props: IActionsColumnProp) => {
  const { containerClassName, onHandleView, onHandleUpdate, onHandleDelete } =
    props;
  const actionItems = [
    {
      icon: <EyeOutlined />,
      onClick: onHandleView,
    },
    {
      icon: <EditOutlined />,
      onClick: onHandleUpdate,
    },
    {
      icon: (
        <DeleteConfirmComponent
          title={'Bạn có muốn xóa thông tin này không?'}
          onOke={() => onHandleDelete?.()}
        >
          <DeleteOutlined />
        </DeleteConfirmComponent>
      ),

      danger: true,
    },
  ];
  return (
    <Space size="middle" className={containerClassName}>
      {actionItems.map((item: ButtonProps, index: number) => (
        <Button key={index} {...item} />
      ))}
    </Space>
  );
};

export default ActionsColumn;
