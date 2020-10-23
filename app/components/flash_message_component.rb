class FlashMessageComponent < ViewComponent::Base
  def initialize(flash:)
    super
    @flash = flash
  end

  def render?
    @flash&.keys&.count&.positive?
  end
end
