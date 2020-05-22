function importAll(r) {
  r.keys().forEach(r);
}

importAll(require.context("../components", true, /_component.js$/));
