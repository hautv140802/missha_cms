import { Input, InputNumber, InputProps } from "antd";
import clsx from "clsx";
import { Controller, FieldError, RegisterOptions } from "react-hook-form";

interface IInputComponentProps extends InputProps {
  isPassword?: boolean;
  label?: string;
  labelClassName?: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  control?: any;
  name: string;
  rules?: RegisterOptions;
  errors?: FieldError;
  helpText?: string;
  isPrice?: boolean;
}

const InputComponent = (props: IInputComponentProps) => {
  const {
    isPassword,
    label,
    labelClassName,
    className,
    control,
    name,
    rules,
    errors,
    helpText,
    value,
    isPrice = false,
    ...rest
  } = props;

  if (!control) {
    return (
      <div className="input-container flex flex-col gap-[0.6rem]">
        {isPrice ? (
          <InputNumber<number>
            defaultValue={Number(value)}
            formatter={(value) =>
              `${value}`.replace(/\B(?=(\d{3})+(?!\d))/g, ",")
            }
            parser={(value) =>
              value?.replace(/\$\s?|(,*)/g, "") as unknown as number
            }
            {...props.onChange}
          />
        ) : (
          <Input
            className={clsx(
              "font-[500] h-[4.2rem] text-[1.4rem] leading-[2rem] py-[1rem] px-[1.5rem] hover:border-[#000] focus:border-[#000] focus:shadow-none",
              className
            )}
            {...rest}
          />
        )}
        {!!label && (
          <div className="label-container rounded-full bg-[#FFFFFF] px-[0.4rem] py-[0.1rem]">
            <label
              className={clsx(
                "font-[500] text-[1.2rem] leading-[2rem] text-[#9999]",
                labelClassName
              )}
            >
              {label}
            </label>
          </div>
        )}
        {helpText && (
          <p className="text-[1.4rem] text-[#667085] leading-[2rem] font-[500]">
            {helpText}
          </p>
        )}
        {errors && (
          <p className="text-[1.4rem] text-red-500 leading-[2rem] font-[500] text-right">
            {errors.message}
          </p>
        )}
      </div>
    );
  }

  if (isPassword) {
    return (
      <div className="input-container flex flex-col gap-[0.6rem]">
        <Controller
          name={name}
          control={control}
          rules={rules}
          render={({ field: { onChange, onBlur, value, ref } }) => (
            <Input.Password
              className={clsx(
                "font-[500] h-[4.2rem] text-[1.4rem] leading-[2rem] py-[1rem] px-[1.5rem] hover:border-[#000] focus-within:border-[#000] focus-within:shadow-none",
                className
              )}
              onChange={onChange}
              onBlur={onBlur}
              value={value}
              ref={ref}
              {...rest}
            />
          )}
        />
        {!!label && (
          <div className="label-container rounded-full bg-[#FFFFFF] px-[0.4rem] py-[0.1rem]">
            <label
              className={clsx(
                "font-[500] text-[1.2rem] leading-[2rem] text-[#9999]",
                labelClassName
              )}
            >
              {label}
            </label>
          </div>
        )}
        {helpText && (
          <p className="text-[1.4rem] text-[#667085] leading-[2rem] font-[500]">
            {helpText}
          </p>
        )}
        {errors && (
          <p className="text-[1.4rem] text-red-500 leading-[2rem] font-[500] text-right">
            {errors.message}
          </p>
        )}
      </div>
    );
  }

  return (
    <div className="input-container flex flex-col gap-[0.6rem]">
      <Controller
        name={name}
        control={control}
        rules={rules}
        render={({ field: { onChange, onBlur, value, ref } }) => (
          <Input
            className={clsx(
              "w-full font-[500] h-[4.2rem] text-[1.4rem] leading-[2rem] py-[1rem] px-[1.5rem] hover:border-[#000] focus:border-[#000] focus:shadow-none",
              className
            )}
            onChange={onChange}
            onBlur={onBlur}
            value={value}
            ref={ref}
            {...rest}
          />
        )}
      />
      {!!label && (
        <div className="label-container rounded-full bg-[#FFFFFF] px-[0.4rem] py-[0.1rem]">
          <label
            className={clsx(
              "font-[500] text-[1.2rem] leading-[2rem] text-[#9999]",
              labelClassName
            )}
          >
            {label}
          </label>
        </div>
      )}

      {helpText && (
        <p className="text-[1.4rem] text-[#667085] leading-[2rem] font-[500]">
          {helpText}
        </p>
      )}
      {errors && (
        <p className="text-[1.4rem] text-red-500 leading-[2rem] font-[500] text-right">
          {errors.message}
        </p>
      )}
    </div>
  );
};

export default InputComponent;
