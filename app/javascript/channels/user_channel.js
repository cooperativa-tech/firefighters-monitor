import consumer from "./consumer";

export default function buildUserChannel(id, handleStatusUpdates) {
  return consumer.subscriptions.create(
    { channel: "UserChannel", user_id: id },
    {
      toggle(id) {
        this.perform("toggle", { user_id: id });
      },
      received: handleStatusUpdates,
    }
  );
}
