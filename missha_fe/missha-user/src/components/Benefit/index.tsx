import svgs from "../../assets/svgs";
import BenefitItemComponent from "./BenefitItem";

const data = [
  {
    icon: svgs.returnIcon,
    text: "Bảo hành 1 đổi 1 trong vòng 365 ngày",
  },
  {
    icon: svgs.percent,
    text: "Ưu đãi giảm 20% cho tất cả sản phẩm",
  },
  {
    icon: svgs.freeShip,
    text: "Freeship cho mọi đơn hàng",
  },
];

const BenefitComponent = () => {
  return (
    <div className="flex justify-center items-center gap-[2.4rem] py-[3.2rem] bg-background">
      {data.map((item, index) => (
        <BenefitItemComponent key={index} icon={item.icon} text={item.text} />
      ))}
    </div>
  );
};

export default BenefitComponent;
