import DividerComponent from "../../components/Divider";
import paths from "../../utils/constants/paths";
import BreadcrumbComponent from "../../components/Breadcrumb";
import CartItemComponent from "../../components/CartItem";
import { Divider } from "antd";
import ButtonComponent from "../../components/Button";
import ScrollbarComponent from "../../components/Scrollbar";
import VoucherComponent from "../../components/Voucher";
import SelectComponent from "../../components/Select";

const breadcrumb = [
  {
    href: paths.HOME,
    title: "Trang chủ",
  },
  {
    href: paths.CART,
    title: "Giỏ hàng",
  },
];
const Cart = () => {
  return (
    <div className="py-[1.2rem] mt-[10rem] bg-[#f7f7f7]">
      <div className="w-[140rem] mx-auto">
        <BreadcrumbComponent items={breadcrumb} />
      </div>

      <div className="w-[140rem] mx-auto p-[2.4rem]">
        <p className="text-[2.4rem] font-[600] uppercase text-center">
          Giỏ hàng
        </p>
      </div>
      <div className="w-[140rem] mx-auto flex justify-between items-start gap-[1.2rem]">
        <div className="w-[60%] shadow-md bg-white p-[2.4rem]">
          <div className="w-full flex justify-between items-center  ">
            <span className="w-[60%] text-[1.6rem] font-[500] text-black">
              Sản phẩm
            </span>

            <span className="w-[20%] text-[1.6rem] font-[500] text-black text-right">
              Số lượng
            </span>
            <span className="w-[20%] text-[1.6rem] font-[500] text-black text-right">
              Tổng
            </span>
            <span className="min-w-[10%]"></span>
          </div>

          <Divider />
          <div className="flex flex-col gap-[1.2rem] mt-[1.2rem]">
            <ScrollbarComponent height="67.6rem">
              <div className="w-[99%]">
                {Array.from({ length: 4 }).map((_, index) => (
                  <div key={index}>
                    <div className="py-[0.8rem]">
                      <CartItemComponent />
                    </div>
                    <DividerComponent />
                  </div>
                ))}
              </div>
            </ScrollbarComponent>
          </div>
        </div>
        <div className="w-[40%] flex flex-col gap-[1.6rem]">
          <div className="shadow-md p-[2.4rem]  bg-white">
            <p className="text-[2rem] font-[500] uppercase text-center">
              Vouchers
            </p>
            <Divider className="my-[0.8rem]" />
            <div className="flex flex-col gap-[1.2rem]">
              <ScrollbarComponent height="200px">
                <div className="flex flex-col gap-[1.2rem] w-[98%]">
                  {Array.from({ length: 4 }).map((_, index) => (
                    <VoucherComponent isActive={index === 1} />
                  ))}
                </div>
              </ScrollbarComponent>
              <div className="flex justify-between items-center gap-[1.2rem]">
                <ButtonComponent
                  type="text"
                  text="Không sử dụng"
                  className="border border-solid border-gray-500"
                  textClassName="text-[1.6rem] uppercase"
                />
                <ButtonComponent
                  type="primary"
                  text="Áp dụng"
                  textClassName="text-[1.6rem] uppercase text-white"
                />
              </div>
            </div>
          </div>
          <div className="shadow-md p-[2.4rem]  bg-white">
            <p className="text-[2rem] font-[500] uppercase text-center">
              Phương thức giao hàng
            </p>
            <Divider className="my-[0.8rem]" />
            <div className="flex flex-col gap-[1.2rem]">
              <div className="w-full">
                <SelectComponent
                  name="shippingPayment"
                  className="w-full text-[1.6rem]"
                  value={"GHTC"}
                  options={[
                    {
                      value: "GHTC",
                      label: "Giao hàng tiêu chuẩn (35.000 đ)",
                    },
                  ]}
                />
              </div>
            </div>
          </div>

          <div className="shadow-md p-[2.4rem]  bg-white">
            <p className="text-[2rem] font-[500] uppercase text-center">
              Thông tin đơn hàng
            </p>
            <Divider className="my-[0.8rem]" />
            <div className="flex flex-col gap-[1.2rem]">
              <div className="flex flex-col gap-[0.4rem]">
                <div className="flex justify-between items-center">
                  <p className="text-[1.4rem] font-[500]">Tạm tính:</p>
                  <p className="text-[1.6rem] font-[600]">544.000 đ</p>
                </div>
                <div className="flex justify-between items-center">
                  <p className="text-[1.4rem] font-[500]">Tiết kiệm:</p>
                  <p className="text-[1.6rem] font-[600]">94.000 đ</p>
                </div>
                <div className="flex justify-between items-center">
                  <p className="text-[1.4rem] font-[500]">Phí vận chuyển:</p>
                  <p className="text-[1.6rem] font-[600]">35.000 đ</p>
                </div>

                <div className="flex justify-between items-center">
                  <p className="text-[1.4rem] font-[500]">Giảm giá:</p>
                  <p className="text-[1.6rem] font-[600]">-45.000 đ</p>
                </div>
                <div className="flex justify-between items-center mt-[0.4rem]">
                  <p className="text-[1.8rem] font-[600]">Tổng thanh toán:</p>
                  <p className="text-[1.8rem] font-[600]">588.000 đ</p>
                </div>
                <ButtonComponent
                  type="primary"
                  text="Thanh toán"
                  className="mt-[1.2rem]"
                  textClassName="text-[1.6rem] font-[500] uppercase text-white"
                />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Cart;
