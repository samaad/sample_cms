require 'digest/sha1'
 
class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :password, :username
  # to configer other database name or rename the class and file name
  #set_table_name("admin_users")
  validates_presence_of :first_name
  has_and_belongs_to_many :pages
  has_many :section_edits 
  attr_accessor :pass 
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
  # standard validation methods
  # validates_presence_of :first_name
  # validates_length_of :first_name, :maximum => 25
  # validates_presence_of :last_name
  # validates_length_of :last_name, :maximum => 50
  # validates_presence_of :username
  # validates_length_of :username, :within => 8..25
  # validates_uniqueness_of :username
  # validates_presence_of :email
  # validates_length_of :email, :maximum => 100
  # validates_format_of :email, :with => EMAIL_REGEX
  # validates_confirmation_of :email
  
  # new "sexy" validations
  validates :first_name, :presence => true, :length => { :maximum => 25 }
  validates :last_name, :presence => true, :length => { :maximum => 50 }
  validates :username, :length => { :within => 8..25 }, :uniqueness => true
  validates :email, :presence => true, :length => { :maximum => 100 }, 
    :format => EMAIL_REGEX, :confirmation => true
 
  scope :named, lambda {|first,last| where(:first_name => first, :last_name => last)}
  scope :sorted, order("users.last_name ASC, users.first_name ASC")
  
  validates_length_of :pass, :within => 8..25, :on => :create

  before_save :create_hashed_password
  after_save :clear_password

  def name
    "#{first_name} #{last_name}"
  end

  def self.authenticate(username="", password="")
    user = User.find_by_username(username)
     if user && user.password_match?(password)
       return user
     else
       return false
     end
  end

  def password_match?(password="")
     hashed_password == User.hash_with_salt(password, salt)
  end
 
  attr_protected :hashed_password, :salt 
   
  def self.make_salt(username="") 
     Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
  end

  def self.hash_with_salt(password="", salt="") 
     Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end

  private
  
  def create_hashed_password
    
   unless pass.blank?
    self.salt = User.make_salt(username) if salt.blank?
    self.hashed_password = User.hash_with_salt(pass, salt) 
   end 
  end 
   
   def clear_password
    self.pass = nil
   end
end
