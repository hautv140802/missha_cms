import { Outlet, useLocation, useNavigate } from "react-router-dom";
import HeaderComponent from "../components/Header";
import FooterComponent from "../components/Footer";
import paths from "../utils/constants/paths";
import BreadcrumbComponent from "../components/Breadcrumb";

import { Menu, MenuProps } from "antd";
import { useEffect, useState } from "react";
import { getAccessToken } from "../utils/functions/getUserInfo";
import { clear } from "console";
import toast from "react-hot-toast";

type MenuItem = Required<MenuProps>["items"][number];

const items: MenuItem[] = [
  { key: paths.PROFILE_INFORMATION, label: "Thông tin cá nhân" },
  { key: paths.PROFILE_ORDERS, label: "Đơn hàng" },
  { key: paths.PROFILE_BOOKINGS, label: "Lịch Spa" },
  { key: paths.PROFILE_VOUCHERS, label: "Vouchers" },
  { key: paths.LOGIN, label: "Đăng xuất" },
];
export default function ProfileLayout() {
  const navigate = useNavigate();
  const location = useLocation();
  const access_token = getAccessToken();

  if (!!access_token === false) {
    navigate(paths.LOGIN);
  }
  const [selectedKey, setSelectedKey] = useState<string[]>([location.pathname]);

  const currentItem = items.find(
    (item) => item?.key && location.pathname.includes(item?.key?.toString())
  ) as { key: string; label: string } | undefined;

  const itemBreadcrumbs = [
    {
      href: paths.HOME,
      title: "Trang chủ",
    },
    {
      href: paths.PROFILE_INFORMATION,
      title: "Hồ sơ",
    },
    {
      href: (currentItem?.key as string) || "Thông tin cá nhân",
      title: currentItem?.label || paths.PROFILE_INFORMATION,
    },
  ];

  const handleChangeMenu = ({
    key,
    keyPath,
  }: {
    key: string;
    keyPath: string[];
  }) => {
    if (key === paths.LOGIN) {
      localStorage.clear();
      toast.success("Đăng xuất thành công!");
      navigate(key);
      return;
    }
    navigate(key);
    setSelectedKey(keyPath);
  };

  useEffect(() => {
    if (location.pathname?.includes(paths.PROFILE_ORDERS)) {
      setSelectedKey([paths.PROFILE_ORDERS]);
    } else {
      setSelectedKey([location.pathname]);
    }
  }, [location.pathname]);

  return (
    <div className="relative container-fluid p-0 flex flex-col min-h-screen bg-[#f7f7f7] mt-[10rem]">
      <HeaderComponent />
      <div className="w-[120rem] mx-auto mt-[0.4rem]">
        <BreadcrumbComponent items={itemBreadcrumbs} />
      </div>

      <div className="relative h-full flex gap-[2.4rem] w-[120rem] mx-auto p-[1.2rem_0_2.4rem]">
        <div className="w-[40rem]">
          <Menu
            selectedKeys={selectedKey}
            mode="inline"
            theme="dark"
            items={items}
            className="profile-menu bg-white text-black p-[2.4rem]"
            onClick={handleChangeMenu}
          />
        </div>
        <div className="w-full h-full">
          <Outlet />
        </div>
      </div>
      <FooterComponent />
    </div>
  );
}
