class DatabasesController < ApplicationController
  def new
    @db = Database.new
  end
  def index
    @dbs = Database.all
  end

  def create
    @db = Database.new(database_params)
    if @db.save
      redirect_to @db
    else
      render 'new'
    end
  end
  def show
    @db = Database.find(params[:id])
    respond_to do |format|
      format.html
      format.json{render json: @db}
    end
  end

  def edit
    @db = Database.find(params[:id])
  end
  def update
    @db = Database.find(params[:id])

    if @db.update(database_params)
      redirect_to @db
    else
      render 'edit'
    end
  end

  private
  def database_params
    params.required(:database).permit(:name,:host, :dbschema)
  end

end
