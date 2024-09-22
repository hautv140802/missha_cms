import { formatPrice } from '@/utils/functions/formatPrice';
import clsx from 'clsx';

interface IVoucherBadgeProps {
  code?: string;
  amountDecrease?: number;
  className?: string;
}

const VoucherBadge = (props: IVoucherBadgeProps) => {
  const { code, amountDecrease, className } = props;

  if (!code) return '-';
  return (
    <div
      className={clsx(
        'flex justify-start items-center gap-[0.4rem]',
        className
      )}
    >
      <span className="font-[500]">{code}</span> -{' '}
      <span>{formatPrice(amountDecrease || 0)}</span>
    </div>
  );
};

export default VoucherBadge;
