import ButtonComponent from "../Button";

interface IFooterFilterProps {
  handleApply: () => void;
  countFilterProduct: number;
  handleCancel: () => void;
}
const FooterFilter = (props: IFooterFilterProps) => {
  const { handleApply, countFilterProduct, handleCancel } = props;
  return (
    <div className="flex justify-between items-center p-[1.2rem_2rem] gap-[1.2rem]">
      <ButtonComponent type="text" text="Hủy" onClick={handleCancel} />
      <ButtonComponent
        type="primary"
        text={`Xem (${countFilterProduct}) kết quả`}
        onClick={handleApply}
      />
    </div>
  );
};

export default FooterFilter;
