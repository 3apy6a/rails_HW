class CommentForm
  include ActiveModel::Model

  ATTRIBUTES = [ :body ]

  attr_accessor :comment, :success
  attr_accessor *ATTRIBUTES

  validates_presence_of ATTRIBUTES

  def initialize(attributes, comments = Comment.new)
    self.post = comments

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
    post.update!(comment_attributes)
  end

  def comment_attributes
    ATTRIBUTES.map { |attr| [attr, send(attr)] }.to_h
  end
end