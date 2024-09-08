import { Pagination, PaginationProps, Table, TableProps } from 'antd';

interface ITableCustomComponentProps extends TableProps {
  isLoading?: boolean;
  pagination?: PaginationProps;
  pageSizeUI?: number;
  setCurrentPage?: (page: number) => void;
}

const TableCustomComponent = (props: ITableCustomComponentProps) => {
  const { pagination, isLoading, pageSizeUI, setCurrentPage, ...rest } = props;

  const onChange: PaginationProps['onChange'] = page => {
    setCurrentPage?.(page);
  };
  return (
    <div>
      <Table
        pagination={
          pageSizeUI
            ? {
                pageSize: pageSizeUI,
                showSizeChanger: false,
              }
            : false
        }
        scroll={{ x: 'max-content' }}
        {...rest}
      />
      {!isLoading && (
        <Pagination
          {...pagination}
          onChange={onChange}
          className="flex justify-end mt-[1.8rem]"
        />
      )}
    </div>
  );
};

export default TableCustomComponent;
