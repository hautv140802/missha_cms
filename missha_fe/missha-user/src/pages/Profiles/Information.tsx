import InputComponent from "../../components/Input";

const Information = () => {
  return (
    <div className="w-ful p-[2.4rem] bg-white">
      <p className="text-[1.6rem] font-[500] uppercase">Thông tin cá nhân</p>
      <form className="w-[40rem] mx-auto my-[2.4rem] flex flex-col gap-[2.4rem]">
        <InputComponent name="userName" label="Tên tài khoản" />
        <InputComponent name="email" label="Email" />
      </form>
    </div>
  );
};

export default Information;
