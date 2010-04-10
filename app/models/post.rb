class Post < ActiveRecord::Base
  STATUS = %w[incomplete paid overdue]

  has_one :address, :dependent => :destroy
  has_one :property, :dependent => :destroy
  has_many :images, :dependent => :destroy
  
  belongs_to :user

  accepts_nested_attributes_for :address, :images,:property

  def self.setup
    post = Post.new
    post.create_address
    post.create_property
    post.save
  end
end
