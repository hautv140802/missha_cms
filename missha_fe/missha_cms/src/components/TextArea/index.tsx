import { TextAreaProps } from 'antd/es/input';
import TextArea from 'antd/es/input/TextArea';
import clsx from 'clsx';
import { Controller, FieldError, RegisterOptions } from 'react-hook-form';

interface ITextAreaComponentProps extends TextAreaProps {
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

const TextAreaComponent = (props: ITextAreaComponentProps) => {
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
      {/* Label Section */}
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

      {/* TextArea Section with Controller */}
      <Controller
        name={name}
        control={control}
        rules={rules}
        render={({ field: { onChange, onBlur, value, ref } }) => (
          <TextArea
            className={clsx(
              'min-h-[4.2rem] font-[500] text-[1.4rem] leading-[2rem]',
              className
            )}
            rows={4}
            onChange={onChange}
            onBlur={onBlur}
            value={value}
            ref={ref}
            {...rest}
          />
        )}
      />

      {/* Helper Text */}
      {helpText && (
        <p className="text-[1.4rem] text-[#667085] leading-[2rem] font-[500]">
          {helpText}
        </p>
      )}

      {/* Error Message */}
      {errors && (
        <p className="text-[1.4rem] text-red-500 leading-[2rem] font-[500] text-left">
          {errors.message}
        </p>
      )}
    </div>
  );
};

export default TextAreaComponent;
