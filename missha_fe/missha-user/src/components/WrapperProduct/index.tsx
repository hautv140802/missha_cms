import ProductComponent from "../Product";

interface IWrapperProductComponentProps {
  title?: string;
}
const WrapperProductComponent = (props: IWrapperProductComponentProps) => {
  const { title } = props;
  return (
    <div className="w-[140rem] mx-auto bg-white p-[2.4rem]">
      {title && <p className="text-[2rem]">{title}</p>}
      <div className="flex justify-between items-center gap-[3.2rem] mt-[2rem]">
        {Array.from({
          length: 5,
        }).map((_, index) => (
          <ProductComponent key={index} page="product" />
        ))}
      </div>
    </div>
  );
};

export default WrapperProductComponent;
