module Api
  class WidgetsAgent < BaseAgent
    def index(term: nil)
      opts = base_opts
      opts = opts.merge(term: term) if term.present?
      res = RestClient.get "#{host}/widgets/visible", { 'Authorization' => app_header, params: opts }
      parse_response(res)
    end
  end
end
