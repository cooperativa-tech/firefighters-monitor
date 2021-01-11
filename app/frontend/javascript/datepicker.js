const flatpickr = require("flatpickr").default;
require("flatpickr/dist/flatpickr.min.css");

document.addEventListener("turbo:load", () => {
  flatpickr(".DatePicker-date", { enableTime: false });
  flatpickr(".DatePicker-datetime", { enableTime: true });
});
