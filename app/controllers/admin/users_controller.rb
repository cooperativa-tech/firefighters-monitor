module Admin
  class UsersController < Admin::ApplicationController
    def create
      user = create_user

      if user.save
        redirect_to(
          [namespace, user],
          notice: translate_with_resource("create.success"),
        )
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, user)
        }
      end
    end

    private

    def create_user
      user = resource_class.new(resource_params)
      authorize_resource(user)

      unless user.password
        user.password = SecureRandom.hex
        user.password_confirmation = user.password
      end

      user
    end
  end
end
