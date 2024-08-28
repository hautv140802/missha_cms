import { Pagination, PaginationProps, Table, TableProps } from 'antd';

interface ITableComponentProps extends TableProps {
  isoLoading?: boolean;
  pagination?: PaginationProps;
  pageSizeUI?: number;
}

const TableComponent = ({
  columns,
  dataSource,
  pagination,
  isoLoading,
  pageSizeUI,
  ...rest
}: ITableComponentProps) => {
  const paginationConfig = pageSizeUI
    ? {
        pageSize: pageSizeUI,
        showSizeChanger: false,
      }
    : false;

  return (
    <div>
      <Table
        columns={columns}
        dataSource={dataSource}
        pagination={paginationConfig}
        scroll={{ x: 'max-content' }}
        {...rest}
      />
      {!isoLoading && pagination && (
        <Pagination {...pagination} className="flex justify-end mt-[1.8rem]" />
      )}
    </div>
  );
};

export default TableComponent;
