interface IBenefitItemComponentProps {
  icon: string;
  text: string;
}

const BenefitItemComponent = (props: IBenefitItemComponentProps) => {
  const { icon, text } = props;
  return (
    <div className="flex justify-start items-center gap-[0.4rem]">
      <div className="w-[4rem] h-[4rem]">
        <img src={icon} alt="icon" />
      </div>
      <p className="text-[2rem]">{text}</p>
    </div>
  );
};

export default BenefitItemComponent;
