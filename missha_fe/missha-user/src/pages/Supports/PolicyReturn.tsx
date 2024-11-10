import { Breadcrumb } from "antd";
import paths from "../../utils/constants/paths";
import SupportText from "../../components/Support/SupportText";

const PolicyReturn = () => {
  const breadcrumbItems = [
    {
      href: paths.HOME,
      title: "Trang chủ",
    },
    {
      href: paths.SUPPORT,
      title: "Hỗ trợ",
    },
    {
      href: paths.SUPPORT_POLICY_RETURN,
      title: "Chính sách đổi trả",
    },
  ];

  const dataCaseReturn = [
    {
      content: `Sản phẩm mắc lỗi từ phía nhà sản xuất (hỏng hóc, đổ vỡ sản phẩm, bị lỗi kỹ thuật…).`,
    },
    {
      content: `Sản phẩm bị hư hỏng, trầy xước, nứt vỡ do quá trình vận chuyển của nhân viên giao hàng.`,
    },
    {
      content: `Sản phẩm đã hết hoặc gần hết thời hạn sử dụng (<2 tháng).`,
    },
    {
      content: `Sản phẩm không đúng như yêu cầu của khách hàng do nhà bán hàng soạn sai sản phẩm.`,
    },
    {
      content: `Sản phẩm phải còn nguyên vỏ hộp, tem nhãn và chưa qua sử dụng.`,
    },
  ];

  const dataNotCaseReturn = [
    {
      content: `Sản phẩm quà tặng, các sản phẩm trong chương trình giảm giá đặc biệt.`,
    },
    {
      content: `Sản phẩm đã quá hạn đổi trả (10 ngày).`,
    },
    {
      content: `Sản phẩm đã bị bóc tem nhãn, seal nếu có.`,
    },
    {
      content: `Sản phẩm khách đã thử hoặc qua sử dụng từ 1 lần trở lên.`,
    },
    {
      content: `Bao bì, vỏ hộp sản phẩm bị hư hỏng, trầy xước do lỗi từ phía khách hàng.`,
    },
    {
      content: `Sản phẩm không phải mua từ trang web missha.`,
    },
  ];

  const dataReturnAtHome = [
    {
      content: `Với các đơn hàng đã nhận hàng và thanh toán, missha sẽ chuyển khoản cho khách hàng sau khi đã nhận được hàng khách trả.`,
    },
    {
      content: `Các đơn hàng khách hàng đã thanh toán online, Missha chuyển lại tiền vào tài khoản khách hàng cung cấp sau khi trao đổi thỏa thuận hoàn tiền.`,
    },
  ];
  return (
    <div className="w-[140rem] mx-auto items-center mt-[6.8rem] bg-background min-h-[calc(100vh-20rem)]">
      <Breadcrumb items={breadcrumbItems} />
      <div className="wrapper max-w-[140rem] mx-auto my-[2.4rem]">
        <div className="w-full">
          <SupportText
            type="header"
            content="Hướng dẫn chính sách đổi trả"
            className="!text-[#000000]"
          />
          <div className="support-content mx-4 lg:mx-0">
            <SupportText content={"Chính sách đổi trả"} type="title" />
            <div className="flex justify-center lg:ml-[20px] md:block">
              <table className="table-support w-[100%]">
                <tr className="h-[20px]">
                  <th className="w-[20%] "></th>
                  <th className="text-[13px] md:text-[14px] lg:text-[16px]">
                    Sản Phẩm lỗi (Từ phía nhà cung cấp)
                  </th>
                  <th className="text-[13px] md:text-[14px] lg:text-[16px]">
                    Sản Phẩm lỗi (Từ phía người sử dụng)
                  </th>
                </tr>
                <tr>
                  <td className="font-bold text-center text-[13px] lg:text-[16px]">
                    1 - 10 ngày
                  </td>
                  <td className="text-[13px] lg:text-[16px]">
                    Đổi mới/ Trả không thu phí
                  </td>
                  <td className="text-[13px] lg:text-[16px]">
                    Không hỗ trợ đổi trả
                  </td>
                </tr>
                <tr>
                  <td className="font-bold text-center text-[13px] lg:text-[16px]">
                    Sau 10 ngày
                  </td>
                  <td
                    colSpan={2}
                    className="text-center text-[13px] lg:text-[16px]"
                  >
                    Không hỗ trợ đổi trả
                  </td>
                </tr>
              </table>
            </div>

            <SupportText content={"Các trường hợp nhận đổi trả"} type="title" />
            <ul className="custom-list-item flex flex-col gap-[8px] ml-[10px]">
              {dataCaseReturn.map((item, index) => (
                <SupportText key={index} content={item.content} type="step" />
              ))}
            </ul>

            <SupportText
              content={"Các trường hợp không áp dụng đổi trả"}
              type="title"
            />
            <ul className="custom-list-item flex flex-col gap-[8px] ml-[10px]">
              {dataNotCaseReturn.map((item, index) => (
                <SupportText key={index} content={item.content} type="step" />
              ))}
            </ul>

            <SupportText content={"Cách thức đổi trả"} type="title" />
            <ul className="custom-list-item flex flex-col gap-[8px] ml-[10px]">
              <SupportText
                content={`Missha nhận đổi trả sản phẩm cho khách hàng trong vòng 10 ngày, tính từ ngày nhận được sản phẩm.`}
                type="step"
              />
              <SupportText
                content={`Khách hàng cần thông báo cho nhân viên missha lý do đổi trả và cung cấp thông tin liên lạc chính xác để chúng tôi thực hiện quy trình đổi trả nhanh chóng.`}
                type="step"
              />

              <div>
                <p className="flex flex-col md:flex-row font-bold text-[#484848] text-[14px] md:text-[17px] my-2 text-nowrap">
                  Lưu ý: &nbsp;
                  <SupportText
                    content={`Khách hàng có nhu cầu đổi trả xin vui lòng nhắn tin qua mục Nhắn Tin tại trang web.`}
                    className="text-wrap"
                  />
                </p>
              </div>
              <SupportText
                content={`Missha quan tâm đến sự hài lòng của khách hàng và cam kết hỗ trợ đổi trả miễn phí theo quy định. Khách có thể chuyển hàng qua bưu điện và cung cấp mã bưu điện để missha xử lý và gửi hàng sớm nhất.`}
                type="step"
              />
            </ul>

            <SupportText
              content={"Phương thức hoàn tiền và phí xử lý"}
              type="title"
            />

            <SupportText content={`Trả hàng tại nhà`} className="font-[500]" />

            <ul className="custom-list-item flex flex-col gap-[8px] ml-[10px]">
              {dataReturnAtHome.map((item, index) => (
                <SupportText key={index} content={item.content} type="step" />
              ))}

              <p className="flex flex-col md:flex-row font-bold text-[#484848] text-[14px] md:text-[17px] my-2 text-nowrap">
                Lưu ý: &nbsp;
                <SupportText
                  content={`Tất cả các đơn hàng đã thanh toán có sử dụng gift card, missha hỗ trợ chuyển mã sử dụng cho đơn hàng tiếp theo.`}
                  className="text-wrap"
                />
              </p>
            </ul>
          </div>
        </div>
      </div>
    </div>
  );
};

export default PolicyReturn;
