import { useLocation } from "react-router-dom";
import orderStatus from "../../../../utils/constants/orderStatus";
import paths from "../../../../utils/constants/paths";
import Status from "./Status";

const WrapperStatus = () => {
  const location = useLocation();
  const statusItems = [
    {
      active:
        location.pathname === paths.PROFILE_ORDERS_ALL ||
        location.pathname === paths.PROFILE_ORDERS,
      label: orderStatus.ALL,
      path: paths.PROFILE_ORDERS_ALL,
    },
    {
      active: location.pathname === paths.PROFILE_ORDERS_WAITING_CONFIRM,
      label: orderStatus.WAITING_CONFIRM,
      path: paths.PROFILE_ORDERS_WAITING_CONFIRM,
    },
    {
      active: location.pathname === paths.PROFILE_ORDERS_CONFIRM,
      label: orderStatus.CONFIRM,
      path: paths.PROFILE_ORDERS_CONFIRM,
    },
    {
      active: location.pathname === paths.PROFILE_ORDERS_DELIVERING,
      label: orderStatus.DELIVERING,
      path: paths.PROFILE_ORDERS_DELIVERING,
    },
    {
      active: location.pathname === paths.PROFILE_ORDERS_COMPLETE,
      label: orderStatus.COMPLETE,
      path: paths.PROFILE_ORDERS_COMPLETE,
    },
    {
      active: location.pathname === paths.PROFILE_ORDERS_RETURN,
      label: orderStatus.CANCEL,
      path: paths.PROFILE_ORDERS_RETURN,
    },
    {
      active: location.pathname === paths.PROFILE_ORDERS_CANCEL,
      label: orderStatus.RETURN,
      path: paths.PROFILE_ORDERS_CANCEL,
    },
  ];
  return (
    <div className="flex justify-between bg-white">
      {statusItems?.map((item, index) => (
        <Status key={index} {...item} />
      ))}
    </div>
  );
};

export default WrapperStatus;
