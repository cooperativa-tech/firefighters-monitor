const flatpickr = require("flatpickr");
require("flatpickr/dist/flatpickr.min.css");

document.addEventListener("turbolinks:load", () => {
  flatpickr(".DatePicker-date", { enableTime: false });
  flatpickr(".DatePicker-datetime", { enableTime: true });
});
