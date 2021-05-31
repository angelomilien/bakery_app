class Bakery < ActiveRecord::Base
    has_many :users
    has_many :routes
    has_many :breads
end