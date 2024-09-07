import clsx from 'clsx';
import { JSX } from 'react';

type Props = {
  children: string | JSX.Element | JSX.Element[];
  className?: string;
};

const ContentWrapper = ({ children, className }: Props) => (
  <div
    className={clsx(
      'bg-white rounded-[0.8rem] m-[0.8rem] p-[2.4rem] shadow-content relative z-10',
      className
    )}
  >
    {children}
  </div>
);

export default ContentWrapper;
