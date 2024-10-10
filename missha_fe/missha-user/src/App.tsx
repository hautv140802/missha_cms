import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import Scrollbars from "rc-scrollbars";
import AppRouter from "./router/AppRouter";
import { ConfigProvider } from "antd";
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
          </Scrollbars>
        </QueryClientProvider>
      </ConfigProvider>
    </>
  );
}

export default App;
