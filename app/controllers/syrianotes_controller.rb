class SyrianotesController < ApplicationController 
  before_filter :set_search
  before_action :authenticate_user!, except: [:index, :show] 
  
  def index
    @q = Syrianote.ransack(params[:q])
    @syrianotes = @q.result(distinct: true).order('created_at DESC').paginate(:page => params[:page])

    respond_to do |format|
      format.html
      format.csv { send_data @syrianotes.to_csv }
    end
    
  end

  def show
    @syrianote = Syrianote.find(params[:id])
  end

  def new
    @syrianote = Syrianote.new
  end

  def create
    @syrianote = Syrianote.new(syrianote_params)
    if @syrianote.save
      redirect_to @syrianote
    else
      render 'new'
    end
  end

  def edit
    @syrianote = Syrianote.find(params[:id])
  end

  def update
    @syrianote = Syrianote.find(params[:id])
    if @syrianote.update(syrianote_params)
      redirect_to @syrianote
    else
      render 'edit'
    end
  end

  def delete
    @syriatenote = Syrianote.find(params[:id])
  end

  def destroy
    @syrianote = Syrianote.find(params[:id])
    @syrianote.destroy

    redirect_to syrianotes_path
  end

  private
    def syrianote_params
      params.require(:syrianote).permit(:category, :title, :url, :publisher, :description, :tags, :commentary)
    end

    def set_search
      @q=Syrianote.search(params[:q])
    end    
end
