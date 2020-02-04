class Api::CommentController < ApplicationController
  def create
    comment_form = CommentForm.new(comment_params)
    if comment_form.save
      render json: { post: comment_form.serialized_record }
    else
      render_error comment_form.errors.messages
    end
  end

  def show
    render json: { action: action_name }
  end

  def destroy
    render json: { action: action_name }
  end

  def update
    render json: { action: action_name }
  end

  def comment_params
    params.require(:comment).permit( :body, :author_id)
  end
end
