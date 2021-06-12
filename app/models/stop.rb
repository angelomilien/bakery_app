class Stop < ActiveRecord::Base
    validates :name, :adresse, :phone_number,  presence: true
    belongs_to :route
    belongs_to :user
    has_many :orders
end