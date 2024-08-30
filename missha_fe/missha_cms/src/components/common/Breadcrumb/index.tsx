import { Breadcrumb } from 'antd';
import { BreadcrumbItemType } from 'antd/es/breadcrumb/Breadcrumb';
import clsx from 'clsx';

interface IBreadcrumbProps {
  items: BreadcrumbItemType[];
  className?: string;
}
const BreadcrumbComponent = (props: IBreadcrumbProps) => {
  const { items, className } = props;
  const breadcrumbItems = items.map((item, index) => {
    if (index === items.length - 1) {
      return {
        title: item.href ? (
          <a
            href={item.href}
            key={index}
            className="text-[14px] md:text-[14px] text-[#172815] font-medium"
          >
            {item.title}
          </a>
        ) : (
          <span className="text-[14px] md:text-[14px] text-[#000000]">
            {item.title}
          </span>
        ),
      };
    }

    return {
      title: item.href ? (
        <a
          href={item.href}
          key={index}
          className="text-[14px] md:text-[14px] text-[#000000]"
        >
          {item.title}
        </a>
      ) : (
        <span className="text-[14px] md:text-[14px] text-[#000000]">
          {item.title}
        </span>
      ),
    };
  });
  return (
    <Breadcrumb
      separator="/"
      items={breadcrumbItems}
      className={clsx(
        'flex flex-row justify-start md:px-[3rem] pb-3 xs:px-4 md:pb-6 md:container md:mx-auto md:relative',
        className
      )}
    ></Breadcrumb>
  );
};

export default BreadcrumbComponent;
