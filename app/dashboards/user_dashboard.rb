require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    username: Field::String,
    role: EnumField,
    sort_index: Field::Number,
    password: Field::Password,
    password_confirmation: Field::Password
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    username
    sort_index
    created_at
    updated_at
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    username
    role
    sort_index
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    username
    password
    password_confirmation
    role
    sort_index
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
