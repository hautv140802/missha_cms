import clsx from "clsx";
import { useNavigate } from "react-router-dom";

interface IStatusProps {
  active?: boolean;
  label: string;
  path: string;
}
const Status = (props: IStatusProps) => {
  const { active, label, path } = props;
  const navigate = useNavigate();
  return (
    <div
      className={clsx(
        "border-b-4 border-solid  p-[1.6rem_2.4rem] w-fit cursor-pointer",
        active ? "border-[#ff9900]" : "border-white"
      )}
      onClick={() => navigate(path)}
    >
      <p
        className={clsx(
          "text-[1.6rem] text-nowrap",
          active ? "text-[#ff9900]" : "text-black"
        )}
      >
        {label}
      </p>
    </div>
  );
};

export default Status;
