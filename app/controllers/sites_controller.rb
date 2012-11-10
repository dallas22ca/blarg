class SitesController < ApplicationController
  before_filter :authenticate_user!, except: :show
  layout :choose_layout
  
  # GET /sites
  # GET /sites.json
  def index
    if current_user.admin
      @sites = Site.all
    else
      @sites = current_user.sites
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sites }
    end
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
    @site = current_site
    @page = @site.pages.first

    respond_to do |format|
      format.html { render collection: @page }
      format.json { render json: @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.json
  def new
    @site = current_user.sites.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site }
    end
  end

  # GET /sites/1/edit
  def edit
    @site = Site.find_by_permalink(params[:id])
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = current_user.sites.new(params[:site])

    respond_to do |format|
      if @site.save
        format.html { redirect_to root_url(subdomain: @site.permalink), notice: 'Site was successfully created.' }
        format.json { render json: @site, status: :created, location: @site }
      else
        format.html { render action: "new" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sites/1
  # PUT /sites/1.json
  def update
    @site = Site.find_by_permalink(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:site])
        format.html { redirect_to sites_path, notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site = Site.find_by_permalink(params[:id])
    @site.destroy

    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :no_content }
    end
  end

private

  def choose_layout
    if action_name == "show"
      "site"
    else
      "application"
    end
  end
  
end
