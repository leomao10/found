class Post < ActiveRecord::Base
  STATUS = %w[incomplete paid overdue]

  has_one :address, :dependent => :destroy
  has_one :property, :dependent => :destroy
  has_one :contact, :as => :contactable
  has_many :images, :dependent => :destroy 
  
  belongs_to :user

  scope :address_contain_keyword, lambda { |keyword| 
    joins(:address)&Address.contain_keyword(keyword)
  }
end