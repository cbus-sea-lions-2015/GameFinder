class User < ActiveRecord::Base

  belongs_to :library

  has_many :favlibraries, class_name: "Favoritelibrary"
  has_many :favoritelibraries, through: :favlibraries

  validates :auth0_id, presence: true, uniqueness: true

end
