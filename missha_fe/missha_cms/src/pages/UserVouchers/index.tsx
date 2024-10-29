import ActionsColumn from '@/components/common/ActionsColumn';
import ButtonComponent from '@/components/common/Button';
import ContentWrapper from '@/components/common/ContentWrapper';
import ModalComponent from '@/components/common/Modal';
import SettingColumn from '@/components/common/SettingColumn';
import TableComponent from '@/components/common/Table';
import { useFetchUserVouchers } from '@/libs/swr/useUserVouchers';
import { BaseData } from '@/types/base/baseData';
import defaultKey from '@/utils/constants/default';
import formType from '@/utils/constants/formType';
import PAGE_SIZE from '@/utils/constants/pageSize';
import { SettingOutlined } from '@ant-design/icons';
import { TableColumnsType } from 'antd';
import dayjs from 'dayjs';
import { useEffect, useState } from 'react';
import toast from 'react-hot-toast';
import { VoucherType } from '../../../../missha-user/src/types/response/voucher';
import { formatPrice } from '@/utils/functions/formatPrice';
import useDeleteUserVoucher from '@/libs/axios/userVoucher/useDeleteUserVoucher';
import UserVoucherForm from '@/components/pages/UserVoucherForm';
import { UserVoucherType } from '@/types/response/userVoucher';

const defaultCheckedList = ['email', 'voucher', 'status', 'actions'];

const UserVouchers = () => {
  const [currentPage, setCurrentPage] = useState<number>(1);
  const [currentCheckedList, setCurrentCheckedList] =
    useState<string[]>(defaultCheckedList);
  const [openConfigModal, setOpenConfigModal] = useState<boolean>(false);
  const [checkedList, setCheckedList] = useState(defaultCheckedList);
  const [visibleColumns, setVisibleColumns] = useState<TableColumnsType<any>>();
  const [openFormModal, setOpenFormModal] = useState<boolean>(false);
  const [selectedRecord, setSelectedRecord] =
    useState<BaseData<UserVoucherType>>();

  const [openTime, setOpenTime] = useState<string>();
  const [currentFormType, setCurrentFormType] = useState<string>(
    formType.FORM_VIEW
  );
  const params = {
    populate: 'deep, 3',
    sort: 'id:desc',
    'pagination[page]': currentPage,
    'pagination[pageSize]': PAGE_SIZE,
  };

  const { data, isLoading, pagination, mutate } = useFetchUserVouchers(params);
  const columns: TableColumnsType<any> = [
    {
      title: 'ID',
      dataIndex: 'id',
      key: 'id',
    },
    {
      title: 'Khách hàng',
      dataIndex: ['attributes', 'user', 'data', 'attributes', 'email'],
      key: 'email',
    },

    {
      title: 'Voucher',
      dataIndex: ['attributes', 'voucher', 'data'],
      key: 'voucher',
      render: (voucher: BaseData<VoucherType>) => (
        <p>
          <span className="font-[500]">{voucher?.attributes?.code}</span> -{' '}
          {formatPrice(Number(voucher?.attributes?.amount_decrease))}
        </p>
      ),
    },
    {
      title: 'Trạng thái',
      dataIndex: ['attributes', 'status'],
      key: 'status',
    },

    {
      title: 'Ngày tạo',
      dataIndex: ['attributes', 'createdAt'],
      render: (createdAt: string) =>
        dayjs(createdAt).format(defaultKey.DATE_TIME_FORMAT),
      key: 'createdAt',
    },
    {
      title: 'Ngày cập nhật',
      dataIndex: ['attributes', 'updatedAt'],
      render: (updatedAt: string) =>
        dayjs(updatedAt).format(defaultKey.DATE_TIME_FORMAT),
      key: 'updatedAt',
    },
    {
      title: 'Thao tác',
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
            const productLineRes = await useDeleteUserVoucher(record.id);
            if (productLineRes && productLineRes.data.id) {
              toast.success('Xóa thông tin thành công!');
              mutate();
            } else {
              toast.error('Xóa thông tin thất bại!');
            }
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
    setOpenTime(new Date().toString());
    setOpenFormModal(true);
    setSelectedRecord(undefined);
  };
  const title =
    currentFormType === formType.FORM_VIEW
      ? 'Xem chi tiết voucher khách hàng'
      : currentFormType === formType.FORM_CREATE
      ? 'Tạo mới voucher khách hàng'
      : 'Cập nhật voucher khách hàng';
  return (
    <ContentWrapper className="h-full">
      <div>
        <p className="uppercase text-[1.6rem] font-[700]">
          Quản lý voucher khách hàng
        </p>
        <div className="flex justify-between items-center mb-[1.8rem] mt-[2.4rem]">
          <div className="max-w-[20rem]">
            {/* <Search placeholder="Nhập từ khóa tìm kiếm" enterButton /> */}
          </div>
          <div className="flex justify-between items-center gap-[1.8rem]">
            <ButtonComponent
              text="Tạo mới"
              type="primary"
              onClick={handleCreateForm}
            />
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
      </div>
      <TableComponent
        columns={visibleColumns}
        dataSource={data}
        rowKey={'id'}
        isLoading={isLoading}
        pagination={{
          current: pagination?.page,
          total:
            (pagination?.pageCount || 1) * (pagination?.pageSize || PAGE_SIZE),
          pageSize: pagination?.pageSize || PAGE_SIZE,
        }}
        setCurrentPage={setCurrentPage}
      />

      <ModalComponent
        open={openFormModal}
        title={title}
        onCancel={handleCancelFormModal}
      >
        <UserVoucherForm
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

export default UserVouchers;
