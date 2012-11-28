class BoardsController < ApplicationController
  layout 'my_original', :only => [:new, :create]
  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all
    @users = User.all
    p @users

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

    @user = User.new
    #@user = User.new(params[:contribute][:user_id])
    #@user.user_id = params[:contribute][:user_id]
    @user.name = params[:contribute][:user]

    @search = User.where(:name => @user.name)
    p @search.class.name
    p "tessssssssssssssssssssssssssssssssssssssst"

    if @search.empty? && @user.save then
      p "okkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"
    else
      p "not okkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"
      #render :text => "invalid username" and return false
      render :text => "invalid username" and return false
    end
    p @search

=begin
    if @user.save
    else
      render :text => "invalid username"
      return
    end
=end

    @board.user_id = @user.id
    #@board.user_id = params[:contribute][:user_id]
    @board.title = params[:contribute][:title]
    @board.comment = params[:contribute][:comment]
    @board.d_time = Time.now

    if @board.save
      redirect_to :action => "index"
      #render :action => "index"
    else
      render :text => "invalid title or comment"
    end
    #@board.save
    
    p params[:contribute]
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

