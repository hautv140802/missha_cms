import clsx from "clsx";
import svgs from "../../assets/svgs";
import { Badge } from "antd";
import paths from "../../utils/constants/paths";
import { useLocation, useNavigate } from "react-router-dom";
import NavItem from "./NavItem";

interface IHeaderComponentProps {
  className?: string;
}
const HeaderComponent = (props: IHeaderComponentProps) => {
  const location = useLocation();
  const navigate = useNavigate();
  const { className } = props;
  const { pathname } = location;

  return (
    <div className="w-full shadow-md fixed top-0 bg-white opacity-100 z-[1000]">
      <div className={clsx("w-[120rem] mx-auto py-[1.2rem]", className)}>
        <div className="w-full flex justify-between items-center">
          <div className="w-[3.2rem] h-[3.2rem] container-image p-[0.1rem]">
            <img
              src={svgs.search}
              alt="sreach-icons"
              className="w-full h-full"
            />
          </div>
          <div>
            <p className="uppercase text-[2.4rem] font-bold">Missha</p>
          </div>
          <Badge
            count={5}
            className="cart container-image cursor-pointer"
            onClick={() => navigate(paths.CART)}
          >
            <div className="w-[3.2rem] h-[3.2rem] animate-shake p-[0.1rem]">
              <img src={svgs.cart} className="w-full h-full" />
            </div>
          </Badge>
        </div>
        <div className="mt-[1.2rem]">
          <div>
            <nav className="flex justify-between items-center">
              <NavItem
                link={paths.HOME}
                name="TRANG CHỦ"
                active={pathname === paths.HOME}
              />
              <NavItem
                link={paths.PRODUCTS}
                name="SẢN PHẨM"
                active={pathname === paths.PRODUCTS}
              />
              <NavItem
                link={paths.BOOKING}
                name="BOOKING"
                active={pathname === paths.BOOKING}
              />
              <NavItem
                link={paths.PROFILE_INFORMATION}
                name="CÁ NHÂN"
                active={
                  pathname.includes(paths.PROFILE_ORDERS) ||
                  pathname.includes(paths.PROFILE_INFORMATION) ||
                  pathname.includes(paths.PROFILE_BOOKINGS)
                }
              />
              <NavItem
                link={paths.SUPPORT}
                name="HỖ TRỢ"
                active={pathname === paths.SUPPORT}
              />
            </nav>
          </div>
        </div>
      </div>
    </div>
  );
};

export default HeaderComponent;
