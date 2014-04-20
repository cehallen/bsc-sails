class SailsController < ApplicationController
  def index
    @sails = Sail.all
  end

  def show
    @sail = Sails.find(params[:id])
  end

  def new
    @sail = Sail.new
  end

  def create
    @sail = Sail.new(params[:sail])
    if @sail.save
      redirect_to @sail, notice: "Created sail."
    else
      render :new
    end
  end

  def edit
    @sail = Sail.find(params[:id])
  end

  def update
    @sail = Sail.find(params[:id])
    if @sail.update_attributes(params[:sail])
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
end
