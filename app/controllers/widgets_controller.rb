class WidgetsController < BaseController
  before_action :find_widget, only: [:edit, :update]

  def new
    @form = Widgets::Form.new
  end

  def create
    @form = Widgets::Form.from_params(params)
    Widgets::Create.call(@form, current_user) do
      on(:ok) { redirect_to(root_path, flash: { notice: t('.success') }) }
      on(:invalid) { render(:new) }
    end
  end

  def index
    @widgets = Widgets::Repository.new.index(q: params[:q], current_user: current_user)
  end

  def edit
    @form = Widgets::Form.from_model(@widget)
  end

  def update
    @form = Widgets::Form.from_params(params)
    Widgets::Update.call(@form, current_user) do
      on(:ok) { redirect_to(root_path, flash: { notice: t('.success') }) }
      on(:invalid) { render(:edit) }
    end
  end

  def destroy
    Widgets::Destroy.call(params[:id], current_user) do
      on(:ok) { redirect_to(root_path, flash: { notice: t('.success') }) }
      on(:invalid) { redirect_to(root_path, flash: { alert: t('.error') }) }
    end
  end

  private

  def find_widget
    @widget = Widget.find(params[:id])
  end
end
