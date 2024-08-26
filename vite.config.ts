import path from "path";

import react from "@vitejs/plugin-react-swc";
import { defineConfig } from "vite";

const __dirname = path.resolve();
// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      "@/": path.resolve(__dirname, "./src/"),
      "@/components": `${path.resolve(__dirname, "./src/components/")}`,
      "@/pages": path.resolve(__dirname, "./src/pages/"),
      "@/store": path.resolve(__dirname, "./src/store/"),
      "@/swr": path.resolve(__dirname, "./src/swr/"),
      "@/utils": path.resolve(__dirname, "./src/utils/"),
      "@/assets": path.resolve(__dirname, "./src/assets/"),
      "@/libs": path.resolve(__dirname, "./src/libs/"),
      "@/routes": path.resolve(__dirname, "./src/routes/"),
      "@/types": path.resolve(__dirname, "./src/types/"),
      "@/hooks": path.resolve(__dirname, "./src/hooks/"),
      "@/layouts": path.resolve(__dirname, "./src/layouts/"),
      "@/styles": path.resolve(__dirname, "./src/styles/"),
      "@/apis": path.resolve(__dirname, "./src/apis/"),
      "@/locales": path.resolve(__dirname, "./src/locales/"),
    },
  },
});
