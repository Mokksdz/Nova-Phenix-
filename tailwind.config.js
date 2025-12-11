/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./*.html",
    "./dist/*.html"
  ],
  theme: {
    extend: {
      colors: {
        'nova-blue': '#1e3a8a',
        'nova-gold': '#d97706',
        'nova-light': '#f8fafc',
        'nova-dark': '#0f172a',
      },
      fontFamily: {
        sans: ['Open Sans', 'sans-serif'],
        heading: ['Montserrat', 'sans-serif'],
      }
    }
  },
  plugins: [],
}
