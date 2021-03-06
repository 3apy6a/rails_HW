class Api::UserController < ApiController
   def create
    user_form = UserForm.new(user_params)

    if user_form.save
      render json: { user: user_form.serialized_record }
    else
      render_error user_form.errors.messages
    end
  end

  def destroy
    render json: { action: action_name }
  end

  def update
    render json: { action: action_name }
  end

  def show
    render json: { action: action_name }
  end

   def user_params
     params.require(:user).permit(UserForm::ATTRIBUTES)
   end
end
