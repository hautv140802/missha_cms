import clsx from "clsx";

interface IDividerComponentProps {
  className?: string;
}
const DividerComponent = (props: IDividerComponentProps) => {
  const { className } = props;
  return (
    <div className={clsx("h-[0.8rem] w-full bg-[#F7F7F7]", className)}></div>
  );
};

export default DividerComponent;
