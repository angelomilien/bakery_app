class Order < ActiveRecord::Base
    belongs_to :bakeries
    belongs_to :orders
end