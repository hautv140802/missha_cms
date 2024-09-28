import { Outlet } from "react-router-dom";
import HeaderComponent from "../components/Header";
import FooterComponent from "../components/Footer";

export default function RootLayout() {
  return (
    <div className="container-fluid p-0 flex flex-col min-h-screen relative">
      <HeaderComponent />
      <div className="h-full">
        <Outlet

        //   context={{ setIsLoadingDone } satisfies RootLayoutContextType}
        />
      </div>
      <FooterComponent />
    </div>
  );
}
