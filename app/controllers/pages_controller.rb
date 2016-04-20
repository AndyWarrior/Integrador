class PagesController < ApplicationController
  before_action :set_user, only: [:saveform]
  before_action :authenticate_user!, only: [:userhome, :userform]
  before_action :authenticate_admin!, only: [:adminhome]

  def adminhome
  end

  def userhome
  end

  def userform
  	@user = current_user
  end

  def saveform
  	respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to '/home', notice: 'Program was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(current_user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :street, :neighborhood,
									:city, :state, :zip_code, :telephone,
									:people_living, :rooms, :wall_material, :roof_material,
									:floor_material, :build_yourself, :store)
    end

end
