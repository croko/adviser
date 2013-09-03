class Admin::AdvisesController < Admin::BaseController
  before_action :set_advise, only: [:show, :edit, :update, :destroy]

  def index
    if params[:q].present? && params[:q][:processed_eq] == '1'
      @q = Advise.search(params[:q])
    else
      @q = Advise.unprocessed.search(params[:q])
    end
    @advises = @q.result.page(params[:page]).sorted.per(25)
  end

  def show
  end

  def new
    @advise = Advise.new
  end

  def edit
  end

  def create
    @advise = Advise.new(advise_params)

    respond_to do |format|
      if @advise.save
        format.html { redirect_to [:admin, @advise], notice: 'Advise was successfully created.' }
        format.json { render action: 'show', status: :created, location: @advise }
      else
        format.html { render action: 'new' }
        format.json { render json: @advise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advises/1
  # PATCH/PUT /advises/1.json
  def update
    respond_to do |format|
      if @advise.update(advise_params)
        format.html { redirect_to [:admin, @advise], notice: 'Advise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @advise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advises/1
  # DELETE /advises/1.json
  def destroy
    @advise.destroy
    respond_to do |format|
      format.html { redirect_to admin_advises_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_advise
    @advise = Advise.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def advise_params
    params.require(:advise).permit(:category_id, :last_name, :name, :full_name, :specialty, :city, :phone_number,
                                   :pediatric, :description, :idoctor, :iclinic)
  end
end
