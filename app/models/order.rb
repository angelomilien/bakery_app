class Order < ActiveRecord::Base
    belongs_to :stop
    has_many :breads
end