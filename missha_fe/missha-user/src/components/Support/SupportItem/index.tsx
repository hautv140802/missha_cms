import clsx from "clsx";
import { useNavigate } from "react-router-dom";

interface ISupportItemProps {
  icon?: string;
  content: string;
  linkTo?: string;
  iconClassName?: string;
}

const SupportItem = (props: ISupportItemProps) => {
  const { icon, content, linkTo, iconClassName } = props;
  const navigate = useNavigate();
  const handleNavigate = () => {
    if (linkTo) {
      navigate(linkTo);
    }
  };
  return (
    <div
      className="flex flex-col justify-center items-center py-[24px] md:py-0 w-[280px] h-[122px] md:w-[300px] md:h-[198px] border-[1px] border-solid border-[#808080] rounded-[24px] cursor-pointer"
      onClick={handleNavigate}
    >
      {!!icon && (
        <div
          className={clsx("mb-[20px] md:mb-[32px] max-h-[48px]", iconClassName)}
        >
          <img src={icon} alt="content" className="w-full h-full" />
        </div>
      )}
      <p className="w-full text-center text-[16px] leading-[22.4px] font-[700] text-black">
        {content}
      </p>
    </div>
  );
};

export default SupportItem;
