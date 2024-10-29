import dayjs from 'dayjs';

const formValidation = {
  firstName: { required: 'Tên không được để trống' },
  lastName: { required: 'Họ không được để trống' },
  fullName: { required: 'Họ và tên không được để trống' },
  phone: {
    required: 'SĐT không được để trống',
    pattern: {
      value: /(84|0)+([0-9]{9})\b/g,
      message: 'Số điện thoại không hợp lệ',
    },
  },
  email: {
    required: 'Email không được để trống',
    pattern: {
      value: /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/,
      message: 'Email không hợp lệ',
    },
  },
  birthday: {
    required: 'Ngày sinh không được để trống',
    pattern: {
      value: /^(0[1-9]|[1-2][0-9]|3[0-1])\/(0[1-9]|1[0-2])\/\d{4}$/,
      message: 'Ngày sinh không hợp lệ',
    },
  },
  city: { required: 'Tỉnh/Thành phố không được để trống' },
  district: { required: 'Quận/huyện không được để trống' },
  ward: { required: 'Phường/xã không được để trống' },
  password: {
    required: 'Mật khẩu không được để trống',
    minLength: {
      value: 6,
      message: 'Độ dài mật khẩu tối thiểu là 6 ký tự',
    },
    maxLength: {
      value: 20,
      message: 'Độ dài mật khẩu tối đa là 20 ky tự',
    },
  },
  passwordConfirm: (password: string) => ({
    required: 'Xác nhận mật khẩu không được để trống',
    validate: (value: string) => value === password || 'Mật khẩu không khớp',
    maxLength: {
      value: 20,
      message: 'Độ dài mật khẩu tối đa là 20 ky tự',
    },
    minLength: {
      value: 6,
      message: 'Độ dài mật khẩu tối thiểu là 6 ký tự',
    },
  }),
  nameProduct: { required: 'Tên sản phẩm không được để trống' },
  price: { required: 'Giá không được để trống' },
  height: { required: 'Chiều cao không được để trống' },
  address: { required: 'Địa chỉ không được để trống' },
  total: { required: 'Tổng tiền không được để trống' },
  full_name: { required: 'Họ và tên không được để trống' },
  code_voucher: { required: 'Mã voucher không được để trống' },
  amount_decrease: { required: 'Số tiền giảm không được để trống' },
  percent_decrease: { required: 'Phần trăm giảm không được để trống' },
  stock: { required: 'Số lượng voucher không được để trống' },
  expiry_date: { required: 'Ngày hết hạn không được để trống' },
  category_name: { required: 'Tên danh mục không được để trống' },
  reel_name: { required: 'Tên Reels không được để trống' },
  video: { required: 'Video không được để trống' },
  username: { required: 'Tên đăng nhập không được để trống' },
  colorCode: { required: 'Mã màu không được để trống' },
  colorName: { required: 'Tên màu không được để trống' },
  parentProduct: { required: 'Sản phẩm chính không được để trống' },
  size: { required: 'Kích cỡ giày không được để trống' },
  quantity: { required: 'Số lượng không được để trống' },
  product_line: { required: 'Tên dòng sản phẩm không được để trống' },
  skin_property: { required: 'Đặc tính của da không được để trống' },
  product_name: { required: 'Tên sản phẩm không được để trống' },
  product_categories: { required: 'Danh mục sản phẩm khôngs được để trống' },
  product_skin_properties: {
    required: 'Đặc tính da sản phẩm không được để trống',
  },
  product_product_line: {
    required: 'Dòng sản phẩm không được để trống',
  },

  role: {
    required: 'Role không được để trống',
  },
  dateBooking: {
    required: 'Ngày booking không được để trống',
  },
  service: {
    required: 'Dịch vụ không được để trống',
  },
  status: {
    required: 'Trạng thái không được để trống',
  },
  date_booking: {
    required: 'Ngày đặt không được để trống',
    // validate: (date_booking: string) => {
    //   const targetDate = dayjs(date_booking);

    //   const currentDate = dayjs();

    //   const differenceInDays = targetDate.diff(currentDate, 'day');

    //   if (differenceInDays < 3) {
    //     return 'Ngày đặt phải trước 3 ngày';
    //   }
    // },
  },
  title: {
    required: 'Tiêu đề không được để trống',
  },
  name_service: {
    required: 'Tên dịch vụ không được để trống',
  },
  user: {
    required: 'Khách hàng không được để trống',
  },
  voucher: {
    required: 'Voucher không được để trống',
  },
};

export default formValidation;
