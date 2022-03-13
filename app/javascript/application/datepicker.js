const flatpickr = require("flatpickr").default;

document.addEventListener("turbo:load", () => {
  flatpickr(".DatePicker-date", { enableTime: false });
  flatpickr(".DatePicker-datetime", { enableTime: true });
});
