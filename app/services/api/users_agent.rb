module Api
  class UsersAgent < BaseAgent

    def create(opts)
      res = RestClient.post "#{host}/users", { user: opts }.merge(base_opts), { 'Content-Type' => 'application/json', 'accept' => 'json' } # TODO: remove headers?
      parse_response(res)
    rescue RestClient::ExceptionWithResponse => e
      msg = JSON.parse(e.response)['message']
      puts(msg) if Rails.env.development?
      Rails.logger.error(e)
      {}
    rescue StandardError => e
      Rails.logger.error(e)
      {}
    end
  end
end
