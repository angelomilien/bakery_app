class Stop < ActiveRecord::Base
    belongs_to :route
    belongs_to :user
    has_many :orders
end