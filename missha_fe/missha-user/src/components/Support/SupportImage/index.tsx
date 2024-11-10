import clsx from "clsx";

interface ISupportImageProps {
  className?: string;
  src?: string;
}

const SupportImage = (props: ISupportImageProps) => {
  const { className, src } = props;
  return (
    <div className="w-full flex justify-center items-center py-[32px]">
      <img
        src={src}
        alt="vnpay-image"
        className={clsx("w-full h-full md:w-[800px] md:h-[500px]", className)}
      />
    </div>
  );
};

export default SupportImage;
