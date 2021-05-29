class User < ActiveRecord::Base
    has_secure_password
    belongs_to :bakeries
    has_many :routes
    
end