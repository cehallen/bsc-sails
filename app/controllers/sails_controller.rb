class SailsController < ApplicationController
  def index
    @sails = Sail.all
  end

  def show
    @sail = Sail.find(params[:id])
  end

  def new
    @sail = Sail.new
  end

  def create
    @sail = Sail.new(sail_params)
    if @sail.save
      redirect_to sails_path, notice: "Created sail.  Please ensure you provided, at minimum, contact details and a time."
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
