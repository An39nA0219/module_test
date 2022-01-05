class Consultant < ApplicationRecord
  attr_accessor :sex
  
  validates :name, presence: true
end
