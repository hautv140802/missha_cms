import { Popover } from "antd";
import { useQueryProducts } from "../../hooks/queries/products.query";

import SearchCardComponent from "../SearchCard";

interface ISearchResultListProps {
  searchKey?: string;
  handleResetSearch?: () => void;
}
const SearchResultList = (props: ISearchResultListProps) => {
  const { searchKey, handleResetSearch } = props;

  const { data, isLoading } = useQueryProducts({
    _q: searchKey,
    populate: "deep, 3",
    "sort[0]": "createdAt",
  });

  if (!isLoading && !data?.length)
    return (
      <Popover
        content={
          <div className="min-w-[280px] min-h-[200px] flex flex-col justify-center items-center">
            <p>Không tìm thấy sản phẩm phù hợp</p>
          </div>
        }
        title={
          <p>
            Kết quả tìm kiếm với{" "}
            <span className="font-bold">"{searchKey}"</span>
          </p>
        }
        trigger="click"
        open={true}
        placement="topLeft"
      />
    );
  return (
    <Popover
      content={
        <div className="flex flex-col gap-[4px] min-w-[280px] max-w-[300px]">
          {data?.map((product, index) => (
            <SearchCardComponent
              key={index}
              product={product}
              handleResetSearch={handleResetSearch}
            />
          ))}
        </div>
      }
      title={
        <p>
          Kết quả tìm kiếm với <span className="font-bold">"{searchKey}"</span>
        </p>
      }
      trigger="click"
      open={true}
      placement="topLeft"
    />
  );
};

export default SearchResultList;
