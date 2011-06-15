class Blog < ActiveRecord::Base
  belongs_to :user 
  has_many :responses, :dependent => :destroy
  
  validates :title, :presence => true 
  validates :content, :presence => true 
  
end
