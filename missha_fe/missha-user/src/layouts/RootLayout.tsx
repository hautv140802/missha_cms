import { Outlet } from "react-router-dom";
import HeaderComponent from "../components/Header";
import FooterComponent from "../components/Footer";
import images from "../assets/images";

export default function RootLayout() {
  return (
    <div className="container-fluid p-0 flex flex-col min-h-screen relative">
      <HeaderComponent />
      <div className="h-full bg-[#F8F8FC]">
        <Outlet

        //   context={{ setIsLoadingDone } satisfies RootLayoutContextType}
        />
      </div>
      <FooterComponent />

      <a
        href="https://zalo.me/0332208620"
        className="fixed bottom-[5%] right-[2%] bg-white p-[1rem] shadow-md border-[0.1rem] border-[#3333]  rounded-full cursor-pointer"
      >
        <div className="flex items-center gap-[0.8rem]">
          <img src={images.zalo} alt="zalo" width={50} />
        </div>
      </a>
      <a
        href="https://www.facebook.com/chienjrrr"
        className="fixed bottom-[15%] right-[2%] bg-white p-[1rem] shadow-md border-[0.1rem]  rounded-full border-[#3333] cursor-pointer"
      >
        <div className="flex items-center gap-[0.8rem">
          <img src={images.messager} alt="messager" width={50} />
          <div></div>
        </div>
      </a>
    </div>
  );
}
