import constants from "../../../../utils/constants/constants";
import orderStatus from "../../../../utils/constants/orderStatus";
import paths from "../../../../utils/constants/paths";
import Status from "./Status";
import { useSearchParams } from "react-router-dom";

const WrapperStatus = () => {
  const [searchParams] = useSearchParams();

  //   {
  //     active:
  //       searchParams.get("status") === "ALL" || !searchParams.get("status"),
  //     label: orderStatus.ALL,
  //     path: `${paths.PROFILE_ORDERS}?status=ALL`,
  //   },
  //   {
  //     active: searchParams.get("status") === "WAITING_CONFIRM",
  //     label: orderStatus.WAITING_CONFIRM,
  //     path: `${paths.PROFILE_ORDERS}?status=WAITING_CONFIRM`,
  //   },
  //   {
  //     active: searchParams.get("status") === "CONFIRM",
  //     label: orderStatus.CONFIRM,
  //     path: `${paths.PROFILE_ORDERS}?status=CONFIRM`,
  //   },
  //   {
  //     active: searchParams.get("status") === "DELIVERING",
  //     label: orderStatus.DELIVERING,
  //     path: `${paths.PROFILE_ORDERS}?status=DELIVERING`,
  //   },
  //   {
  //     active: searchParams.get("status") === "COMPLETE",
  //     label: orderStatus.COMPLETE,
  //     path: `${paths.PROFILE_ORDERS}?status=COMPLETE`,
  //   },
  //   {
  //     active: searchParams.get("status") === "RETURN",
  //     label: orderStatus.CANCEL,
  //     path: `${paths.PROFILE_ORDERS}?status=RETURN`,
  //   },
  //   {
  //     active: searchParams.get("status") === "CANCEL",
  //     label: orderStatus.RETURN,
  //     path: `${paths.PROFILE_ORDERS}?status=CANCEL`,
  //   },
  // ];
  const statusItems = Object.entries(orderStatus).map(([key, label]) => ({
    active:
      searchParams.get(constants.STATUS) === key ||
      (key === "ALL" && !searchParams.get(constants.STATUS)),
    label,
    path: `${paths.PROFILE_ORDERS}?status=${key}`,
  }));

  return (
    <div className="flex justify-between bg-white">
      {statusItems?.map((item, index) => (
        <Status key={index} {...item} />
      ))}
    </div>
  );
};

export default WrapperStatus;
