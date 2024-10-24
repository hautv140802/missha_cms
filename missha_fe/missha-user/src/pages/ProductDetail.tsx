import { useNavigate, useParams } from "react-router-dom";
import paths from "../utils/constants/paths";
import { Image, Input, Tooltip } from "antd";
import BreadcrumbComponent from "../components/Breadcrumb";
import ButtonComponent from "../components/Button";
import { Swiper, SwiperClass, SwiperSlide } from "swiper/react";
import { FreeMode, Navigation, Thumbs } from "swiper/modules";
import { useState } from "react";
import svgs from "../assets/svgs";
import ProductComponent from "../components/Product";
import { useQueryProductBySlug } from "../hooks/queries/productBySlug.query";
import formatUrl from "../utils/functions/formatUrl";
import { formatPrice } from "../utils/functions/formatPrice";
import "react-quill/dist/quill.snow.css";
import { useQueryProducts } from "../hooks/queries/products.query";
import { addToCart } from "../utils/functions/addToCart";
import toast from "react-hot-toast";
const ProductDetail = () => {
  const { slug } = useParams<{ slug: string }>();

  const navigate = useNavigate();
  const { data: dataProduct } = useQueryProductBySlug(slug);
  const { data: dataProductBestSale } = useQueryProducts({
    populate: "deep, 3",
    sort: "total_purchase:desc",
  });
  const [thumbsSwiper, setThumbsSwiper] = useState<SwiperClass | null>(null);
  const [showAll, setShowAll] = useState(false);
  const [quantity, setQuantity] = useState<number>(1);
  const itemBreadcrumbs = [
    {
      href: paths.HOME,
      title: "Trang chủ",
    },
    {
      href: paths.PRODUCTS,

      title: "Sản phẩm",
    },
    {
      href: `${paths.PRODUCTS}/${slug}`,
      title: dataProduct?.attributes?.name || "",
    },
  ];

  const isSale =
    Number(dataProduct?.attributes?.sale_price) > 0 &&
    Number(dataProduct?.attributes?.sale_price) <
      Number(dataProduct?.attributes?.price);

  const percentDiscount =
    ((Number(dataProduct?.attributes?.price) -
      Number(dataProduct?.attributes?.sale_price)) *
      100) /
    Number(dataProduct?.attributes?.price);

  const handleDecrease = () => {
    if (quantity > 1) {
      setQuantity((prev) => prev - 1);
    }
  };
  const handleIncrease = () => {
    // if (quantity < dataProduct?.attributes?.) {
    setQuantity((prev) => prev + 1);
    // }
  };

  const handleAddToCart = () => {
    if (!dataProduct?.id) {
      toast.error("Không tồn tại sản phẩm");
    }
    addToCart({
      id: dataProduct?.id || -1,
      name: dataProduct?.attributes?.name || "",
      avatar:
        formatUrl(dataProduct?.attributes?.avatar?.data?.attributes?.url) || "",
      price: dataProduct?.attributes?.price || 0,
      sale_price: dataProduct?.attributes?.sale_price || 0,
      quantity: quantity,
      slug: dataProduct?.attributes?.slug || "",
    });
    toast.success("Thêm vào giỏ hàng thành công!");
    setQuantity(1);
  };

  const handleBuyNow = () => {
    handleAddToCart();
    navigate(paths.CART);
  };
  return (
    <div className="bg-background mt-[10rem]">
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
            {dataProduct?.attributes?.gallery?.data?.map((item, index) => (
              <SwiperSlide key={index} className="rounded-[2.4rem]">
                <Image
                  src={formatUrl(item?.attributes?.url)}
                  alt={item?.attributes?.name || ""}
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
            className="mySwiper bg-background py-[1.2rem] px-[0.4rem]"
            slidesPerView={3.2}
          >
            {dataProduct?.attributes?.gallery?.data?.map((item, index) => (
              <SwiperSlide key={index} className="rounded-[2.4rem]">
                <Image
                  key={index}
                  src={formatUrl(item?.attributes?.url)}
                  alt={item?.attributes?.name || ""}
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
              {dataProduct?.attributes?.name} |{" "}
              <span className="text-[1.4rem] text-[#757575]">
                <span className="text-[1.6rem] text-black font-[500]">
                  {dataProduct?.attributes?.total_purchase}
                </span>{" "}
                Đã bán
              </span>
            </p>

            <div className="flex w-full justify-start items-center gap-[1.2rem] bg-background p-[1.5rem_2rem] rounded-md">
              <p className="text-[3.2rem] font-[500] text-[#ff9900]">
                {formatPrice(
                  isSale
                    ? Number(dataProduct?.attributes?.sale_price)
                    : Number(dataProduct?.attributes?.price)
                )}
              </p>
              {isSale && (
                <>
                  <p className="text-[2rem] font-[400] text-[#ABABAB] line-through decoration-1">
                    {formatPrice(Number(dataProduct?.attributes?.price))}
                  </p>
                  <div className="p-[0.1rem_0.4rem] bg-[#ff9900] rounded-md">
                    <span className="text-[1.2rem] text-white">
                      {Number(percentDiscount.toFixed(2))} %
                    </span>
                  </div>
                </>
              )}
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
                  <div
                    className="w-[4rem] h-[4rem] cursor-pointer border-r hover:bg-[#f79900] p-[1rem]"
                    onClick={handleDecrease}
                  >
                    <img src={svgs.minus} className="w-full h-full" />
                  </div>
                  <Input
                    value={quantity}
                    className="w-[8rem] h-[4rem] text-center rounded-none border-none text-[1.6rem] font-[500]"
                  />
                  <div
                    className="w-[4rem] h-[4rem] cursor-pointer border-l hover:bg-[#f79900] p-[1rem]"
                    onClick={handleIncrease}
                  >
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
              onClick={handleAddToCart}
            />
            <ButtonComponent
              type="primary"
              text="Mua ngay"
              textClassName="text-[2rem] font-[500] text-white"
              onClick={handleBuyNow}
            />
          </div>
        </div>
      </div>

      <div className="max-w-[120rem] mx-auto flex gap-[1.6rem] bg-background">
        <div className="w-full bg-white p-[3.2rem] ">
          <div className="w-full bg-background p-[1.5rem_2rem] rounded-md">
            <p className="text-[1.8rem] font-[500] uppercase">Mô tả sản phẩm</p>
          </div>
          {dataProduct?.attributes?.descripton && (
            <div className="overflow-y-auto max-h-[120rem]">
              <div
                className="ql-editor my-[2.4rem] text-[1.4rem] text-justify"
                dangerouslySetInnerHTML={{
                  __html: showAll
                    ? dataProduct?.attributes?.descripton || ""
                    : dataProduct?.attributes?.descripton?.slice(0, 800) || "",
                }}
              />
              <div className="flex justify-center items-center">
                <span
                  className="text-[1.4rem] cursor-pointer underline"
                  onClick={() => setShowAll(!showAll)}
                >
                  {showAll ? "Thu gọn" : "Xem thêm"}
                </span>
              </div>
            </div>
          )}
        </div>

        <div className="w-[40rem] bg-white p-[3.2rem]">
          <div className="w-full bg-background p-[1.5rem_2rem] rounded-md">
            <p className="text-[1.8rem] font-[500] uppercase">
              Sản phẩm bán chạy
            </p>
          </div>
          <div className="flex flex-col justify-center items-center gap-[3.2rem] mt-[2rem]">
            {dataProductBestSale?.slice(0, 3)?.map((item, index) => (
              <ProductComponent key={index} page="product" product={item} />
            ))}
          </div>
        </div>
      </div>
      <div className="h-[1.2rem] w-full bg-[#F7F7F7]"></div>
    </div>
  );
};

export default ProductDetail;
