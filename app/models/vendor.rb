class Vendor < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :quantity
  validates_presence_of :price
end
