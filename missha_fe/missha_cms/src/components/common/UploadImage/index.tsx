import { UploadOutlined } from '@ant-design/icons';
import { Button, Upload, UploadFile } from 'antd';
import clsx from 'clsx';
import React from 'react';

import { UploadLocalType } from '@/types/common/UploadLocalType';

interface IUploadImageComponentProps {
  containerClassName?: string;
  className?: string;
  label?: string;
  labelClassName?: string;
  maxCount?: number;
  error?: string;
  onAddImage?: (image: UploadLocalType, fileList: UploadFile) => void;
  disabled?: boolean;
}

const UploadImageComponent: React.FC<IUploadImageComponentProps> = ({
  className,
  label,
  labelClassName,
  containerClassName,
  maxCount,
  error,
  disabled = false,
  onAddImage,
}) => {
  const handleChangeFiles = (info: any) => {
    const lengthFileList = info?.fileList?.length || 0;
    if (lengthFileList > 0) {
      const latestFileList = info.fileList[lengthFileList - 1];
      const urlLocal = URL.createObjectURL(latestFileList.originFileObj);
      const imagePreview = {
        id: latestFileList.uid,
        name: latestFileList.name,
        url: urlLocal,
      };
      onAddImage?.(imagePreview, latestFileList);
    }
  };

  return (
    <div className={clsx('flex flex-col  gap-[0.6rem]', containerClassName)}>
      <div className="flex gap-[0.8rem]">
        {!!label && (
          <label
            className={clsx(
              'font-[500] text-[1.4rem] leading-[2rem] text-[#484848]',
              labelClassName
            )}
          >
            {label}
          </label>
        )}
      </div>

      {!disabled && (
        <Upload
          name="files"
          onChange={handleChangeFiles}
          maxCount={maxCount}
          showUploadList={false}
          beforeUpload={() => false}
          className={clsx('w-full', className)}
        >
          <Button icon={<UploadOutlined />}>Tải ảnh</Button>
        </Upload>
      )}

      {error && (
        <p className="text-[1.4rem] text-red-500 leading-[2rem] font-[500]">
          {error}
        </p>
      )}
    </div>
  );
};

export default UploadImageComponent;
