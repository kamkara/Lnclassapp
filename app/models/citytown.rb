class Citytown < ApplicationRecord
  belongs_to :user

  #Slugged concern
  include ItemsSlugged

end
