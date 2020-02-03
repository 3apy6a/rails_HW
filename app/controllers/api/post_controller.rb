class Api::PostController < ApiController
  def create
    post_form = PostForm.new(post_params)
    if post_form.save
      render json: { post: post_form.serialized_record }
    else
      render_error post_form.errors.messages
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

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
