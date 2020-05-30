require "rails_helper"

RSpec.describe FlashMessageComponent do
  it "doesn't render anything if no flash is present" do
    component = FlashMessageComponent.new(flash: nil)

    render_inline(component).to_html

    expect(rendered_component).to eq("")
  end

  it "renders something useful" do
    flash = ActionDispatch::Flash::FlashHash.new({ alert: "alert!", notice: "notice!" })
    component = FlashMessageComponent.new(flash: flash)

    render_inline(component)

    expect(rendered_component).to have_css(".Flash.Flash-alert", text: "alert!")
    expect(rendered_component).to have_css(".Flash.Flash-notice", text: "notice!")
  end
end
