import { Config } from 'tailwindcss';

/** @type {import('tailwindcss').Config} */
const config: import('tailwindcss').Config = {
  important: true,
  content: ['./src/**/*.{js,jsx,ts,tsx}'],
  darkMode: ['class', '[data-mode="dark"]'],
  theme: {
    extend: {
      colors: {
        'piper-lolot': '#2A4826',
        'thin-ciment': '#F8F8F8',
        'light-ciment': '#ABABAB',
        'primary-ciment': '#6D6D6D',
        gold: '#A77B5A',
        ciment: '#484848',
        pink: '#FE135A',
      },
      fontSize: {
        sm: '0.8rem',
        base: '0.9rem',
        xl: '1.25rem',
        '2xl': '1.563rem',
        '3xl': '1.953rem',
        '4xl': '2.441rem',
        '5xl': '3.052rem',
        'title-product-detail': '16px',
        'origin-price': '11px',
        'start-text': '11px',
        volume: '13px',
        percent: '14px',
        price: '23px',
      },
      screens: {
        sm: '460px',
        md: '768px',
        lg: '976px',
        xl: '1440px',
      },
      borderRadius: {
        none: '0',
        sm: '0.125rem',
        DEFAULT: '0.25rem',
        md: '0.375rem',
        lg: '0.5rem',
        full: '9999px',
        large: '12px',
        '5xl': '36px',
      },
    },
  },
} satisfies Config;

export default config;
