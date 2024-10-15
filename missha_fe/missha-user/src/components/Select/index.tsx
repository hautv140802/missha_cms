import { Select, SelectProps } from "antd";
import clsx from "clsx";
import { Controller, FieldError, RegisterOptions } from "react-hook-form";

interface ISelectComponentProps extends SelectProps {
  name: string;
  rules?: RegisterOptions;
  errors?: FieldError;
  helpText?: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  control?: any;
  className?: string;
}
const SelectComponent = (props: ISelectComponentProps) => {
  const {
    name,
    rules,
    errors,
    helpText,
    options,
    control,
    className,
    ...rest
  } = props;

  if (!control)
    return (
      <Select
        {...rest}
        className={clsx(
          "w-full h-[4.2rem] font-[500] text-[1.4rem] leading-[2rem] border-[#000] hover:!border-[#000] focus:border-[#000] focus:shadow-none",
          className
        )}
      >
        {options &&
          options.map((option) => (
            <Select.Option key={option.value} value={option.value}>
              {option.label}
            </Select.Option>
          ))}
      </Select>
    );
  return (
    <div className="w-auto">
      <Controller
        name={name}
        control={control}
        rules={rules}
        render={({ field: { onChange, onBlur, value, ref } }) => (
          <Select
            className={clsx(
              "w-full h-[4.2rem] font-[500] text-[1.4rem] leading-[2rem] border-[#000] hover:!border-[#000] focus:border-[#000] focus:shadow-none",
              className
            )}
            onChange={onChange}
            onBlur={onBlur}
            value={value}
            ref={ref}
            {...rest}
          >
            {options &&
              options.map((option) => (
                <Select.Option key={option.value} value={option.value}>
                  {option.label}
                </Select.Option>
              ))}
          </Select>
        )}
      />
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

export default SelectComponent;
