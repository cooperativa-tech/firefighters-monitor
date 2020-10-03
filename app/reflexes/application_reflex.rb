class ApplicationReflex < StimulusReflex::Reflex
  delegate :current_user, to: :connection
end
