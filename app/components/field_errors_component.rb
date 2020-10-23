class FieldErrorsComponent < ViewComponent::Base
  def initialize(model, attribute)
    super

    @errors = model.errors[attribute]
  end

  def render?
    @errors.count.positive?
  end
end
