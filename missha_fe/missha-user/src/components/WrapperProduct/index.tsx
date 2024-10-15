import ProductComponent from "../Product";

interface IWrapperProductComponentProps {
  title?: string;
}
const WrapperProductComponent = (props: IWrapperProductComponentProps) => {
  const { title } = props;
  return (
    <div className="w-[120rem] mx-auto my-[1.2rem] bg-white">
      {title && (
        <p className="text-[2.4rem] font-bold uppercase mb-[1.2rem]">{title}</p>
      )}
      <div className="flex justify-center items-center gap-[3.2rem]">
        {Array.from({
          length: 6,
        }).map((_, index) => (
          <ProductComponent key={index} page="product" />
        ))}
      </div>
    </div>
  );
};

export default WrapperProductComponent;
