import Search from 'antd/es/input/Search';
import ContentWrapper from '../../components/common/ContentWrapper';
import { SettingOutlined } from '@ant-design/icons';
import TableComponent from '../../components/common/Table';

const Orders = () => {
  // const columns = TableColumnsType<>;
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
                // handleOpenModalColumns();
              }}
            >
              <SettingOutlined className="w-[2.4rem] text-[2.4rem] " />
            </div>

            {/* <SettingColumn
              options={options}
              onChange={handleChangeCheckedList}
              checkedList={checkedList}
              open={openConfigModal}
              defaultList={defaultCheckedList}
              handleSubmit={handleSubmitColumn}
              handelCancel={handelCancelColumn}
            /> */}
          </div>
        </div>
      </div>

      <TableComponent />
    </ContentWrapper>
  );
};

export default Orders;
