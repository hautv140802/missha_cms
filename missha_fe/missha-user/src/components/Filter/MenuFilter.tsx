import { useState } from "react";
import svgs from "../../assets/svgs";
import { Checkbox, Divider, Drawer } from "antd";
import PriceFilterComponent from "./PriceFilter";
import FooterFilter from "./FooterFilter";
import { useQueryProductLines } from "../../hooks/queries/productLines.query";
import { useQuerySkinProperties } from "../../hooks/queries/skinProperties.query";

interface IMenuFilterComponentProps {
  handleApply: () => void;
  countFilterProduct: number;
  handleCancelApply: () => void;
  setFilterParams: (
    _filterParams: Record<string, string[] | string | undefined>
  ) => void;
  searchParams: URLSearchParams;
  filterParams: Record<string, string[] | string | undefined>;
}
const MenuFilterComponent = (props: IMenuFilterComponentProps) => {
  const {
    handleApply,
    countFilterProduct,
    handleCancelApply,
    setFilterParams,
    searchParams,
    filterParams,
  } = props;
  const [openMenuFilter, setOpenMenuFilter] = useState(false);

  const { data: dataProductLines } = useQueryProductLines({
    "sort[0]": "id:desc",
    populate: "deep, 1",
    "fields[0]": "name",
    "fields[1]": "slug",
  });

  const { data: dataSkinProperties } = useQuerySkinProperties({
    "sort[0]": "id:desc",
    populate: "deep, 1",
    "fields[0]": "name",
    "fields[1]": "slug",
  });

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
        footer={
          <FooterFilter
            handleApply={handleApply}
            countFilterProduct={countFilterProduct}
            handleCancel={handleCancelApply}
          />
        }
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
            <Checkbox.Group
              className="flex flex-col justify-start items-start gap-[0.8rem]"
              value={searchParams.getAll("skin_properties") || []}
              onChange={(values: string[]) => {
                setFilterParams({
                  ...filterParams,
                  skin_properties: values,
                });
              }}
            >
              {dataSkinProperties.map((item, index) => (
                <Checkbox
                  key={index}
                  value={item?.attributes?.slug}
                  className="text-[1.6rem] font-[400]"
                >
                  {item?.attributes?.name}
                </Checkbox>
              ))}
            </Checkbox.Group>
          </div>
          <Divider />
          <div>
            <div className="text-[1.6rem] font-[600] m-[0.4rem] pb-[0.8rem]">
              Dòng sản phẩm
            </div>
            <Checkbox.Group
              className="flex flex-col justify-start items-start gap-[0.8rem]"
              value={searchParams.getAll("product_lines")}
              onChange={(values: string[]) => {
                setFilterParams({
                  ...filterParams,
                  product_lines: values,
                });
              }}
            >
              {dataProductLines.map((item, index) => (
                <Checkbox
                  key={index}
                  value={item?.attributes?.slug}
                  className="text-[1.6rem] font-[400]"
                >
                  {item?.attributes?.name}
                </Checkbox>
              ))}
            </Checkbox.Group>
          </div>
          <Divider />
          <PriceFilterComponent
            onchangeValues={(values) => {
              setFilterParams({
                ...filterParams,
                min_price: values?.[0],
                max_price: values?.[1],
              });
            }}
          />
        </div>
      </Drawer>
    </div>
  );
};

export default MenuFilterComponent;
