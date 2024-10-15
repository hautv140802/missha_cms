import { Config } from "tailwindcss";

export default {
  important: true,
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
    "./node_modules/tw-elements/dist/js/**/*.js",
    "./node_modules/flowbite/**/*.js",
    "node_modules/flowbite-react/**/*.{js,jsx,ts,tsx}",
    "./build/**/*.{js,jsx,ts,tsx,pug,html}",
  ],
  darkMode: ["class", '[data-mode="dark"]'],
  theme: {
    extend: {
      shake: {
        "0%, 100%": { transform: "translateX(0)" },
        "25%": { transform: "translateX(-4px)" },
        "50%": { transform: "translateX(4px)" },
        "75%": { transform: "translateX(-4px)" },
      },
      animation: {
        shake: "shake 0.5s ease-in-out",
      },
      boxShadow: {
        activeColor: "inset 0 0 0 3px white, 0 0 0 1.5px #FF9800",
        notActiveColor: "inset 0 0 0 3px white, 0 0 0 1px #ccc",
      },
    },
  },
  plugins: [
    // require("tw-elements/dist/plugin.cjs"),
    // require("flowbite/plugin"),
    // function ({ addUtilities }) {
    //   addUtilities({
    //     ".no-scrollbar": {
    //       "::-webkit-scrollbar": {
    //         display: "none",
    //       },
    //       "-ms-overflow-style": "none",
    //       "scrollbar-width": "none",
    //     },
    //   });
    // },
  ],
} satisfies Config;
