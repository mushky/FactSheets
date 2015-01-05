class IraqnotesController < ApplicationController
  def index
    @iraqnotes = Iraqnote.all
  end

  def show
    @iraqnote = Iraqnote.find(params[:id])
  end

  def new
    @iraqnote = Iraqnote.new
  end

  def create
    @iraqnote = Iraqnote.new(iraqnote_params)
    if @iraqnote.save
      redirect_to iraqnotes_path
    else
      render 'new'
    end
  end

  def edit
    @iraqnote = Iraqnote.find(params[:id])
  end

  def update
    @iraqnote = Iraqnote.find(params[:id])
    if @iraqnote.update(iraqnote_params)
      redirect_to iraqnotes_path
    else
      render 'edit'
    end
  end

  def destroy
    @iraqnote = Iraqnote.find(params[:id])
    @iraqnote.destroy

    redirect_to iraqnotes_path
  end

  private
    def iraqnote_params
      params.require(:iraqnote).permit(:category, :title, :url, :publisher, :description, :tags)
    end
end
