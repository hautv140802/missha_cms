import clsx from 'clsx';
import { JSX } from 'react';

type Props = {
  children: string | JSX.Element | JSX.Element[];
  className?: string;
};

const CardWrapper = ({ children, className }: Props) => (
  <div
    className={clsx(
      'bg-white rounded-[0.8rem] p-[2.4rem] shadow-content w-full relative z-10',
      className
    )}
  >
    {children}
  </div>
);

export default CardWrapper;
