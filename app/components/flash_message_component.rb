class FlashMessageComponent < ViewComponent::Base
  def initialize(flash:)
    @flash = flash
  end

  def render?
    @flash&.keys&.count&.positive?
  end
end
