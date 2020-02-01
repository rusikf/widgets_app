module Widgets
  class Destroy < ::Rectify::Command
    def initialize(id, user)
      @id = id
      @user = user
    end

    def call
      widget = @user.widgets.find_by(id: @id)
      Api::WidgetsAgent.new.destroy(@user.access_token, widget.uid)
      widget.destroy!
      broadcast(:ok)
    rescue StandardError => e
      # TODO: rescue on specific error
      broadcast(:invalid)
    end
  end
end
