import Search from 'antd/es/input/Search';
import ContentWrapper from '../../components/common/ContentWrapper';
import { SettingOutlined } from '@ant-design/icons';
import TableComponent from '../../components/common/Table';
import { TableColumnsType } from 'antd';
import dayjs from 'dayjs';
import defaultKey from '@/utils/constants/default';
import { useFetchOrders } from '@/libs/swr/useFetchOrders';
import PAGE_SIZE from '@/utils/constants/pageSize';
import { useEffect, useState } from 'react';
import ActionsColumn from '@/components/common/ActionsColumn';
import { OrderResponseType } from '@/types/response/order';
import { BaseData } from '@/types/base/baseData';
import formType from '@/utils/constants/formType';
import SettingColumn from '@/components/common/SettingColumn';
import { formatPrice } from '@/utils/functions/formatPrice';
import OrderStatusComponent from '@/components/common/OrderStatus';
import VoucherBadge from '@/components/common/VoucherBadge';
import ModalComponent from '@/components/common/Modal';
import OrderForm from '@/components/pages/OrderForm';

const defaultCheckedList = [
  'order_code',
  'customer_full_name',
  'customer_phone',
  'total',
  'transport_fee',
  'status',
  'shipping_method',
  'payment_method',
  'voucher',
  'actions',
];
const Orders = () => {
  const [currentPage, setCurrentPage] = useState<number>(1);
  const [openConfigModal, setOpenConfigModal] = useState<boolean>(false);
  const [checkedList, setCheckedList] = useState(defaultCheckedList);
  const [visibleColumns, setVisibleColumns] = useState<TableColumnsType<any>>();
  const [openFormModal, setOpenFormModal] = useState<boolean>(false);
  const [selectedRecord, setSelectedRecord] =
    useState<BaseData<OrderResponseType>>();
  const [currentCheckedList, setCurrentCheckedList] =
    useState<string[]>(defaultCheckedList);
  const [openTime, setOpenTime] = useState<string>();
  const [currentFormType, setCurrentFormType] = useState<string>(
    formType.FORM_VIEW
  );
  const params = {
    populate: 'deep, 2',
    sort: 'id:desc',
    'pagination[page]': currentPage,
    'pagination[pageSize]': PAGE_SIZE,
  };

  const { data, isLoading, pagination, mutate } = useFetchOrders(params);
  const columns: TableColumnsType<any> = [
    {
      title: 'ID',
      dataIndex: ['id'],
      key: 'id',
    },
    {
      title: 'Order code',
      dataIndex: ['attributes', 'order_code'],
      key: 'order_code',
    },
    {
      title: 'Customer full name',
      dataIndex: ['attributes', 'customer_full_name'],
      key: 'customer_full_name',
    },
    {
      title: 'Customer phone',
      dataIndex: ['attributes', 'customer_phone'],
      key: 'customer_phone',
    },
    {
      title: 'Total',
      dataIndex: ['attributes', 'total'],
      key: 'total',
      render: total => formatPrice(total),
      align: 'right',
    },
    {
      title: 'Transport fee',
      dataIndex: ['attributes', 'transport_fee'],
      key: 'transport_fee',
      render: transport_fee => formatPrice(transport_fee),
      align: 'right',
    },
    {
      title: 'Status',
      dataIndex: ['attributes', 'status'],
      key: 'status',
      render: status => <OrderStatusComponent status={status} />,
    },
    {
      title: 'Shipping method',
      dataIndex: ['attributes', 'shipping_method'],
      key: 'shipping_method',
    },
    {
      title: 'Payment method',
      dataIndex: ['attributes', 'payment_method'],
      key: 'payment_method',
    },

    {
      title: 'Voucher',
      dataIndex: ['attributes', 'voucher', 'data'],
      key: 'voucher',
      render: voucher => (
        <VoucherBadge
          code={voucher?.attributes?.code}
          amountDecrease={voucher?.attributes?.amount_decrease}
          className="justify-end"
        />
      ),
      align: 'right',
    },
    {
      title: 'Published at',
      dataIndex: ['attributes', 'publishedAt'],
      render: (publishedAt: string) =>
        dayjs(publishedAt).format(defaultKey.DATE_TIME_FORMAT),
      key: 'publishedAt',
    },
    {
      title: 'Created at',
      dataIndex: ['attributes', 'createdAt'],
      render: (createdAt: string) =>
        dayjs(createdAt).format(defaultKey.DATE_TIME_FORMAT),
      key: 'createdAt',
    },
    {
      title: 'Updated at',
      dataIndex: ['attributes', 'updatedAt'],
      render: (updatedAt: string) =>
        dayjs(updatedAt).format(defaultKey.DATE_TIME_FORMAT),
      key: 'updatedAt',
    },
    {
      title: 'Actions',
      render: (_, record) => (
        <ActionsColumn
          onHandleView={() => {
            setSelectedRecord(record);
            setCurrentFormType(formType.FORM_VIEW);
            setOpenTime(new Date().toString());
            setOpenFormModal(true);
          }}
          onHandleUpdate={() => {
            setSelectedRecord(record);
            setCurrentFormType(formType.FORM_UPDATE);
            setOpenFormModal(true);
            setOpenTime(new Date().toString());
          }}
          onHandleDelete={async () => {
            // const productLineRes = await useDeleteProductLine(record.id);
            // if (productLineRes && productLineRes.data.id) {
            //   toast.success('Xóa thông tin thành công!');
            //   mutate();
            // } else {
            //   toast.error('Xóa thông tin thất bại!');
            // }
          }}
        />
      ),
      key: 'actions',
      align: 'right',
      fixed: 'right',
    },
  ];

  const handleChangeCheckedList = (value: string[]) => {
    setCheckedList(value);
  };

  const handleOpenModalColumns = () => {
    if (!openConfigModal) {
      setCurrentCheckedList(checkedList);
      setOpenConfigModal(true);
    } else {
      setCheckedList(currentCheckedList);
      setOpenConfigModal(false);
    }
  };
  useEffect(() => {
    const tempNewColumns = columns.map(item => ({
      ...item,
      hidden: !checkedList.includes(item.key as string),
    }));

    setVisibleColumns(tempNewColumns);
  }, []);

  const handleSubmitColumn = () => {
    const tempNewColumns = columns.map(item => ({
      ...item,
      hidden: !checkedList.includes(item.key as string),
    }));

    setVisibleColumns(tempNewColumns);
    setOpenConfigModal(false);
  };

  const handelCancelColumn = () => {
    setOpenConfigModal(false);
    setCheckedList(currentCheckedList);
  };

  const handleCancelFormModal = () => {
    setSelectedRecord(undefined);
    setOpenFormModal(false);
  };

  const handleComplete = () => {
    mutate();
    setOpenFormModal(false);
  };

  const handleCreateForm = () => {
    setCurrentFormType(formType.FORM_CREATE);
    setOpenFormModal(true);
  };

  const title =
    currentFormType === formType.FORM_VIEW
      ? 'Xem chi tiết đơn hàng'
      : currentFormType === formType.FORM_CREATE
      ? 'Tạo mới dòng đơn hàng'
      : 'Cập nhật dòng đơn hàng';
  return (
    <ContentWrapper className="h-full">
      <div>
        <p className="uppercase text-[1.6rem] font-[700]">Quản lý đơn hàng</p>
        <div className="flex justify-between items-center mb-[1.8rem] mt-[2.4rem]">
          <div className="max-w-[20rem]">
            <Search placeholder="Nhập từ khóa tìm kiếm" enterButton />
          </div>
          <div className="relative flex gap-[1.2rem] justify-center items-center">
            <div
              className="py-[1.2rem] cursor-pointer"
              onClick={e => {
                e.stopPropagation();
                handleOpenModalColumns();
              }}
            >
              <SettingOutlined className="w-[2.4rem] text-[2.4rem] " />
            </div>

            <SettingColumn
              options={columns.map(item => ({
                label: item.title?.toString() || '',
                value: item.key || '',
              }))}
              onChange={handleChangeCheckedList}
              checkedList={checkedList}
              open={openConfigModal}
              defaultList={defaultCheckedList}
              handleSubmit={handleSubmitColumn}
              handelCancel={handelCancelColumn}
            />
          </div>
        </div>
      </div>
      <TableComponent
        dataSource={data}
        columns={visibleColumns}
        pagination={{
          current: pagination?.page || 1,
          total:
            (pagination?.pageCount || 1) * (pagination?.pageSize || PAGE_SIZE),
          pageSize: pagination?.pageSize || PAGE_SIZE,
        }}
      />
      <ModalComponent
        open={openFormModal}
        title={title}
        onCancel={handleCancelFormModal}
      >
        <OrderForm
          type={currentFormType}
          record={selectedRecord}
          onCloseModal={handleCancelFormModal}
          openTime={openTime}
          handleComplete={handleComplete}
        />
      </ModalComponent>
    </ContentWrapper>
  );
};

export default Orders;
