class Bread < ActiveRecord::Base
    belongs_to :bakery
    belongs_to :order
end