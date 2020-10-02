module.exports = {
  plugins: [
    require("postcss-easy-import"),
    require("postcss-nested"),
    require("postcss-flexbugs-fixes"),
    require("postcss-preset-env")({
      autoprefixer: {
        flexbox: "no-2009",
      },
      features: {
        "nesting-rules": false,
      },
      stage: 0,
    }),
    require("postcss-custom-properties"),
  ],
};
