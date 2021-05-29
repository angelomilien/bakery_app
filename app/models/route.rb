class Route < ActiveRecord::Base
    has_many :stops
    belongs_to :users
    belongs_to :bakeries
end


