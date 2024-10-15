import { Breadcrumb } from "antd";
import clsx from "clsx";
import { Link } from "react-router-dom";
interface BreadcrumbItem {
  href?: string;
  title: string;
}
interface BreadcrumbProps {
  items: BreadcrumbItem[];
  className?: string;
}

// const BreadcrumbAntdStyled = styled(BreadcrumbAntd)`
//   &.ant-breadcrumb {
//     ol {
//       display: block;
//       white-space: nowrap;
//       text-overflow: ellipsis;
//       overflow: hidden;

//       li {
//         display: inline;
//         text-overflow: ellipsis;
//         overflow: hidden;
//         -webkit-line-clamp: 1;
//         span {
//           a {
//             display: inline;
//           }
//         }
//       }
//     }
//   }
// `;

const BreadcrumbComponent = (props: BreadcrumbProps) => {
  const { items, className } = props;

  const breadcrumbItems = items.map((item, index) => {
    if (index === items.length - 1) {
      return {
        title: (
          <span className="text-[1.4rem] md:text-[1.4rem] text-[#818080]">
            {item.title}
          </span>
        ),
      };
    }

    return {
      title: item.href ? (
        <Link
          to={item.href}
          key={index}
          className="text-[1.4rem] md:text-[1.4rem] text-[#000000]"
        >
          {item.title}
        </Link>
      ) : (
        <span className="text-[1.4rem] md:text-[1.4rem] text-[#000000]">
          {item.title}
        </span>
      ),
    };
  });

  return (
    <div className="w-full bg-white md:px-auto">
      <div className="px-[16px] flex justify-start py-[8px] w-full mx-auto">
        <Breadcrumb
          items={breadcrumbItems}
          className={clsx(
            "justify-center md:container max-w-[320px] sm:max-w-[720px] md:max-w-[1120px] md:mx-auto md:relative text-ellipsis line-clamp-1",
            className
          )}
          separator={"|"}
        />
      </div>
    </div>
  );
};

export default BreadcrumbComponent;
