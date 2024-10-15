import { Link } from "react-router-dom";
import images from "../../assets/images";
import CartCustom from "../../assets/svgs/Custom/CartCustom";

interface IProductComponentProps {
  page?: "product" | "cart";
}
const ProductComponent = (props: IProductComponentProps) => {
  const { page } = props;

  if (page === "cart")
    return (
      <div className="flex justify-start items-start gap-[1.2rem]">
        <div className="w-[12rem] h-[12rem] min-w-[12rem] rounded-[0.2rem] cursor-pointer">
          <img
            src={images.cate_1}
            className="w-full h-full object-cover rounded-[0.6rem] cursor-pointer"
          />
        </div>
        <div className="h-full flex flex-col justify-between items-start">
          <p className="text-[1.4rem] text-[#818080] font-[500] text-wrap line-clamp-2">
            Ampoule dưỡng trắng, săn chắc da Silk Collagen Glow Ampoule 30ml
          </p>
          <div className="flex justify-start items-center gap-[0.8rem]">
            <span className="text-[1.6rem] font-[600] text-wrap text-[500] text-[#FF9800">
              800.000đ
            </span>
            <span className="text-[1.2rem] text-red-600 font-[500] text-wrap line-through">
              1.000.000đ
            </span>
          </div>
        </div>
      </div>
    );
  if (page === "product")
    return (
      <div className="w-[16rem] relative h-fit flex flex-col gap-[0.8rem] group">
        <div className="w-[16rem] h-[16rem] rounded-[1.6rem] border-[0.4rem] border-solid border-[#FF9800] cursor-pointer">
          <img
            src={images.cate_1}
            className="w-full h-full object-cover rounded-[1.2rem] cursor-pointer"
          />
        </div>
        {/* <div className="absolute right-[0.5rem] bottom-[45%] w-[6rem] h-[6rem] rounded-[1.6rem] group-hover:bg-[#00000019]">
        <div className="bg-[rgba(0,0,0,0.5)] rounded-full p-[1rem]  cursor-pointer">
          <CartCustom className="w-full h-full" color="white" />
        </div>
      </div> */}
        <div className="absolute top-[1.5rem] left-[0.3rem] bg-white w-[4rem] h-[3rem] flex flex-col justify-center items-center">
          <p className="text-[1.4rem]">-20%</p>
        </div>
        <Link to="#">
          <div className="flex flex-col jus items-centertify-between items-start gap-[0.4rem]">
            <p className="text-[1.4rem] text-[#818080] font-[500] text-wrap line-clamp-2">
              Ampoule dưỡng trắng, săn chắc da Silk Collagen Glow Ampoule 30ml
            </p>
            <div className="flex justify-start items-center gap-[1.2rem]">
              <span className="text-[1.6rem] font-[600] text-wrap text-[500] text-[#FF9800">
                800.000đ
              </span>
              <span className="text-[1.2rem] text-red-600 font-[500] text-wrap line-through">
                1.000.000đ
              </span>
            </div>
          </div>
        </Link>
        <button className="group/button border border-solid rounded-[0.4rem] border-black p-[0.4rem_1.2rem] text-[1.4rem] flex justify-between items-center hover:bg-[#FF9800] hover:text-white hover:border-[#FF9800]">
          Thêm vào giỏ
          <div className="w-[3rem] h-[3rem] ">
            <CartCustom className="w-full h-full group-hover/button:animate-bounce" />
          </div>
        </button>
      </div>
    );
  return null;
};

export default ProductComponent;
