class User < ActiveRecord::Base
  before_save {self.email = self.email.downcase}
  VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, length: {minimum: 5, maximum: 50 }
  validates :email, presence: true, length: {minimum: 15, maximum: 150}, 
                              uniqueness: {case_sensitive: false},
                              format: { with: VALID_EMAIL_FORMAT}
            
  has_many :recipes
end
