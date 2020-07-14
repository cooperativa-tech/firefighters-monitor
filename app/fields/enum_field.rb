require "administrate/field/base"

class EnumField < Administrate::Field::Base
  def to_s
    data
  end

  def select_field_values(form_builder)
    klass = form_builder.object.class

    klass.public_send(attribute.to_s.pluralize).keys.map do |v|
      [klass.human_enum_name(attribute, v), v]
    end
  end
end
