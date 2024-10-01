import { Link } from "react-router-dom";
import images from "../../assets/images";
import svgs from "../../assets/svgs";
import CartCustom from "../../assets/svgs/Custom/CartCustom";

const ProductComponent = () => {
  return (
    <div className="w-[16rem] relative h-fit flex flex-col gap-[0.8rem] group">
      <div className="w-[16rem] h-[16rem] rounded-[1.6rem] border-[0.4rem] border-solid border-[#3F0] cursor-pointer">
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
            <span className="text-[1.6rem] font-[600] text-wrap text-[500] text-[#33ff00]">
              800.000đ
            </span>
            <span className="text-[1.2rem] text-red-600 font-[500] text-wrap line-through">
              1.000.000đ
            </span>
          </div>
        </div>
      </Link>
      <button className="group/button border border-solid rounded-[0.4rem] border-black p-[0.4rem_1.2rem] text-[1.4rem] flex justify-between items-center hover:bg-[#33ff00] hover:text-white hover:border-[#33ff00]">
        Thêm vào giỏ
        <div className="w-[3rem] h-[3rem] ">
          <CartCustom className="w-full h-full group-hover/button:animate-bounce" />
        </div>
      </button>
    </div>
  );
};

export default ProductComponent;
