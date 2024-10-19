import images from "../../../../assets/images";

const OrderItem = () => {
  return (
    <div className="flex justify-start items-center gap-[1.2rem]">
      <div className="min-w-[8.2rem] w-[8.2rem] min-h-[8.2rem] h-[8.2rem] border">
        <img src={images.product} className="w-full h-full object-cover" />
      </div>
      <div className="w-full flex flex-col justify-between items-start h-[8.2rem]">
        <div className="w-full flex flex-col gap-[0.8rem]">
          <p className="text-[1.6rem] leading-[2.2rem] text-[rgba(0,0,0,0.87)] max-w-[30rem] line-clamp-1">
            Bộ Chăn Gối Văn Phòng 3 trong 1 Fhome
          </p>
          <div className="flex justify-between items-end">
            <span className="text-[1.4rem] text-black">x1</span>
          </div>
        </div>
        <div className="border border-solid border-[#26AA96] p-[0.2rem_0.4rem]">
          <p className="text-[#26AA96] text-[1.2rem]">
            Trả hàng miễn phí 15 ngày
          </p>
        </div>
      </div>

      <div className="w-full flex flex-col justify-center items-end ">
        <span className="text-[1.6rem] text-[#ff9900]">450.000 đ</span>
        <span className="text-[1.4rem] text-[rgba(0,0,0,0.54)] line-through ml-[1.2rem]">
          450.000 đ
        </span>
      </div>
    </div>
  );
};

export default OrderItem;
