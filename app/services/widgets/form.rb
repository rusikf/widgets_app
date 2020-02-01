module Widgets
  class Form < ::Rectify::Form
    attribute :name
    attribute :description
    attribute :kind

    validates :name, :description, presence: true


    def kind_value
      kind == '0' ? 'hidden' : 'visible'
    end

    def model_attributes
      attributes.extract!(:name, :description).merge(kind: kind_value)
    end
  end
end
