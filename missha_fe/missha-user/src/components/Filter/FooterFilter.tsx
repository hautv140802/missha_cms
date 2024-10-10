import ButtonComponent from "../Button";

const FooterFilter = () => {
  return (
    <div className="flex justify-between items-center p-[1.2rem_2rem] gap-[1.2rem]">
      <ButtonComponent type="text" text="Hủy" />
      <ButtonComponent type="primary" text="Xem 3 kết quả" />
    </div>
  );
};

export default FooterFilter;
