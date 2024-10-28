import dayjs from "dayjs";

const formValidation = {
  firstName: { required: "Tên không được để trống" },
  lastName: { required: "Họ không được để trống" },
  fullName: { required: "Họ và tên không được để trống" },
  phone: {
    required: "SĐT không được để trống",
    pattern: {
      value: /(84|0)+([0-9]{9})\b/g,
      message: "Số điện thoại không hợp lệ",
    },
  },
  email: {
    required: "Email không được để trống",
    pattern: {
      value: /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/,
      message: "Email không hợp lệ",
    },
  },
  birthday: {
    required: "Ngày sinh không được để trống",
    // pattern: {
    //   value: /^(0[1-9]|[1-2][0-9]|3[0-1])\/(0[1-9]|1[0-2])\/\d{4}$/,
    //   message: "Ngày sinh không hợp lệ",
    // },
  },
  city: { required: "Tỉnh/Thành phố không được để trống" },
  district: { required: "Quận/huyện không được để trống" },
  ward: { required: "Phường/xã không được để trống" },
  password: {
    required: "Mật khẩu không được để trống",
    minLength: {
      value: 6,
      message: "Độ dài mật khẩu tối thiểu là 6 ký tự",
    },
    maxLength: {
      value: 20,
      message: "Độ dài mật khẩu tối đa là 20 ky tự",
    },
  },
  passwordConfirm: (password: string) => ({
    required: "Xác nhận mật khẩu không được để trống",
    validate: (value: string) => value === password || "Mật khẩu không khớp",
    maxLength: {
      value: 20,
      message: "Độ dài mật khẩu tối đa là 20 ky tự",
    },
    minLength: {
      value: 6,
      message: "Độ dài mật khẩu tối thiểu là 6 ký tự",
    },
  }),
  nameProduct: { required: "Tên sản phẩm không được để trống" },
  price: { required: "Giá không được để trống" },
  address: { required: "Địa chỉ không được để trống" },
  total: { required: "Tổng tiền không được để trống" },
  full_name: { required: "Họ và tên không được để trống" },
  gender: { required: "Giới tính không được để trống" },
  identifier: { required: "Tài khoản không được để trống" },
  date_booking: {
    required: "Ngày đặt không được để trống",
    validate: (date_booking: string) => {
      const targetDate = dayjs(date_booking);

      const currentDate = dayjs();

      const differenceInDays = targetDate.diff(currentDate, "day");

      if (differenceInDays < 3) {
        return "Ngày đặt phải trước 3 ngày";
      }
    },
  },
  service: { required: "Dịch vụ không được để trống" },
};

export default formValidation;
