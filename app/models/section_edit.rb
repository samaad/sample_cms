class SectionEdit < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :editor, :class_name => "User", :foreign_key => "admin_user_id" 
  belongs_to :section
end
