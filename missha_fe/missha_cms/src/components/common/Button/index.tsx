import { Button, ButtonProps } from 'antd';
import clsx from 'clsx';

interface IButtonComponentProps extends ButtonProps {
  text: string;
  textClassName?: string;
  textColorClassName?: string;
  href?: string;
}
const ButtonComponent = (props: IButtonComponentProps) => {
  const { text, textClassName, textColorClassName, href, ...rest } = props;

  if (href) {
    return (
      <a
        href={href}
        target="_blank"
        rel="noopener noreferrer"
        className={clsx(
          'h-auto',
          textClassName,
          textColorClassName || 'text-inherit',
          rest.className
        )}
      >
        {text}
      </a>
    );
  }
  return (
    <Button
      type={rest.type ?? 'default'}
      {...rest}
      className={clsx('h-[3.2rem] w-fit rounded-[1.6rem]', rest.className)}
    >
      <p
        className={clsx(
          'h-auto',
          textClassName,
          textColorClassName || 'text-inherit'
        )}
      >
        {text}
      </p>
    </Button>
  );
};

export default ButtonComponent;
