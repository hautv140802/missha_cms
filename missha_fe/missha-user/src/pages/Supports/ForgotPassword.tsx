import { Breadcrumb } from "antd";
import paths from "../../utils/constants/paths";
import SupportText from "../../components/Support/SupportText";
import React from "react";

const ForgotPassword = () => {
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
      title: "Lấy lại mật khẩu",
    },
  ];

  const dataResetPasswordGuide = [
    {
      content: "Bước 1: Nhập Email hoặc số điện thoại đăng ký và gửi OTP",
      Children: [
        {
          content: "Truy cập trang web lấy lại mật khẩu của tài khoản bạn cần.",
        },
        {
          content:
            "Nhập chính xác email hoặc số điện thoại đã liên kết với tài khoản.",
        },
        {
          content: `Nhấp vào nút "Gửi OTP" để hệ thống gửi mã xác minh đến số điện thoại hoặc email đã cung cấp.`,
        },
      ],
    },
    {
      content: "Bước 2: Xác nhận OTP",
      Children: [
        {
          content: "Kiểm tra điện thoại hoặc email của bạn để nhận OTP.",
        },
        {
          content:
            "Nhập chính xác mã OTP nhận được vào ô tương ứng trên trang web.",
        },
        {
          content: `Nhấp vào nút "Xác Nhận" để tiếp tục quá trình lấy lại mật khẩu.`,
        },
      ],
    },
    {
      content: "Bước 3: Đặt lại mật khẩu mới",
      Children: [
        {
          content: "Nhập mật khẩu mới mà bạn muốn sử dụng.",
        },
        {
          content: "Xác nhận lại mật khẩu mới một lần nữa.",
        },
        {
          content: `Nhấp vào nút "Đặt lại mật khẩu" để hoàn tất quy trình.`,
        },
      ],
    },
  ];

  const dataNote = [
    {
      content: `Nên chọn mật khẩu mới có độ dài tối thiểu 6 ký tự, bao gồm cả chữ hoa, chữ thường, 
        số và ký tự đặc biệt để tăng cường bảo mật.`,
    },
    {
      content: "Tránh sử dụng cùng một mật khẩu cho nhiều tài khoản khác nhau.",
    },
    {
      content:
        "Nên thay đổi mật khẩu định kỳ để đảm bảo an toàn cho tài khoản của bạn.",
    },
  ];

  const dataSummary = [
    {
      content: `Như vậy, chỉ cần thực hiện theo hướng dẫn trên, bạn đã dễ dàng đặt
                lại mật khẩu tài khoản Missha. Nếu bạn có bất kỳ thắc mắc nào
                về tài khoản, hãy liên hệ với Missha để được hỗ trợ.`,
    },
    {
      content: `Missha mang đến cho bạn các sản phẩm chăm sóc sức khỏe và sắc
              đẹp chất lượng cao, được chiết xuất từ thiên nhiên, an toàn cho
              sức khỏe. Bên cạnh đó, Missha còn cung cấp dịch vụ khách hàng
              chuyên nghiệp, tận tâm, luôn sẵn sàng hỗ trợ bạn mọi lúc mọi nơi.`,
    },
  ];

  return (
    <div className="w-[140rem] mx-auto items-center mt-[6.8rem] bg-background min-h-[calc(100vh-20rem)]">
      <Breadcrumb items={breadcrumbItems} />

      <div className="wrapper my-[48px] max-w-[140rem] md:mx-auto">
        <div className="w-full">
          <SupportText
            type="header"
            content="Hướng dẫn lấy lại mật khẩu"
            className="!text-[#000000] mb-[24px]"
          />
          <div className="support-content mx-4 lg:mx-0">
            <SupportText
              content=" Bạn đã quên mật khẩu tài khoản mua sắm tại Missha khiến việc
              truy cập trở nên khó khăn? Đừng lo lắng, với hướng dẫn chi tiết
              dưới đây, bạn có thể dễ dàng đặt lại mật khẩu chỉ trong vài thao
              tác."
            />

            <SupportText content="Hướng dẫn đặt lại mật khẩu" type="title" />

            <ul>
              {dataResetPasswordGuide.map((item, index) => (
                <React.Fragment key={index}>
                  <SupportText
                    type="title"
                    content={item.content}
                    className="md:text-[14px] font-[500]"
                  />
                  <ul className="custom-list-item flex flex-col gap-[8px] ml-[10px]">
                    {item.Children.map((childrenItem, indexItem) => (
                      <SupportText
                        type="step"
                        content={childrenItem.content}
                        key={indexItem}
                      />
                    ))}
                  </ul>
                </React.Fragment>
              ))}
            </ul>

            <p className="font-bold text-[#484848] text-[14px] md:text-[17px] my-6">
              Lưu ý:
            </p>
            <ul className="custom-list-item flex flex-col gap-[8px] ml-[10px]">
              {dataNote.map((item, index) => (
                <SupportText key={index} content={item.content} type="step" />
              ))}
            </ul>

            <div className="flex flex-col gap-[8px] mt-[24px]">
              {dataSummary.map((item, index) => (
                <SupportText key={index} content={item.content} />
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ForgotPassword;
