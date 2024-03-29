# TODO: spec

class Users::Create
  def initialize(user)
    @user = user
  end

  def call
    api_data = Api::UsersAgent.new.create(
      first_name: user.first_name,
      last_name: user.last_name,
      password: user.encrypted_password,
      email: user.email
    ) if fields_exists?

    user.token = api_data['token']
    user.uid = api_data['user']['id']
    user.save
    user
  end

  private
  attr_reader :user

  def fields_exists?
    [user.first_name, user.last_name, user.encrypted_password, user.email].all?(&:present?)
  end
end
