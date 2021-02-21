import * as Sentry from "@sentry/browser";
import { Integrations } from "@sentry/tracing";

if (process.env.NODE_ENV === "production") {
  Sentry.init({
    dsn:
      "https://ed4dcca3666945358d7793212359fcc5@o456594.ingest.sentry.io/5449846",
    integrations: [new Integrations.BrowserTracing()],
    tracesSampleRate: 1.0,
    environment: "production",
  });
}
