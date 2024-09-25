import { DatePicker, DatePickerProps } from 'antd';
import clsx from 'clsx';
import dayjs from 'dayjs';
import { Controller, FieldError, RegisterOptions } from 'react-hook-form';

interface DatePickerComponentProps extends DatePickerProps {
  name: string;
  rules?: RegisterOptions;
  errors?: FieldError;
  helpText?: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  control?: any;
  containerClassName?: string;
  className?: string;
  labelClassName?: string;
  label?: string;
  isRequired?: boolean;
}
const DatePickerComponent = (props: DatePickerComponentProps) => {
  const {
    name,
    rules,
    errors,
    helpText,
    control,
    containerClassName,
    className,
    labelClassName,
    label,
    isRequired,
    ...rest
  } = props;

  return (
    <div
      className={clsx('w-auto flex flex-col gap-[0.6rem]', containerClassName)}
    >
      {!!label && (
        <div className="flex items-center gap-[0.8rem]">
          <label
            className={clsx(
              'font-[500] text-[1.4rem] leading-[2rem] text-[#484848]',
              labelClassName
            )}
          >
            {label}
          </label>
          <div
            className={clsx(
              'flex items-center justify-center',
              isRequired ? 'visible' : 'invisible'
            )}
          >
            <span className="text-[red] font-bold text-[1.6rem]">*</span>
          </div>
        </div>
      )}
      {!control ? (
        <DatePicker
          {...rest}
          className={clsx('text-[1.6rem] font-[500]', className)}
        />
      ) : (
        <Controller
          name={name}
          control={control}
          rules={rules}
          render={({ field: { onChange, onBlur, value, ref } }) => (
            <DatePicker
              className={clsx('text-[1.6rem] font-[500]', className)}
              onChange={date => {
                onChange(date ? dayjs(date).toISOString() : undefined);
              }}
              onBlur={onBlur}
              value={value ? dayjs(value) : null}
              ref={ref}
              showTime
              {...rest}
            />
          )}
        />
      )}
    </div>
  );
};

export default DatePickerComponent;
