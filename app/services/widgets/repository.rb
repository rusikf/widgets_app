module Widgets
  class Repository
    # TODO: cache for landing
    def index(q: nil, current_user: nil)
      response = current_user ? agent.index(current_user.token['access_token']) : agent.index_visible(visible_opts(q: q))
      Store.new(response['widgets']).as_collection
    end

    private

    def visible_opts(opts)
      opts = {}
      opts.merge(term: opts[:q]) if opts[:q].present?
      opts
    end

    def agent
      Api::WidgetsAgent.new
    end
  end
end
