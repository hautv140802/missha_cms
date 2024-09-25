import clsx from 'clsx';

interface IOrderStatusComponentProps {
  status: string;
  className?: string;
}
const OrderStatusComponent = (props: IOrderStatusComponentProps) => {
  const { status, className } = props;
  const variantStatus: Record<string, string> = {
    'Hoàn thành': 'bg-[#E6F5F2] text-[#484848]',
    'Đang vận chuyển': 'bg-[#E6F5F2] text-[#484848]',
    'Xác nhận': 'bg-[#E6F5F2] text-[#484848]',
    'Chờ xác nhận': 'bg-[#03997B] text-[#EFF8F0]',
  };

  const currentStatus = variantStatus[status];
  return (
    <div className={clsx('w-full flex justify-end items-center', className)}>
      <div
        className={clsx(
          'w-fit flex justify-end items-center h-[2.8rem] text-[1.4rem] py-[0.4rem] px-[1.6rem] rounded-[1.6rem]',
          currentStatus
        )}
      >
        {status}
      </div>
    </div>
  );
};

export default OrderStatusComponent;
