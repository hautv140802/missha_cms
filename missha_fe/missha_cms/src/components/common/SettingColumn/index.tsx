import { Checkbox, CheckboxOptionType, Divider } from 'antd';
import clsx from 'clsx';

interface ISettingColumnProps {
  defaultList: string[];
  options: CheckboxOptionType[];
  checkedList: string[];
  onChange: (value: string[]) => void;
  open?: boolean;
  handleSubmit: () => void;
  handelCancel: () => void;
}

const SettingColumn = (props: ISettingColumnProps) => {
  const {
    defaultList,
    options,
    checkedList,
    onChange,
    open,
    handleSubmit,
    handelCancel,
    ...rest
  } = props;
  const handleSelectAll = () => {
    const allOptionValues = options.map(option => option.value as string);
    onChange(allOptionValues);
  };

  const handleReset = () => {
    onChange(defaultList);
  };

  return (
    <div
      className={clsx(
        'config-columns bg-white p-[1.2rem] min-w-[20rem] w-full absolute top-[90%] right-0 z-10 shadow-lg rounded-sm overflow-y-auto',
        open ? 'block duration-5000' : 'hidden'
      )}
      onClick={e => e.stopPropagation()}
    >
      <div className="flex flex-col justify-between mb-[0.8rem]">
        <div className="flex justify-between">
          <div
            className="bg-transparent text-[1.4rem] cursor-pointer text-[#1677ff]"
            onClick={e => {
              e.stopPropagation();
              handleSelectAll();
            }}
          >
            Tất cả
          </div>
          <div
            className="bg-transparent text-[1.4rem] cursor-pointer text-[#1677ff]"
            onClick={e => {
              e.stopPropagation();
              handleReset();
            }}
          >
            Mặc định
          </div>
        </div>
        <div className="mt-[0.8rem]">
          <span className="text-[1.4rem]">Các trường được hiển thị</span>
        </div>
      </div>
      <Divider className="my-[0.8rem]" />
      <div className="config-columns h-[15rem] overflow-y-auto border-b-1 px-[1.2rem]">
        <Checkbox.Group
          className="flex flex-col my-[0.4rem]"
          {...rest}
          options={options}
          value={checkedList}
          onChange={onChange}
        />
      </div>
      <Divider className="my-[0.8rem]" />
      <div className="flex justify-end items-center gap-[1.2rem]">
        <button
          className="bg-transparent border-[#1677ff] text-[#1677ff] px-[1.2rem] py-[0.4rem]"
          onClick={handelCancel}
        >
          Hủy
        </button>
        <button
          className="bg-[#1677ff] text-white px-[1.2rem] py-[0.4rem]"
          onClick={handleSubmit}
        >
          Áp dụng
        </button>
      </div>
    </div>
  );
};

export default SettingColumn;
