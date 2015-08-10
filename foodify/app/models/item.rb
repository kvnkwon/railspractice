class Item < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :restaurant

  validates :name, presence: true

end