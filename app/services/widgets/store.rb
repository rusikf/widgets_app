module Widgets
  class Store
    def initialize(data)
      @api_data = data
    end

    def as_collection
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
    
    private

    attr_reader :api_data
  end
end
