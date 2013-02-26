class Subject < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :position, :visible

  has_many :pages
  
  validates :name, :presence => true, :length => { :maximum => 25 }, :uniqueness => true

  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)  
  scope :search, lambda {|query| where(["name LIKE ? ", "%#{query}%"])}

end
