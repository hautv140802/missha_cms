import { Link } from "react-router-dom";
import images from "../../assets/images";
import paths from "../../utils/constants/paths";
import BreadcrumbComponent from "../../components/Breadcrumb";

const Support = () => {
  const dataSupports = [
    {
      path: paths.SUPPORT_POLICY_RETURN,
      image: images.policyReturn,
      title: "Chính sách đổi trả",
    },
    {
      path: paths.SUPPORT_FORGOT_PASSWORD,
      image: images.forgotPassword,
      title: "Lấy lại mật khẩu",
    },
  ];

  const itemBreadcrumbs = [
    {
      href: paths.HOME,
      title: "Trang chủ",
    },
    {
      href: paths.SUPPORT,
      title: "Hỗ trợ",
    },
  ];
  return (
    <div className="w-[140rem] mx-auto items-center mt-[6.8rem] bg-background h-[calc(100vh-20rem)]">
      <div className="max-w-[120rem] mx-auto">
        <BreadcrumbComponent items={itemBreadcrumbs} />
      </div>
      <div className="bg-white p-[2.4rem_2.4rem_4.8rem]">
        <p className="text-[3.2rem] font-[500] text-[#ff9900] text-center">
          Bạn cần hỗ trợ?
        </p>
        <div className="flex justify-center items-center gap-[4rem] mt-[4.2rem]">
          {dataSupports.map((item, index) => (
            <Link to={item.path} key={index} className="group">
              <div className="w-[25rem] h-[25rem] border">
                <img
                  src={item.image}
                  alt={item.title}
                  className="w-full h-full object-cover"
                />
              </div>
              <p className="text-[1.6rem] font-[500] text-center mt-[1.2rem] group-hover:text-[#ff9000] group-hover:underline">
                {item.title}
              </p>
            </Link>
          ))}
        </div>
      </div>
    </div>
  );
};

export default Support;
