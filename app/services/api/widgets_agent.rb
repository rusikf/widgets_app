module Api
  class WidgetsAgent < BaseAgent
    def index_visible(opts={})
      res = RestClient.get "#{host}/widgets/visible", { 'Authorization' => "Bearer #{app_token}", params: base_opts.merge(opts) }
      parse_response(res)
    end

    def index(user_token)
      res = RestClient.get "#{host}/widgets", { 'Authorization' => "Bearer #{user_token}" }
      parse_response(res)
    end
  end
end
