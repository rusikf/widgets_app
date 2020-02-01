class UsersController < BaseController
  def show
    @user = User.find_by(id: params[:id])
    @profile = Users::ProfileDecorator.new(@user).call
  end
end
