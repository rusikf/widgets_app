module Widgets
  class Repository
    # TODO: cache
    def index(q: nil)
      api_data = Api::WidgetsAgent.new.index(term: q)['widgets']

      api_data.map do |widget|
        record = Widget.find_or_initialize_by(uid: widget['id'])

        record.assign_attributes(
          name: widget['name'],
          description: widget['description'],
          kind: Widget.kinds[widget['kind']]
        )
        record.save!
        record
      end
    end

  end
end
