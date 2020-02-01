class Widgets::Create < Rectify::Create

  def initialize(form, user)
    @form = form
    @user = user
  end

  def call
    return broadcast(:invalid) if form.invalid?

    create_api_widget
    store_widget

    broadcast(:ok)
  end

  private

  def create_api_widget
    user_token = @user.token['access_token']
    Api::WidgetsAgent.new.create(user_token, @form.attrs)
  end

end
