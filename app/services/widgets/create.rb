module Widgets
  class Create < ::Rectify::Command

    def initialize(form, user)
      @form = form
      @user = user
    end

    def call
      return broadcast(:invalid) if @form.invalid?

      create_api_widget

      if api_response.blank?
        @form.errors.add(:base, api_error || 'API error')
        return broadcast(:invalid)
      end
      @user.widgets.create!(@form.model_attributes.merge(uid: api_response['id']))

      broadcast(:ok)
    end

    private

    attr_reader :api_response, :api_error
    def create_api_widget
      user_token = @user.access_token
      @api_response = Api::WidgetsAgent.new.create(user_token, @form.model_attributes)
    rescue StandardError => e
      puts e.response.body
      @api_error = JSON.parse(e.response.body)['message']
      return
    end
  end
end
