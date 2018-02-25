class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]
  def index
    @contents = Content.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 4)
  end


  def show
  end


  def new
    @content = current_user.contents.build
  end


  def edit
  end


  def create
    @content = current_user.contents.build(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Contenuto creato con successo.' }
      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to @content, notice: 'Contenuto aggiornato con successo.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: 'Contenuto cancellato con successo.' }
    end
  end

  private

    def set_content
      @content = Content.friendly.find(params[:id])
    end


    def content_params
      params.require(:content).permit(:titolo, :descrizione, :prezzo, :cover, :allegato)
    end

    def check_user
      if current_user != @content.user
        redirect_to root_url, alert:"Scusa ma non hai l'autorizzazione a questa pagina"
      end
    end
end
