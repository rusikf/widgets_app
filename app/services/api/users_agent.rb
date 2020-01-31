module Api
  class UsersAgent
    HOST = 'https://showoff-rails-react-production.herokuapp.com/api/v1'
    def create(opts)
      res = RestClient.post "#{HOST}/users", { user: opts }.merge(base_opts), { 'Content-Type' => 'application/json', 'accept' => 'json' }
      JSON.parse(res)['data']
    rescue RestClient::ExceptionWithResponse => e
      msg = JSON.parse(e.response)['message']
      puts(msg) if Rails.env.development?
      Rails.logger.error(e)
      {}
    rescue StandardError => e
      Rails.logger.error(e)
      {}
    end

    private

    # TODO: move to .env
    def base_opts
      {
        client_id: '277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe',
        client_secret: 'd6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352'
      }
    end
  end
end
