import {
  BarChartOutlined,
  BgColorsOutlined,
  DesktopOutlined,
  HomeOutlined,
  PieChartOutlined,
  ProductOutlined,
  UserOutlined,
  VideoCameraOutlined,
} from '@ant-design/icons';
import { Layout, Menu, type MenuProps } from 'antd';
import { useState } from 'react';
import { Outlet } from 'react-router-dom';

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
  getItem('Tổng quan', 'HOME', <BarChartOutlined />),
  getItem('Quản lý đơn hàng', 'ORDERS', <BgColorsOutlined />),
  getItem('Quản lý sản phẩm', 'PRODUCT', <ProductOutlined />, [
    getItem('Sản phẩm chính', 'MAIN_PRODUCT', <ProductOutlined />),
    getItem('Sản phẩm biến thể', 'VARIANT_PRODUCT', <ProductOutlined />),
  ]),
  getItem('Quản lý danh mục sản phẩm', 'PARENT_CATEGORY', <UserOutlined />),
  getItem('Quản lý khách hàng', 'CUSTOMER', <DesktopOutlined />),
  getItem('Quản lý Reels', 'REEL', <VideoCameraOutlined />),
  getItem('Quản lý Vouchers', 'VOUCHERS', <PieChartOutlined />),
  getItem('Quản lý Homepage', 'MANAGE_HOME_PAGE', <HomeOutlined />),
];

const RootLayout = () => {
  const [collapsed, setCollapsed] = useState(false);
  return (
    <Layout style={{ minHeight: '100vh', width: '100vw' }}>
      {' '}
      <Sider
        collapsible
        collapsed={collapsed}
        onCollapse={value => setCollapsed(value)}
        theme="light"
      >
        {/* <div className="demo-logo-vertical my-[1rem] flex items-center justify-center">
          <img src="" alt="" width={70} height={70} />
          <span>Missha</span>
        </div> */}
        <Menu
          theme="light"
          //   selectedKeys={selectedKeys}
          //   openKeys={openKeys}
          mode="inline"
          items={items}
          //   onClick={handleOnClickMenuItem}
          //   onOpenChange={handleOpenChange}
        />
      </Sider>
      <Content>
        <Outlet />
      </Content>
    </Layout>
  );
};

export default RootLayout;
