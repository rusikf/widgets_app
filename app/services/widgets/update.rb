module Widgets
  class Update < ::Rectify::Command
    def initialize(form, current_user)
      @form = form
      @current_user = current_user
    end

    def call
      return broadcast(:invalid) if @form.invalid?
      @widget = @current_user.widgets.find_by(id: @form.id)
      update_api_record
      @widget.update_attributes!(@form.model_attributes)
      broadcast(:ok)
    end

    private

    def update_api_record
      Api::WidgetsAgent.new.update(
        user_token: @current_user.access_token,
        opts: @form.model_attributes,
        id: @widget.uid
      ) # TODO: catch errors here
    end
  end
end
