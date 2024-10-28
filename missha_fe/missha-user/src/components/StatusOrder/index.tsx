import clsx from "clsx";

interface IStatusOrderProps {
  status: string;
}
const StatusOrder = (props: IStatusOrderProps) => {
  const { status } = props;
  const statusStyles: Record<string, string> = {
    "Chờ xác nhận": "text-[#25ebca]",
    "Xác nhận": "text-[#26AA96]",
    "Đang vận chuyển": "text-[#26AA96]",
    "Hoàn thành": "text-[#096b63]",
    Huỷ: "text-[#eb6464]",
    "Trả hàng": "text-[#eb6464]",
  };
  return (
    <p className={clsx("text-[1.6rem]", statusStyles[status])}>{status}</p>
  );
};

export default StatusOrder;
