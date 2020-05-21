require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    email: Field::String,
    role: EnumField,
    password: Field::Password,
    password_confirmation: Field::Password
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    email
    created_at
    updated_at
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    email
    role
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    role
    email
    password
    password_confirmation
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
