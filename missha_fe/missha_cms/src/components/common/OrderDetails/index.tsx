import { useFetchOrderDetails } from '@/libs/swr/useFetchOrderDetails';
import { TableColumnsType } from 'antd';
import TableCustomComponent from '../Table';

interface IOrderDetailsComponent {
  orderID: number;
}

const OrderDetails = (props: IOrderDetailsComponent) => {
  const { orderID } = props;
  const params = {
    populate: 'deep, 2',
    'pagination[pageSize]': 200,
  };
  const { data: dataOrderDetails, isLoading } = useFetchOrderDetails(
    params,
    orderID
  );
  const columns: TableColumnsType = [
    {
      title: 'Product name',
      dataIndex: ['attributes', 'product', 'data', 'attributes', 'name'],
      key: 'product_name',
      render: product_name => (
        <p className="max-w-[25rem] line-clamp-1">{product_name}</p>
      ),
    },
    {
      title: 'Unit price',
      dataIndex: ['attributes', 'unit_price'],
      key: 'unit_price',
    },
    {
      title: 'Quantity',
      dataIndex: ['attributes', 'quantity'],
      key: 'quantity',
    },
  ];
  if (isLoading) return '-';
  return (
    <div>
      <TableCustomComponent
        columns={columns}
        dataSource={dataOrderDetails}
        pageSizeUI={5}
        isLoading={true}
        rowKey={'id'}
      />
    </div>
  );
};

export default OrderDetails;
