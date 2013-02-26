class Page < ActiveRecord::Base
  # attr_accessible :title, :body
  

    
  attr_accessible :name, :position, :permalink, :visible
  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :editors, :class_name => "User"

  validates :name, :presence => true, :length => { :maximum => 255 }
  validates :permalink, :presence => true, :within => 3..255, :uniqueness => true
 

end
