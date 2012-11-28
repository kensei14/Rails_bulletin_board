class BoardsController < ApplicationController
  layout 'my_original', :only => [:new, :create]
  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @boards }
    end
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
    @board = Board.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @board }
    end
  end

  # GET /boards/new
  # GET /boards/new.json
  def new
    @board = Board.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @board }
    end
  end

  # GET /boards/1/edit
  def edit
    @board = Board.find(params[:id])
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new
    @search = User.where(:name => params[:contribute][:user])

    if !@search.empty? then
      @board.user_id = @search[0].id
      @board.title = params[:contribute][:title]
      @board.comment = params[:contribute][:comment]
      @board.d_time = Time.now

      if @board.save then
        redirect_to :action => "index" and return true
      else
        render :text => "invalid contribution" and return false
      end
    else
      render :text => "unknown user name" and return false
    end
  end

  # PUT /boards/1
  # PUT /boards/1.json
  def update
    @board = Board.find(params[:id])

    respond_to do |format|
      if @board.update_attributes(params[:board])
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board = Board.find(params[:id])
    @board.destroy

    respond_to do |format|
      format.html { redirect_to boards_url }
      format.json { head :no_content }
    end
  end

end

