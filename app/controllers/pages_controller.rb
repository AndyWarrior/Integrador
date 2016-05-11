class PagesController < ApplicationController
  before_action :set_user, only: [:saveform, :userhome, :advance]
  before_action :authenticate_user!, only: [:userhome, :userform, :avance, :advance]
  before_action :authenticate_admin!, only: [:adminhome, :reporte, :postsreport]

  def adminhome
  end

  def userhome
    @program = Program.find_by_id(@user.program)
  	@project = Project.find_by_id(@user.project)
    if @project != nil then
      @phases = @project.phases.sort_by &:numphase

      if @phases.size > 0 then
        @steps = @phases[@user.phase].steps.sort_by &:numstep
      end
    end
  end

  def advance
    program = Program.find(@user.program)
    project = Project.find(@user.project)
    phases = project.phases.sort_by &:numphase
    steps = []
    phases.each do |phase|
      steps.push(phase.steps.sort_by &:numstep)
    end

    if steps[@user.phase][@user.step + 1] != nil then
      @user.update(step: @user.step + 1)
    elsif steps[@user.phase + 1] != nil then
      @user.update(phase: @user.phase + 1)
      @user.update(step: 0)
    end
      
    
    respond_to do |format|
      format.html { redirect_to '/home', notice: 'Has avanzado de paso!' }
    end
  end

  def userform
  	@user = current_user
  end

  def reporte
  	@users = User.all
    @users = @users.page params[:page]

    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "usuarios-#{Date.today}.csv" }
    end
  end

  def avance
    @post = Post.new
  end

  def postsreport
    @posts = Post.all
    @posts = @posts.page params[:page]
  end

  def saveform
    if @user.sign_in_count == 1 then
       @user.phase = 0
       @user.step = 0
    end

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

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
        redirect_to admin_report_path, notice: "Usuario eliminado."
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
