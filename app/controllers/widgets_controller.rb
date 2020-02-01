class WidgetsController < BaseController
  def index
    @widgets = Widgets::Repository.new.index(q: params[:q])
  end
end
