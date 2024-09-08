import { ExclamationCircleFilled } from '@ant-design/icons';
import { Modal } from 'antd';
import { ReactNode } from 'react';
const { confirm } = Modal;
interface IDeleteConfirmComponentProps {
  content?: string;
  onOke: () => void;
  children: ReactNode;
  title: ReactNode;
}

const DeleteConfirmComponent = (props: IDeleteConfirmComponentProps) => {
  const { content, onOke, children, title } = props;
  const showConfirm = () => {
    confirm({
      title: title,
      icon: <ExclamationCircleFilled />,
      content: content,
      onOk: onOke,
      onCancel() {},
      okText: 'Xác nhận',
      cancelText: 'Hủy',
      centered: true,
      maskClosable: true,
    });
  };
  return <div onClick={showConfirm}>{children}</div>;
};

export default DeleteConfirmComponent;
