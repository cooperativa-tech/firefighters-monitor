class ApplicationReflex < StimulusReflex::Reflex
  delegate :current_user, to: :connection

  rescue_from StandardError do |exception|
    Raven.capture_exception(exception)
  end
end
