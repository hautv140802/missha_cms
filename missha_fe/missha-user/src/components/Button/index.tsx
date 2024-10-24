import { Button, ButtonProps } from "antd";
import clsx from "clsx";

interface IButtonComponentProps extends ButtonProps {
  className?: string;
  textClassName?: string;
  text: string;
}
const ButtonComponent = (props: IButtonComponentProps) => {
  const { className, textClassName, text, ...rest } = props;
  return (
    <Button
      className={clsx(
        "w-full [1.2rem_2.4rem] rounded-[8rem] h-[4.2rem]",
        className
      )}
      {...rest}
    >
      <p
        className={clsx(
          "text-[1.4rem] text-black",
          textClassName || "text-inherit"
        )}
      >
        {text}
      </p>
    </Button>
  );
};

export default ButtonComponent;
