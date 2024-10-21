import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import Scrollbars from "rc-scrollbars";
import AppRouter from "./router/AppRouter";
import { ConfigProvider } from "antd";
import { Toaster } from "react-hot-toast";
function App() {
  const queryClient = new QueryClient();
  return (
    <>
      <ConfigProvider
        theme={{
          token: {
            colorPrimary: "#FF9800", // Change this to your desired primary color
            colorSuccess: "#52c41a",
            colorWarning: "#faad14",
            colorError: "#ff4d4f",
            colorInfo: "#13c2c2",
          },
        }}
      >
        <QueryClientProvider client={queryClient}>
          <Scrollbars
            style={{ maxWidth: "100vw", height: "100vh" }}
            autoHide
            renderTrackVertical={(props) => (
              <div {...props} className="track-vertical z-[9999]" />
            )}
          >
            <AppRouter />
            {/* <ReactQueryDevtools initialIsOpen={false} /> */}
            <Toaster
              position="top-right"
              reverseOrder={false}
              toastOptions={{
                className: "",
                style: {
                  // border: "none",
                  // borderRadius: 0,
                  // padding: "12px 16px",
                  // color: "#EAEDE9",
                  // background: "#2A4826",
                  fontSize: "1.4rem",
                },
              }}
            />
          </Scrollbars>
        </QueryClientProvider>
      </ConfigProvider>
    </>
  );
}

export default App;
