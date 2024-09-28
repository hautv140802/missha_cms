import { defineConfig } from "vite";
import react from "@vitejs/plugin-react-swc";
import { sentryVitePlugin } from "@sentry/vite-plugin";
import viteLegacyPlugin from "@vitejs/plugin-legacy";
import path from "path";
import browserslistToEsbuild from "browserslist-to-esbuild";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    react(),
    sentryVitePlugin({
      org: "",
      project: "",
      telemetry: false,
    }),
    viteLegacyPlugin({
      targets: ["defaults", "safari >= 10", "not IE 11"],
    }),
  ],

  resolve: {
    alias: {
      "@/": path.resolve(__dirname, "./src/"),
      "@/components": `${path.resolve(__dirname, "./src/components/")}`,
      "@/pages": path.resolve(__dirname, "./src/pages/"),
      "@/customIcons": path.resolve(__dirname, "./src/customIcons/"),
      "@/api": path.resolve(__dirname, "./src/api/"),
      "@/utils": path.resolve(__dirname, "./src/utils/"),
      "@/assets": path.resolve(__dirname, "./src/assets/"),
      "@/recoil": path.resolve(__dirname, "./src/recoil/"),
      "@/lotties": path.resolve(__dirname, "./src/lotties/"),
      "@/routers": path.resolve(__dirname, "./src/routers/"),
      "@/types": path.resolve(__dirname, "./src/types/"),
      "@/hooks": path.resolve(__dirname, "./src/hooks/"),
      "@/layouts": path.resolve(__dirname, "./src/layouts/"),
    },
  },

  define: { "process.env": {} },

  build: {
    sourcemap: true,
    target: browserslistToEsbuild(),
  },
  esbuild: {
    /**
     * Prevents ESBuild to throw when using a feature not supported by the
     * list of supported browsers coming from the `browserslist` file.
     */
    supported: {
      "top-level-await": true,
    },
  },
});
