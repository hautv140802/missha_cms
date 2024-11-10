import clsx from "clsx";

interface ISupportTextProps {
  className?: string;
  content: string | { question: string; answer: string };
  type?: "header" | "title" | "step" | "text";
}

const SupportText = (props: ISupportTextProps) => {
  const { className, content, type } = props;

  if (type === "header" && typeof content === "string")
    return (
      <p
        className={clsx(
          "text-center font-bold text-[#2A4826] text-[30px] md:text-[40px] uppercase leading-[56px]",
          className
        )}
      >
        {content}
      </p>
    );

  if (type === "title" && typeof content === "string")
    return (
      <p
        className={clsx(
          "font-bold text-[#484848] text-[14px] md:text-[19px] my-[24px] md:my-[40px] leading-[22.4px]",
          className
        )}
      >
        {content}
      </p>
    );

  if (type === "step" && typeof content === "string")
    return (
      <li
        className={clsx(
          "font-[400] text-[#484848] text-[13px] md:text-[16px] text-justify",
          className
        )}
      >
        {content}
      </li>
    );

  if (type === "step" && typeof content !== "string")
    return (
      <li
        className={clsx(
          " font-[400] text-[#484848] text-[13px] md:text-[16px]",
          className
        )}
      >
        <div className="flex flex-col">
          <p className="inline-block font-[400] text-[#484848] text-[13px] md:text-[16px] text-justify">
            {content.question}
          </p>
          <p className="mt-[4px] font-[400] text-[#484848] text-[13px] md:text-[16px] text-justify">
            {content.answer}
          </p>
        </div>
      </li>
    );

  return (
    <p
      className={clsx(
        "font-[400] text-[#484848] text-[13px] text-justify md:text-[16px] leading-[26.6px]",
        className
      )}
    >
      {typeof content === "string" && content}
    </p>
  );
};

export default SupportText;
