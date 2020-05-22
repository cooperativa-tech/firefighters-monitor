class FlashMessageComponent < ViewComponent::Base
  def initialize(flash:)
    @flash = flash
  end

  def render?
    @flash.present?
  end
end
