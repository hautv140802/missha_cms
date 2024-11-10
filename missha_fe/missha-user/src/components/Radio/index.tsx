import { Radio, RadioGroupProps } from "antd";
import clsx from "clsx";
import { Controller, FieldError, RegisterOptions } from "react-hook-form";

export interface IRadioComponentProps extends RadioGroupProps {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  control?: any;
  name: string;
  label?: string;
  inputValue?: number;
  className?: string;
  icon?: React.ReactNode;
  options: {
    label: React.ReactNode | string;
    value: number;
    disabled?: boolean;
  }[];
  labelClassName?: string;
  rules?: RegisterOptions;
  errors?: FieldError;
  helpText?: string;
}

export default function RadioComponent({
  control,
  name,
  label,
  className,
  options,
  labelClassName,
  rules,
  errors,
  helpText,
  ...rest
}: IRadioComponentProps) {
  return (
    <div>
      {!!label && (
        <label
          className={clsx(
            "font-[500] text-[14px] leading-[20px] text-[#000000]",
            labelClassName
          )}
        >
          {label}
        </label>
      )}
      <div>
        {control ? (
          <Controller
            control={control}
            name={name}
            rules={rules}
            render={({ field: { onChange, onBlur, value, ref } }) => (
              <Radio.Group
                className={clsx(
                  "font-[500] text-[14px] md:text-[16px] text-red",
                  className
                )}
                options={options}
                onChange={onChange}
                onBlur={onBlur}
                value={value}
                ref={ref}
                {...rest}
              />
            )}
          />
        ) : (
          <Radio.Group
            className={clsx(
              "font-[500] text-[14px] md:text-[16px] text-red",
              className
            )}
            options={options}
            {...rest}
          />
        )}
      </div>
      {helpText && (
        <p className="text-[14px] text-[#667085] leading-[20px] font-[500]">
          {helpText}
        </p>
      )}
      {errors && (
        <p className="text-[14px] text-[#F04438] leading-[20px] font-[500]">
          {errors.message}
        </p>
      )}
    </div>
  );
}
