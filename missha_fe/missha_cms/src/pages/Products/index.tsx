import ActionsColumn from '@/components/common/ActionsColumn';
import AvatarComponent from '@/components/common/Avatar';
import ButtonComponent from '@/components/common/Button';
import ContentWrapper from '@/components/common/ContentWrapper';
import ModalComponent from '@/components/common/Modal';
import SettingColumn from '@/components/common/SettingColumn';
import TableComponent from '@/components/common/Table';
import ProductForm from '@/components/pages/ProductForm';
import useDeleteCategory from '@/libs/axios/category/useDeleteCategory';
import useDeleteProduct from '@/libs/axios/product/useDeleteProduc';
import { useFetchProducts } from '@/libs/swr/useFetchProducts';
import { BaseData } from '@/types/base/baseData';
import { ImageType } from '@/types/common/image';
import { CategoryResponseType } from '@/types/response/category';
import {
  ProductLineResponseType,
  ProductResponseType,
  SkinPropertiesResponseType,
} from '@/types/response/product';
import defaultKey from '@/utils/constants/default';
import formType from '@/utils/constants/formType';
import PAGE_SIZE from '@/utils/constants/pageSize';
import { SettingOutlined } from '@ant-design/icons';
import { TableColumnsType } from 'antd';
import Search from 'antd/es/input/Search';
import dayjs from 'dayjs';
import { useEffect, useState } from 'react';
import toast from 'react-hot-toast';

const defaultCheckedList = [
  'name',
  'slug',
  'avatar',
  'gallery',
  'price',
  'sale_price',
  ' gallery',
  'categories',
  'product_line',
  'skin_properties',
  'total_purchase',
  'description',
  'actions',
];

const Products = () => {
  const [currentPage, setCurrentPage] = useState<number>(1);
  const [currentCheckedList, setCurrentCheckedList] =
    useState<string[]>(defaultCheckedList);
  const [openConfigModal, setOpenConfigModal] = useState<boolean>(false);
  const [checkedList, setCheckedList] = useState(defaultCheckedList);
  const [visibleColumns, setVisibleColumns] = useState<TableColumnsType<any>>();
  const [openFormModal, setOpenFormModal] = useState<boolean>(false);
  const [selectedRecord, setSelectedRecord] =
    useState<BaseData<ProductResponseType>>();

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

  const { data, isLoading, pagination, mutate } = useFetchProducts(params);
  const columns: TableColumnsType<any> = [
    {
      title: 'ID',
      dataIndex: 'id',
      key: 'id',
    },
    {
      title: 'Name',
      dataIndex: ['attributes', 'name'],
      key: 'name',
    },
    {
      title: 'Slug',
      dataIndex: ['attributes', 'slug'],
      key: 'slug',
    },
    {
      title: 'Avatar',
      dataIndex: ['attributes', 'avatar', 'data'],
      key: 'avatar',
      render: (avatar: BaseData<ImageType>) => (
        <AvatarComponent
          src={avatar?.attributes?.url}
          alt={avatar?.attributes?.name}
        />
      ),
    },

    {
      title: 'Price',
      dataIndex: ['attributes', 'price'],
      key: 'price',
    },
    {
      title: 'Sale price',
      dataIndex: ['attributes', 'sale_price'],
      key: 'sale_price',
    },
    {
      title: 'gallery',
      dataIndex: ['attributes', 'gallery', 'data'],
      key: 'gallery',
      render: (gallery: BaseData<ImageType>[]) =>
        gallery?.map((item, index) => (
          <AvatarComponent
            key={index}
            src={item?.attributes?.url}
            alt={item?.attributes?.name}
          />
        )),
    },
    {
      title: 'Categories',
      dataIndex: ['attributes', 'categories', 'data'],
      key: 'categories',
      render: (categories: BaseData<CategoryResponseType>[]) =>
        categories?.map((category, index) => (
          <p key={index}>{category.attributes.name}</p>
        )),
    },
    {
      title: 'Product line',
      dataIndex: ['attributes', 'product_line', 'data'],
      key: 'product_line',
      render: (categories: BaseData<ProductLineResponseType>) =>
        categories.attributes.name,
    },
    {
      title: 'Skin properties',
      dataIndex: ['attributes', 'skin_properties', 'data'],
      key: 'skin_properties',
      render: (skin_properties: BaseData<SkinPropertiesResponseType>[]) =>
        skin_properties?.map((skin_properties, index) => (
          <p key={index}>{skin_properties.attributes.name}</p>
        )),
    },
    {
      title: 'Total purchase',
      dataIndex: ['attributes', 'total_purchase'],
      key: 'total_purchase',
    },
    // {
    //   title: 'Description',
    //   dataIndex: ['attributes', 'description'],
    //   key: 'description',
    // },

    {
      title: 'Create at',
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
            const categoryRes = await useDeleteProduct(record.id);
            if (categoryRes && categoryRes.data.id) {
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
    setOpenFormModal(true);
  };
  const title =
    currentFormType === formType.FORM_VIEW
      ? 'Xem chi tiết sản phẩm'
      : currentFormType === formType.FORM_CREATE
      ? 'Tạo mới sản phẩm'
      : 'Cập nhật sản phẩm';
  return (
    <ContentWrapper className="h-full">
      <div>
        <p className="uppercase text-[1.6rem] font-[700]">Quản lý sản phẩm</p>
        <div className="flex justify-between items-center mb-[1.8rem] mt-[2.4rem]">
          <div className="max-w-[20rem]">
            <Search placeholder="Nhập từ khóa tìm kiếm" enterButton />
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
          total: (pagination?.pageCount || 1) * (pagination?.pageSize || 10),
          pageSize: pagination?.pageSize,
        }}
        setCurrentPage={setCurrentPage}
      />

      <ModalComponent
        open={openFormModal}
        title={title}
        onCancel={handleCancelFormModal}
      >
        <ProductForm
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

export default Products;
