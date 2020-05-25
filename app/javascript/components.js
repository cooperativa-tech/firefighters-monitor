function importAll(context) {
  context.keys().forEach(context);
}

importAll(require.context("../components", true, /_component.js$/));
