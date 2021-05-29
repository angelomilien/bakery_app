class Bakery < ActiveRecord::Base
    has_many :users
    has_many :routes
end