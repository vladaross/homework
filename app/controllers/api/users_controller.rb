module Api
class UsersController < BaseController
  #before_action :check_for_mobile

  # GET /users
  # GET /users.json
  def index
    render json: users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render json: user, serializer: UserSerializer
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

      if @user.save
        render json: user, serializer: UserSerializer, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      if @user.update(user_params)
        render json: user, serializer: UserSerializer
      else
        render json: @user.errors, status: :unprocessable_entity
      end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    render json: {message: "record deleted"}, status: :ok
  end

  def accounts
    render json: user_accounts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def user
      @user = User.find(params[:id])
    end

    def user_accounts
      @user_accounts ||= user.accounts
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
end
