import { useParams } from "react-router-dom";
import paths from "../utils/constants/paths";
import { Image, Input, Tooltip } from "antd";
import BreadcrumbComponent from "../components/Breadcrumb";
import images from "../assets/images";
import ButtonComponent from "../components/Button";
import { Swiper, SwiperClass, SwiperSlide } from "swiper/react";
import { FreeMode, Navigation, Thumbs } from "swiper/modules";
import { useState } from "react";
import svgs from "../assets/svgs";
import ProductComponent from "../components/Product";

const ProductDetail = () => {
  const { slug } = useParams<{ slug: string }>();
  const [thumbsSwiper, setThumbsSwiper] = useState<SwiperClass | null>(null);
  const itemBreadcrumbs = [
    {
      href: paths.HOME,
      title: "Trang chủ",
    },
    {
      href: paths.PRODUCTS,
      title: "Sản phẩm",
    },
    { href: `${paths.PRODUCTS}/${slug}`, title: slug || "" },
  ];

  return (
    <div className="bg-[#F7F7F7] mt-[10rem]">
      <div className="max-w-[120rem] mx-auto">
        <BreadcrumbComponent items={itemBreadcrumbs} />
      </div>

      <div className="bg-white flex justify-start items-start gap-[8rem] mb-[1.2rem] max-w-[120rem] mx-auto p-[2.4rem]">
        <div className="w-[45rem]">
          <Swiper
            loop={true}
            spaceBetween={10}
            navigation={true}
            thumbs={thumbsSwiper ? { swiper: thumbsSwiper } : undefined}
            modules={[FreeMode, Navigation, Thumbs]}
            className="mb-[24px]"
          >
            {Array.from({ length: 5 }).map((_, index) => (
              <SwiperSlide key={index} className="rounded-[2.4rem]">
                <Image
                  src={images.test_product}
                  alt="Silk Collagen Glow Ampoule 30ml"
                  className="w-full h-full aspect-square object-cover rounded-[2.4rem]"
                  height={450}
                  width={450}
                />
              </SwiperSlide>
            ))}
          </Swiper>
          <Swiper
            onSwiper={(swiper) => {
              if (swiper && swiper.params) {
                setThumbsSwiper(swiper);
              }
            }}
            spaceBetween={1}
            freeMode={true}
            watchSlidesProgress={true}
            modules={[FreeMode, Navigation, Thumbs]}
            className="mySwiper"
            slidesPerView={3.2}
          >
            {Array.from({ length: 5 }).map((_, index) => (
              <SwiperSlide key={index} className="rounded-[2.4rem]">
                <Image
                  key={index}
                  src={images.test_product}
                  alt="Silk Collagen Glow Ampoule 30ml thumbnail"
                  className="w-full h-full aspect-square object-cover rounded-[0.8rem]"
                  width={120}
                  preview={false}
                />
              </SwiperSlide>
            ))}
          </Swiper>
        </div>
        <div className="min-h-[50rem] w-ful flex flex-col justify-between items-stretch gap-[1.6rem] h-full]">
          <div className="flex flex-col justify-between items-start gap-[2.4rem]">
            <p className="text-[2.4rem] font-[500]">
              Ampoule dưỡng trắng, săn chắc da Silk Collagen Glow Ampoule 30ml |{" "}
              <span className="text-[1.4rem] text-[#757575]">
                <span className="text-[1.6rem] text-black font-[500]">33</span>{" "}
                Đã bán
              </span>
            </p>

            <div className="flex w-full justify-start items-center gap-[1.2rem] bg-[#fafafa] p-[1.5rem_2rem] rounded-md">
              <p className="text-[3.2rem] font-[500] text-[#ff9900]">
                544.000đ
              </p>
              <p className="text-[2rem] font-[400] text-[#ABABAB] line-through decoration-1">
                680.000đ
              </p>
              <div className="p-[0.1rem_0.4rem] bg-[#ff9900] rounded-md">
                <span className="text-[1.2rem] text-white">-20%</span>
              </div>
            </div>
            <div className="flex items-center gap-[1.2rem] *:text-[#757575] mt-[2.4rem]">
              <p className="text-[1.6rem] min-w-[20rem]">Chính sách đổi trả</p>
              <p className="text-[1.6rem]">Trả hàng 15 ngày Đổi ý miễn phí </p>
              <Tooltip
                className="bg-white text-black"
                title="Miễn phí Trả hàng trong 15 ngày nếu Đổi ý (hàng trả phải còn nguyên seal, tem, hộp sản phẩm), áp dụng cho một số sản phẩm nhất định. Ngoài ra, tại thời điểm nhận hàng, bạn có thể đồng kiểm và được trả hàng miễn phí. "
              >
                <div className="w-[2rem] h-[2rem]">
                  <img
                    src={svgs.questionCircle}
                    alt="question icon"
                    className="w-full h-full"
                  />
                </div>
              </Tooltip>
            </div>
            <div className="flex gap-[1.2rem] *:text-[#757575]">
              <p className="text-[1.6rem] min-w-[20rem]">Bảo hiểm</p>
              <p className="text-[1.6rem]">Bảo hiểm Mỹ phẩm</p>
            </div>
            <div className="flex flex-col gap-[1.2rem] *:text-[#757575]">
              <div className="flex gap-[1.2rem]">
                <p className="text-[1.6rem] min-w-[20rem]">Vận chuyển</p>
                <div className="flex flex-col gap-[1.2rem] *:text-[#757575]">
                  <p className="text-[1.6rem]">
                    Trương Văn Ngư, Linh Tây, Thủ Đức, Hồ Chí Minh
                  </p>
                  <p className="text-[1.6rem] min-w-[20rem]">
                    Phí vận chuyển:{" "}
                    <span className="text-[1.6rem] font-[500]">35.000 đ</span>
                  </p>
                </div>
              </div>
            </div>

            <div className="flex gap-[1.2rem] mt-[2.4rem]">
              <p className="text-[1.6rem] min-w-[20rem]">Số lượng</p>
              <div className="border">
                <div className="flex justify-start items-center">
                  <div className="w-[4rem] h-[4rem] cursor-pointer border-r hover:bg-[#f79900] p-[1rem]">
                    <img src={svgs.minus} className="w-full h-full" />
                  </div>
                  <Input
                    value={2}
                    className="w-[8rem] h-[4rem] text-center rounded-none border-none text-[1.6rem] font-[500]"
                  />
                  <div className="w-[4rem] h-[4rem] cursor-pointer border-l hover:bg-[#f79900] p-[1rem]">
                    <img src={svgs.plus} className="w-full h-full" />
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div className="flex justify-start items-center gap-[1.6rem] mt-[4.8rem]">
            <ButtonComponent
              type="text"
              text="Thêm vào giỏ hàng"
              className="border border-black"
              textClassName="text-[2rem] font-[500]"
            />
            <ButtonComponent
              type="primary"
              text="Mua ngay"
              textClassName="text-[2rem] font-[500] text-white"
            />
          </div>
        </div>
      </div>

      <div className="max-w-[120rem] mx-auto flex gap-[1.6rem] bg-[#F7F7F7]">
        <div className="w-full bg-white p-[3.2rem]">
          <div className="w-full bg-[#fafafa] p-[1.5rem_2rem] rounded-md">
            <p className="text-[1.8rem] font-[500] uppercase">Mô tả sản phẩm</p>
          </div>
          <div className="my-[2.4rem] text-[1.4rem] text-justify">
            1. Mô tả sản phẩm: +, Phong cách đơn giản và giản dị +, Dễ dàng đi
            học và đi du lịch, công suất lớn +, Trọng lượng nhẹ, tiện lợi +,
            Ngăn chính dung tích lớn: có thể chứa sách vở, laptop, điện thoại,
            ví, ... *Chi tiết sản phẩm: Kích thước: 30cm * 44cm * 15cm (Phù hợp
            với laptop 15,6 inch) Sử dụng: thời trang / giải trí / kinh doanh
            Sức chứa: Laptop 15,6 inch, v.v. Chất liệu: vải Oxford, Lót
            polyester Cấu trúc: túi chính, túi trước, v.v. 2. CHÍNH SÁCH BẢO
            HÀNH: Bảo hành 12 THÁNG khi sử dụng khi: - Lỗi kỹ thuật của nhà sản
            xuất như dây kéo, đường chỉ, móc khóa...trong thời gian sử dụng hoàn
            toàn miễn phí và sẽ bảo hành nhanh nhất có thể *LƯU Ý : Với những
            lỗi do tác động ngoại lực làm sản phẩm bị rách đứt hoặc ảnh hưởng
            của nhiệt độ cao sẽ không được bảo hành.
          </div>
          <div className="my-[2.4rem] text-[1.4rem] text-justify">
            1. Mô tả sản phẩm: +, Phong cách đơn giản và giản dị +, Dễ dàng đi
            học và đi du lịch, công suất lớn +, Trọng lượng nhẹ, tiện lợi +,
            Ngăn chính dung tích lớn: có thể chứa sách vở, laptop, điện thoại,
            ví, ... *Chi tiết sản phẩm: Kích thước: 30cm * 44cm * 15cm (Phù hợp
            với laptop 15,6 inch) Sử dụng: thời trang / giải trí / kinh doanh
            Sức chứa: Laptop 15,6 inch, v.v. Chất liệu: vải Oxford, Lót
            polyester Cấu trúc: túi chính, túi trước, v.v. 2. CHÍNH SÁCH BẢO
            HÀNH: Bảo hành 12 THÁNG khi sử dụng khi: - Lỗi kỹ thuật của nhà sản
            xuất như dây kéo, đường chỉ, móc khóa...trong thời gian sử dụng hoàn
            toàn miễn phí và sẽ bảo hành nhanh nhất có thể *LƯU Ý : Với những
            lỗi do tác động ngoại lực làm sản phẩm bị rách đứt hoặc ảnh hưởng
            của nhiệt độ cao sẽ không được bảo hành.
          </div>
          <div className="my-[2.4rem] text-[1.4rem] text-justify">
            1. Mô tả sản phẩm: +, Phong cách đơn giản và giản dị +, Dễ dàng đi
            học và đi du lịch, công suất lớn +, Trọng lượng nhẹ, tiện lợi +,
            Ngăn chính dung tích lớn: có thể chứa sách vở, laptop, điện thoại,
            ví, ... *Chi tiết sản phẩm: Kích thước: 30cm * 44cm * 15cm (Phù hợp
            với laptop 15,6 inch) Sử dụng: thời trang / giải trí / kinh doanh
            Sức chứa: Laptop 15,6 inch, v.v. Chất liệu: vải Oxford, Lót
            polyester Cấu trúc: túi chính, túi trước, v.v. 2. CHÍNH SÁCH BẢO
            HÀNH: Bảo hành 12 THÁNG khi sử dụng khi: - Lỗi kỹ thuật của nhà sản
            xuất như dây kéo, đường chỉ, móc khóa...trong thời gian sử dụng hoàn
            toàn miễn phí và sẽ bảo hành nhanh nhất có thể *LƯU Ý : Với những
            lỗi do tác động ngoại lực làm sản phẩm bị rách đứt hoặc ảnh hưởng
            của nhiệt độ cao sẽ không được bảo hành.
          </div>
        </div>

        <div className="w-[40rem] bg-white p-[3.2rem]">
          <div className="w-full bg-[#fafafa] p-[1.5rem_2rem] rounded-md">
            <p className="text-[1.8rem] font-[500] uppercase">
              Sản phẩm bán chạy
            </p>
          </div>
          <div className="flex flex-col justify-center items-center gap-[3.2rem] mt-[2rem]">
            {Array.from({
              length: 3,
            }).map((_, index) => (
              <ProductComponent key={index} page="product" />
            ))}
          </div>
        </div>
      </div>
      <div className="h-[1.2rem] w-full bg-[#F7F7F7]"></div>
    </div>
  );
};

export default ProductDetail;
