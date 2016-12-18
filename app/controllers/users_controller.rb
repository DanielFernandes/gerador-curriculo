class UsersController < ApplicationController
  before_action :set_user, only: [:new, :show, :destroy]
  require './lib/generator_pdf'

  def index
  #  @users = User.all
    self.new
  end

  def show
    @user = User.find(user_params)
  end

  def new
    @user = User.new
    build_models
  end

  def show
    redirect_to '/curriculum.pdf'
  end

  def create
    @user = User.create(user_params)
    export
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: I18n.t('messages.created') }
        format.json { render :show, status: :created, location: @user }
        format.pdf { render pdf: generator_pdf(@user) }
      else
        format.html { render :index }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: I18n.t('messages.destroyed') }
      format.json { head :no_content }
    end
  end

  def export
      GeneratePdf::curriculum(@user.personal_data, @user.phones,@user.idioms,
                              @user.instituitions, @user.complementary_trainnings, @user.about, @user.jobs)

  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def build_models
    @user.build_about
    @user.build_personal_data

    @user.idioms.build
    @user.jobs.build
    @user.complementary_trainnings.build
    @user.instituitions.build
    @user.phones.build

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:id,
                                 phones_attributes: [:id, :phone_user, :_destroy],
                                 :personal_data_attributes => [:id,:name,:age,:cnh,:email,:_destroy],
                                 :idioms_attributes => [:id,:language_idiom,:_destroy],
                                 :instituitions_attributes => [:id,:name_instituition,:graduation,:course,:start_year_grad,:exit_year_grad,:_destroy],
                                 :jobs_attributes => [:id,:employer,:office,:start_year_job,:exit_year_job,:_destroy],
                                 :complementary_trainnings_attributes => [:id,:name_instituition_comp,:course_comp,:workload,:_destroy],
                                 :about_attributes => [:id,:resume,:objective,:_destroy]
                                 )
  end
end
