class PostForm
  include ActiveModel::Model

  ATTRIBUTES = [ :title, :body, :author_id ]

  attr_accessor :post, :success
  attr_accessor *ATTRIBUTES

  validates_presence_of ATTRIBUTES

  def initialize(attributes, post = Post.new)
    self.post = post

    super(attributes)
  end

  def save
    #Valid will setup the Form object errors
    if valid?
      persist!
      self.success = true
    else
      self.success = false
    end
  rescue ActiveRecord::RecordInvalid => e
    self.errors.add(:base, e.message)
    self.success = false
  end

  def serialized_record
    post.slice(*ATTRIBUTES)
  end

  private

  def persist!
    post.update!(post_attributes)
  end

  def post_attributes
    ATTRIBUTES.map { |attr| [attr, send(attr)] }.to_h
  end
end