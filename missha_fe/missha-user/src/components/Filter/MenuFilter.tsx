import { useState } from "react";
import svgs from "../../assets/svgs";
import { Checkbox, Divider, Drawer } from "antd";
import PriceFilterComponent from "./PriceFilter";

const dataFilter = [
  { value: 1, label: "Filter 1" },
  { value: 2, label: "Filter 2" },
  { value: 3, label: "Filter 3" },
  { value: 4, label: "Filter 4" },
  { value: 5, label: "Filter 5" },
];
const MenuFilterComponent = () => {
  const [openMenuFilter, setOpenMenuFilter] = useState(false);
  return (
    <div className="flex justify-start items-center gap-[0.8rem]">
      <div
        className="w-[3.2rem] h-[3.2rem] cursor-pointer"
        onClick={() => setOpenMenuFilter(!openMenuFilter)}
      >
        <img src={svgs.filter} className="w-full h-full" />
      </div>
      <span className="text-[1.6rem] font-[500]">Bộ lọc</span>
      <Drawer
        title={
          <div className="flex justify-between items-center">
            <p>Bộ lộc</p>
            <div className="w-[2rem] h-[2rem]">
              <img src={svgs.arrowLeft} alt="arrow-left" />
            </div>
          </div>
        }
        closable={false}
        open={openMenuFilter}
        onClose={() => setOpenMenuFilter(false)}
        placement="left"
        footer={
          <div className="flex justify-between items-center p-[1.2rem_2rem]">
            <button>Hủy</button>
            <button>Xem kết quả</button>
          </div>
        }
      >
        <div className="flex flex-col">
          <div>
            <div>Đặc tính da</div>
            <Checkbox.Group className="flex flex-col justify-start items-start gap-[0.8rem]">
              {dataFilter.map((item, index) => (
                <Checkbox key={index} value={item.value}>
                  {item.label}
                </Checkbox>
              ))}
            </Checkbox.Group>
          </div>
          <Divider />
          <div>
            <div>Dòng sản phẩm</div>
            <Checkbox.Group className="flex flex-col justify-start items-start gap-[0.8rem]">
              {dataFilter.map((item, index) => (
                <Checkbox key={index} value={item.value}>
                  {item.label}
                </Checkbox>
              ))}
            </Checkbox.Group>
          </div>
          <Divider />
          <PriceFilterComponent />
        </div>
      </Drawer>
    </div>
  );
};

export default MenuFilterComponent;
