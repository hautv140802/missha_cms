import InputComponent from "../components/Input";

const Profile = () => {
  return (
    <div className="w-ful py-[3.2rem] bg-white">
      <p>Thông tin cá nhân</p>
      <form>
        <InputComponent name="name" />
      </form>
    </div>
  );
};

export default Profile;
