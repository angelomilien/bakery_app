class Order < ActiveRecord::Base
    belongs_to :stops
    has_many :breads
end