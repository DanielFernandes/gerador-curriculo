class HomesController < ApplicationController
  before_action :set_user, only: [:new,:show, :edit, :update, :destroy]

  def index
    @users = User.all
    _new
  end

  def show
    @user = User.find(user_params)
  end

  def new
    @user = User.new
    build_models
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: I18n.t('messages.created') }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
def destroy
  @user.destroy
  @phones.destroy
  @idioms.destroy
  @personal_data.destroy
  respond_to do |format|
    format.html { redirect_to users_path, notice: I18n.t('messages.destroyed') }
    format.json { head :no_content }
  end
end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def build_models
    @user.build_personal_data
    @user.idioms.build
    @user.phones.build
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:phones_attributes => [:id, :phone_user, :_destroy],
                                 :personal_data_attributes => [:id,:name,:age,:cnh,:email, :_destroy],
                                 :idioms_attributes => [:id,:language_idiom, :_destroy])
  end
end
