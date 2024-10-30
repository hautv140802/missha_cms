import { DesktopOutlined, UserOutlined } from '@ant-design/icons';
import { Dropdown, Layout, Menu, Space, type MenuProps } from 'antd';
import { useEffect, useState } from 'react';
import { Navigate, Outlet, useLocation, useNavigate } from 'react-router-dom';
import svgs from '../../assets/svgs';
import paths from '../../utils/constants/paths';
import { getAccessToken } from '@/utils/functions/getAccessToken';
import toast from 'react-hot-toast';
const { Header, Content, Footer, Sider } = Layout;

type MenuItem = Required<MenuProps>['items'][number];

function getItem(
  label: React.ReactNode,
  key: React.Key,
  icon?: React.ReactNode,
  children?: MenuItem[]
): MenuItem {
  return {
    key,
    icon,
    children,
    label,
  } as MenuItem;
}

const items: MenuItem[] = [
  // getItem('Tổng quan', 'HOME', <BarChartOutlined />),
  getItem(
    'Quản lý đơn hàng',
    paths.ORDERS,
    <img src={svgs.menuOrder} className="w-[1.8rem] h-[1.8rem]" />
  ),
  getItem(
    'Quản lý lịch SPA',
    paths.BOOKINGS,
    <img src={svgs.calender} className="w-[1.8rem] h-[1.8rem]" />
  ),

  getItem(
    'Quản lý danh mục',
    paths.CATEGORIES,
    <img src={svgs.category} className="w-[1.8rem] h-[1.8rem]" />
  ),
  getItem(
    'Quản lý dòng sản phẩm',
    paths.PRODUCT_LINES,
    <img src={svgs.productLine} className="w-[1.8rem] h-[1.8rem]" />
  ),
  getItem(
    'Quản lý đặc tính của da',
    paths.SKIN_PROPERTIES,
    <img src={svgs.skinProperty} className="w-[1.8rem] h-[1.8rem]" />
  ),
  getItem('Quản lý sản phẩm', paths.PRODUCTS, <DesktopOutlined />),
  getItem(
    'Quản lý khách hàng',
    paths.CUSTOMERS,
    <img src={svgs.userGroup} className="w-[1.8rem] h-[1.8rem]" />
  ),
  getItem(
    'Quản lý Vouchers',
    paths.VOUCHERS,
    <img src={svgs.voucher} className="w-[1.8rem] h-[1.8rem]" />
  ),
  getItem(
    'Quản lý dịch vụ',
    paths.SERVICES,
    <img src={svgs.service} className="w-[1.8rem] h-[1.8rem]" />
  ),
  getItem(
    'Quản lý voucher khách hàng',
    paths.USER_VOUCHERS,
    <img src={svgs.users} className="w-[1.8rem] h-[1.8rem]" />
  ),
];

const RootLayout = () => {
  const navigate = useNavigate();
  const location = useLocation();
  const isLoggedIn = getAccessToken();
  const [selectedKeys, setSelectedKeys] = useState<string[]>([]);
  const [selectedOpenKeys, setSelectedOpenKeys] = useState<string[]>([]);
  const [collapsed, setCollapsed] = useState(false);

  const handleClickItem = ({
    key,
    keyPath,
  }: {
    key: string;
    keyPath: string[];
  }) => {
    setSelectedKeys([key]);
    navigate(keyPath[0]);
  };

  useEffect(() => {
    setSelectedKeys([location.pathname]);
  }, []);

  const handelChangeOpenKey = (keys: string[]) => {
    setSelectedOpenKeys(keys);
  };

  if (!isLoggedIn) {
    return <Navigate to={paths.LOGIN} />;
  }

  const onclickDropdown = ({ key }: { key: string }) => {
    if (key === 'LOG_OUT') {
      localStorage.clear();
      toast.success('Đăng xuất thành công!');
      navigate(paths.LOGIN);
    }
  };
  return (
    <Layout className="min-h-screen w-[99vw]">
      <Sider
        collapsible
        collapsed={collapsed}
        onCollapse={value => setCollapsed(value)}
        theme="light"
      >
        <div className="demo-logo-vertical my-[1rem] flex items-center justify-center">
          <p className="uppercase text-[2.4rem] font-bold">Missha</p>
        </div>

        <Menu
          theme="light"
          mode="inline"
          items={items}
          className="my-[32px]"
          selectedKeys={selectedKeys}
          openKeys={selectedKeys}
          onClick={handleClickItem}
          onOpenChange={handelChangeOpenKey}
        />
      </Sider>
      <Layout>
        <Header
          style={{
            padding: '0 20px',
            background: '#FFFFFF',
            display: 'flex',
            justifyContent: 'flex-end',
            gap: '16px',
            alignItems: 'center',
          }}
        >
          <Dropdown
            menu={{
              items: [
                {
                  label: 'Đăng xuất',
                  key: 'LOG_OUT',
                },
              ],
              onClick: onclickDropdown,
            }}
            className="bg-white mt-0"
            arrow
          >
            <UserOutlined className="text-[2.4rem]" />
          </Dropdown>
        </Header>
        <Content>
          <Outlet />
        </Content>
        <Footer style={{ textAlign: 'center' }}></Footer>
      </Layout>
    </Layout>
  );
};

export default RootLayout;
