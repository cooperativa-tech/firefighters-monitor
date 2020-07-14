class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.human_enum_name(enum_name, enum_value)
    enum_value = enum_value.to_s
    label = "activerecord.attributes.#{model_name.i18n_key}.#{enum_name.to_s.pluralize}.#{enum_value}"
    default = enum_value.titleize

    I18n.t(label, default: default)
  end
end
