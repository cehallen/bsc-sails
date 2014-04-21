class SailsController < ApplicationController
  def index
    @sails = Sail.all
    @sails_by_date = @sails.group_by(&:when)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  # def index
  #   @articles = Article.all
  #   @articles_by_date = @articles.group_by(&:published_on)
  #   @date = params[:date] ? Date.parse(params[:date]) : Date.today
  # end

  def show
    @sail = Sail.find(params[:id])
  end

  def new
    @sail = Sail.new
  end

  def create
    @sail = Sail.new(sail_params)
    if @sail.save
      redirect_to @sail, notice: "Created sail.  Please ensure you provided, at minimum, contact details and a time."
    else
      render :new
    end
  end

  def edit
    @sail = Sail.find(params[:id])
  end

  def update
    @sail = Sail.find(params[:id])
    if @sail.update(sail_params)
      redirect_to @sail, notice: "Updated sail."
    else
      render :edit
    end
  end

  def destroy
    @sail = Sail.find(params[:id])
    @sail.destroy
    respond_to do |format|
      format.html { redirect_to sails_url, 
        notice: 'Deleted successfully' }
      format.json { head :no_content }
    end
  end

  private

  def sail_params
    params.require(:sail)
      .permit(:title, :when, :details)
  end
end
