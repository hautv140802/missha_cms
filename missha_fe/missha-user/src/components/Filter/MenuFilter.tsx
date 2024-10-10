import { useState } from "react";
import svgs from "../../assets/svgs";
import { Checkbox, Divider, Drawer } from "antd";
import PriceFilterComponent from "./PriceFilter";
import FooterFilter from "./FooterFilter";

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
            <div
              className="w-[4rem] h-[4rem] p-[1rem] cursor-pointer hover:bg-[rgba(0,0,0,0.3)] hover:rounded-full"
              onClick={() => setOpenMenuFilter(false)}
            >
              <img
                src={svgs.arrowLeft}
                alt="arrow-left"
                className="w-full h-full"
              />
            </div>
          </div>
        }
        closable={false}
        open={openMenuFilter}
        onClose={() => setOpenMenuFilter(false)}
        placement="left"
        footer={<FooterFilter />}
        styles={{
          footer: {
            backgroundColor: "#F7F7F7",
          },
        }}
      >
        <div className="flex flex-col">
          <div>
            <div className="text-[1.6rem] font-[600] m-[0.4rem] pb-[0.8rem]">
              Đặc tính da
            </div>
            <Checkbox.Group className="flex flex-col justify-start items-start gap-[0.8rem]">
              {dataFilter.map((item, index) => (
                <Checkbox
                  key={index}
                  value={item.value}
                  className="text-[1.6rem] font-[400]"
                >
                  {item.label}
                </Checkbox>
              ))}
            </Checkbox.Group>
          </div>
          <Divider />
          <div>
            <div className="text-[1.6rem] font-[600] m-[0.4rem] pb-[0.8rem]">
              Dòng sản phẩm
            </div>
            <Checkbox.Group className="flex flex-col justify-start items-start gap-[0.8rem]">
              {dataFilter.map((item, index) => (
                <Checkbox
                  key={index}
                  value={item.value}
                  className="text-[1.6rem] font-[400]"
                >
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
