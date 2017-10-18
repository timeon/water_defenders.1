class Reading < ActiveRecord::Base
  belongs_to :user
  validates :value, :numericality => { :greater_than => 0 }

end
