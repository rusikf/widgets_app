class Widget < ApplicationRecord
  enum kind: { hidden: 0, visible: 1 }
  belongs_to :user, optional: true
end
