class IraqnotesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:search]
      @iraqnotes = Iraqnote.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    else
      @iraqnotes = Iraqnote.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 7)
    end
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
