class PagesController < ApplicationController
  before_action :set_user, only: [:saveform, :userhome]
  before_action :authenticate_user!, only: [:userhome, :userform, :avance]
  before_action :authenticate_admin!, only: [:adminhome, :reporte, :postsreport]

  def adminhome
  end

  def userhome
  	@program = Program.find(@user.program)
  	@project = Project.find(@user.project)
  end

  def userform
  	@user = current_user
  end

  def reporte
  	@users = User.all
  end

  def avance
    @post = Post.new
  end

  def postsreport
    @posts = Post.all
  end

  def saveform
  	respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to '/home', notice: 'Información guardada correctamente' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def savepost
    @post = Post.new(post_params)
    @post.user_id = User.find(current_user).id

    respond_to do |format|
      if @post.save
        format.html { redirect_to '/home', notice: 'Avance subido correctamente' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
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

    def post_params
      params.require(:post).permit(:description, :image)
    end

end
