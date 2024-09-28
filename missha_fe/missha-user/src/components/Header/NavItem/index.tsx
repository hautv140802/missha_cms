import clsx from "clsx";
import { Link } from "react-router-dom";

interface INavItemProps {
  className?: string;
  link: string;
  name: string;
  active?: boolean;
}
const NavItem = (props: INavItemProps) => {
  const { className, link, name, active } = props;
  return (
    <Link
      className={clsx(
        active ? "border-b-[0.2rem] border-[#F79900] border-solid" : ""
      )}
      to={link}
    >
      <p
        className={clsx(
          "text-[1.6rem] font-[500]",
          className,
          active ? "text-[#F79900] font-[600]" : ""
        )}
      >
        {name}
      </p>
    </Link>
  );
};

export default NavItem;
