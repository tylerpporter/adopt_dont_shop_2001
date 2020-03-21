class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy
  validates_presence_of :name,
                        :address,
                        :city,
                        :state,
                        :zip
  def self.sort
    all.sort_by(&:name)
  end 
end
