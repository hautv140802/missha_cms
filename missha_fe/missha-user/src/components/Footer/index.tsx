import { Link } from "react-router-dom";
import svgs from "../../assets/svgs";
import paths from "../../utils/constants/paths";

const FooterComponent = () => {
  return (
    <div className="bg-black w-full py-[3.2rem]">
      <div className="flex w-[120rem] mx-auto justify-between items-start">
        <div className="flex justify-start items-center gap-[2.4rem]">
          <div className="w-[3.2rem] h-[3.2rem]">
            <img
              src={svgs.facebook}
              alt="facebook-icon"
              className="w-full h-full"
            />
          </div>
          <div className="w-[3.2rem] h-[3.2rem]">
            <img
              src={svgs.tiktok}
              alt="tiktok-icon"
              className="w-full h-full"
            />
          </div>
          <div className="w-[3.2rem] h-[3.2rem]">
            <img
              src={svgs.instagram}
              alt="instagram-icon"
              className="w-full h-full"
            />
          </div>
        </div>
        <div className="flex flex-col justify-start gap-[2.4rem]">
          <div>
            <p className="text-[2.4rem] text-white font-[500]">Truyền thông</p>
          </div>
          <div>
            <p className="text-[2.4rem] text-white font-[500]">Tin tức</p>
          </div>
          <div>
            <p className="text-[2.4rem] text-white font-[500]">Sự kiện</p>
          </div>
          <div>
            <p className="text-[2.4rem] text-white font-[500]">
              Phát triển bền vững
            </p>
          </div>
        </div>
        <div className="flex flex-col justify-start gap-[2.4rem]">
          <div>
            <p className="text-[2.4rem] text-white font-[500]">Về chúng tôi</p>
          </div>
          <div className="flex flex-col gap-[1.2rem]">
            <div className="text-[2.4rem] text-white font-[400]">
              <p>Câu truyện thương hiệu</p>
            </div>
            <div className="text-[2.4rem] text-white font-[400]">
              <p>Thành tích nổi bật</p>
            </div>
            <div className="text-[2.4rem] text-white font-[400]">
              <p>Hệ thống đại lý</p>
            </div>
          </div>
        </div>
        <div className="flex flex-col justify-start gap-[2.4rem]">
          <div>
            <p className="text-[2.4rem] text-white font-[500]">Hỗ trợ</p>
          </div>
          <div className="flex flex-col gap-[1.2rem]">
            <Link to={paths.SUPPORT_POLICY_RETURN}>
              <div className="text-[2.4rem] text-white font-[400]">
                <p>Chính sách đổi trả</p>
              </div>
            </Link>
            <Link to={paths.SUPPORT_FORGOT_PASSWORD}>
              <div className="text-[2.4rem] text-white font-[400]">
                <p>Lấy lại mật khẩu</p>
              </div>
            </Link>

            <div className="text-[2.4rem] text-white font-[400]">
              <p>Hướng dẫn thanh toán</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default FooterComponent;
