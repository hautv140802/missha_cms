import { useNavigate, useParams } from "react-router-dom";
import svgs from "../../assets/svgs";
import OrderItem from "../../components/Pages/Profile/Orders/OrderItem";
import paths from "../../utils/constants/paths";

const OrderDetail = () => {
  const { orderCode } = useParams() || {};
  const navigate = useNavigate();
  console.log("orderCode", orderCode);
  return (
    <div className="w-ful bg-white p-[2.4rem]">
      <div className="flex flex-col gap-[1.6rem]">
        <div className="flex justify-between items-center border-b-[0.1rem] pb-[1.2rem]">
          <div
            className="flex justify-start items-center gap-[1.2rem] cursor-pointer"
            onClick={() => navigate(paths.PROFILE_ORDERS)}
          >
            <div className="w-[2rem] h-[2rem] p-[0.1rem]">
              <img src={svgs.arrowLeft} alt="back" />
            </div>
            <p className="text-[1.6rem] text-[#0000008a]">Trở lại</p>
          </div>
          <div className="flex justify-end items-center">
            <div className="text-[1.4rem] text-[#0000008a]">
              Mã đơn hàng:{" "}
              <span className="text-[1.4rem] font-[500]">{orderCode}</span>
            </div>
            <span className="mx-[0.3rem] text-[1.6rem] text-[#0000008a]">
              |
            </span>
            <div className="text-[1.4rem] text-[#0000008a]">
              Thời gian:{" "}
              <span className="text-[1.4rem] font-[500]">
                14:27 29 Th02 2024
              </span>
            </div>
          </div>
        </div>
        <div className="w-full flex justify-between items-center gap-[1.2rem]">
          <div className="w-fit border border-solid border-[#26AA96] p-[0.4rem_1.2rem]">
            <p className="text-[#26AA96] text-[1.6rem] uppercase">
              Đang giao hàng
            </p>
          </div>
          <p className="text-[1.4rem] text-[#0000008a]">
            Đơn hàng sẽ sớm vận chuyển vào ngày:{" "}
            <span className="text-[1.4rem] font-[500]">4 Th02 2024</span>
          </p>
        </div>
        <div className="border-b-[0.1rem] pb-[1.2rem]">
          <p className="text-[1.6rem]">Địa chỉ giao hàng</p>
          <div className="fex flex-col gap-[1.2rem] *:text-[1.4rem] *:text-[#0000008a]">
            <p className="font-[500]">Trịnh Văn Hậu</p>
            <p>(+84) 336935892</p>
            <p>
              Số 121i, Đường Số 11, Khu Phố 9, Phường Trường Thọ, Thành Phố Thủ
              Đức, TP. Hồ Chí Minh
            </p>
          </div>
        </div>

        <div className="border-b-[0.1rem] pb-[1.2rem]">
          <p className="text-[1.6rem]">Thông tin đơn hàng</p>
          <div className="flex flex-col gap-[1.2rem] my-[1.6rem]">
            {Array.from({ length: 3 }).map((_, index) => (
              <OrderItem key={index} />
            ))}
          </div>
        </div>
        <div className="flex flex-col gap-[1.2rem]">
          <div className="flex justify-end items-center gap-[1.2rem]">
            <p className="text-[1.6rem] text-[#0000008a]">Tổng sản phẩm:</p>
            <p className="text-[1.6rem] min-w-[15rem] text-right">9</p>
          </div>
          <div className="flex justify-end items-center gap-[1.2rem]">
            <p className="text-[1.6rem] text-[#0000008a]">Tổng tiền hàng:</p>
            <p className="text-[1.6rem] min-w-[15rem] text-right">2.000.000đ</p>
          </div>
          <div className="flex justify-end items-center gap-[1.2rem]">
            <p className="text-[1.6rem] text-[#0000008a]">Phí vận chuyển:</p>
            <p className="text-[1.6rem] min-w-[15rem] text-right">45.000 đ</p>
          </div>
          <div className="flex justify-end items-center gap-[1.2rem]">
            <p className="text-[1.6rem] text-[#0000008a]">Voucher từ Missha:</p>
            <p className="text-[1.6rem] min-w-[15rem] text-right">-25.000 đ</p>
          </div>
          <div className="flex justify-end items-center gap-[1.2rem]">
            <p className="text-[2rem] font-[500]">Thành tiền:</p>
            <p className="min-w-[15rem] text-[2rem] text-[#ff9900] font-[500]  text-right">
              10.850.000 đ
            </p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default OrderDetail;
