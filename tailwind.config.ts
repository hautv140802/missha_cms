import { Config } from "tailwindcss";

/** @type {import('tailwindcss').Config} */
const config: import("tailwindcss").Config = {
  important: true,
  content: ["./src/**/*.{js,jsx,ts,tsx}"],
  darkMode: ["class", '[data-mode="dark"]'],
  theme: {},
} satisfies Config;

export default config;
