module Users
  class ProfileDecorator
    def initialize(user)
      @user = user
    end

    def call
      return if @user.blank?
      data = Api::UsersAgent.new.show(@user.uid, @user.access_token)

      user_data = data['user']
      {
        name: user_data['name'],
        id: user_data['id'],
        email: user_data['email']
      }
    end
  end
end
