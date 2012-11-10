class SiteshipsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /siteships
  # GET /siteships.json
  def index
    @siteships = Siteship.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @siteships }
    end
  end

  # GET /siteships/1
  # GET /siteships/1.json
  def show
    @siteship = Siteship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @siteship }
    end
  end

  # GET /siteships/new
  # GET /siteships/new.json
  def new
    @siteship = Siteship.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @siteship }
    end
  end

  # GET /siteships/1/edit
  def edit
    @siteship = Siteship.find(params[:id])
  end

  # POST /siteships
  # POST /siteships.json
  def create
    @siteship = Siteship.new(params[:siteship])

    respond_to do |format|
      if @siteship.save
        format.html { redirect_to @siteship, notice: 'Siteship was successfully created.' }
        format.json { render json: @siteship, status: :created, location: @siteship }
      else
        format.html { render action: "new" }
        format.json { render json: @siteship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /siteships/1
  # PUT /siteships/1.json
  def update
    @siteship = Siteship.find(params[:id])

    respond_to do |format|
      if @siteship.update_attributes(params[:siteship])
        format.html { redirect_to @siteship, notice: 'Siteship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @siteship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /siteships/1
  # DELETE /siteships/1.json
  def destroy
    @siteship = Siteship.find(params[:id])
    @siteship.destroy

    respond_to do |format|
      format.html { redirect_to siteships_url }
      format.json { head :no_content }
    end
  end
end
