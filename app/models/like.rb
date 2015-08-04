class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :place, counter_cache: true
end
