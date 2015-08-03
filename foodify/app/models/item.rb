class Item < ActiveRecord::Base
  belongs_to :playlist

  validates :name, presence: true

end