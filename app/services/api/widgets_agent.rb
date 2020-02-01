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

    def create(user_token, opts)
      res = RestClient.post "#{host}/widgets", { widget: opts }, { 'Authorization' => "Bearer #{user_token}", 'Content-Type' => 'application/json' }
      parse_response(res)['widget']
    end

    def update(user_token:, opts:, id:)
      res = RestClient.put "#{host}/widgets/#{id}", { widget: opts }, { 'Authorization' => "Bearer #{user_token}", 'Content-Type' => 'application/json' }
      parse_response(res)['widget']
    end


    def destroy(user_token, uid)
      res = RestClient.delete "#{host}/widgets/#{uid}", { 'Authorization' => "Bearer #{user_token}", 'Content-Type' => 'application/json' }
    end
  end
end
