import Scrollbars from "rc-scrollbars";
import { ReactNode } from "react";

interface IScrollbarComponentProps {
  children: ReactNode;
  height?: string;
}
const ScrollbarComponent = (props: IScrollbarComponentProps) => {
  const { children, height = "500px" } = props;
  return (
    <Scrollbars
      style={{ maxWidth: "100%", height: height }}
      autoHide
      renderTrackVertical={(props) => (
        <div {...props} className="track-vertical z-[999] pl-[0.3rem]" />
      )}
    >
      {children}
    </Scrollbars>
  );
};

export default ScrollbarComponent;
