class Section < ActiveRecord::Base
  attr_accessible :name, :position, :content_type, :visible, :content
  belongs_to :page
  has_many :section_edits

  CONTENT_TYPES = ['text','HTML']
  validates :name, :presence => true, :length => { :maximum => 25 },:uniqueness => true
  validates :content, :presence => true, :length => { :maximum => 50 }
  validates_inclusion_of :content_type, :in => CONTENT_TYPES, :message => "must be one of : #{CONTENT_TYPES.join(', ')}"
 
end
