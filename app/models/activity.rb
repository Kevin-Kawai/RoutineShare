class Activity < ApplicationRecord
  belongs_to :routine 

  include RankedModel
  ranks :row_order, with_same: :routine_id
end
