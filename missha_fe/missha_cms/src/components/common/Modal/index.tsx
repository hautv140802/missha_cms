import { Modal, ModalProps } from 'antd';

const ModalComponent = (props: ModalProps) => {
  const { ...rest } = props;
  return (
    <Modal
      footer={null}
      closeIcon={null}
      classNames={{
        content: 'rounded-[1.8rem]  p-[2.4rem]',
        header: 'mb-[16px] *:text-[1.8rem]',
      }}
      centered
      maskClosable
      {...rest}
    />
  );
};

export default ModalComponent;
