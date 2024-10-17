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
        "w-full p-[0.8rem_2rem] md:p-[1.2rem_2rem] rounded-[8rem] h-full",
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
