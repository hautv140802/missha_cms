import images from "../assets/images";

const Profile = () => {
  return (
    <div className="w-ful py-[3.2rem] bg-white">
      <div className="w-[140rem] h-[29rem] mx-auto">
        <img
          src={images.banner_booking}
          className="w-full h-full object-cover"
        />
      </div>
    </div>
  );
};

export default Profile;
