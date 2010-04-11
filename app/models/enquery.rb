class Enquery
  attr_accessor :name, :email, :phone, :content, :post

  def initialize(post)
    @name = @email = @phone = @content = ""
    @post = post
  end

  def deliver_enquery!
    Notifier.deliver_enquery(self)
  end
end