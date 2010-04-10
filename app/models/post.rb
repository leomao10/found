class Post < ActiveRecord::Base
  STATUS = %w[incomplete paid overdue]

  has_one :address, :dependent => :destroy
  has_one :property, :dependent => :destroy
  has_many :images, :dependent => :destroy
  
  belongs_to :user

  def self.setup
    post = Post.new
    post.save
    return post
  end
end