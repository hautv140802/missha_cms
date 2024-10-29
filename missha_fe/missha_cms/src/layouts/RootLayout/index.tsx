import {
  DesktopOutlined,
  PieChartOutlined,
  UserOutlined,
} from '@ant-design/icons';
import { Layout, Menu, type MenuProps } from 'antd';
import { useEffect, useState } from 'react';
import { Navigate, Outlet, useLocation, useNavigate } from 'react-router-dom';
import svgs from '../../assets/svgs';
import paths from '../../utils/constants/paths';
import { getAccessToken } from '@/utils/functions/getAccessToken';

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
  // getItem('Quản lý sản phẩm', 'PRODUCT', <ProductOutlined />, [
  //   getItem('Sản phẩm chính', 'MAIN_PRODUCT', <ProductOutlined />),
  //   getItem('Sản phẩm biến thể', 'VARIANT_PRODUCT', <ProductOutlined />),
  // ]),
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
  // getItem('Quản lý Homepage', 'MANAGE_HOME_PAGE', <HomeOutlined />),
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

  return (
    <Layout className="min-h-screen w-[99vw]">
      <Sider
        collapsible
        collapsed={collapsed}
        onCollapse={value => setCollapsed(value)}
        theme="light"
      >
        <div className="demo-logo-vertical my-[1rem] flex items-center justify-center">
          <img src={svgs.logo} alt="" width={70} height={70} />
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
        ></Header>
        <Content>
          <Outlet />
        </Content>
        <Footer style={{ textAlign: 'center' }}></Footer>
      </Layout>
    </Layout>
  );
};

export default RootLayout;
