// config/tailwind.config.js
module.exports = {
  content: [
    './app/views/**/*.{html.erb,html.haml,html.slim}',
    './app/helpers/**/*.rb',
    './app/assets/javascripts/**/*.js',
  ],
  theme: {
    extend: {
      color:{
        'emerald-dark': '#0b2e26',
      }
    },
  },
  plugins: [],
}
