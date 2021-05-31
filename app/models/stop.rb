class Stop < ActiveRecord::Base
    belongs_to :routes
    has_many :orders
end