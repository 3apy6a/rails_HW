class CommentForm
  include ActiveModel::Model

  ATTRIBUTES = [ :body, :author_id ]

  attr_accessor :comment, :success
  attr_accessor *ATTRIBUTES

  validates_presence_of ATTRIBUTES

  def initialize(attributes, comment = Comment.new)
    self.comment = comment

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
    comment.slice(*ATTRIBUTES)
  end

  private

  def persist!
    comment.update!(comment_attributes)
  end

  def comment_attributes
    ATTRIBUTES.map { |attr| [attr, send(attr)] }.to_h
  end
end