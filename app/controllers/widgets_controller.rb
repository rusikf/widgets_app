class WidgetsController < BaseController
  def index
    @widgets = Widgets::Repository.new.index(q: params[:q], current_user: current_user)
  end
end
