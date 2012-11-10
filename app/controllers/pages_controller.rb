class PagesController < ApplicationController
  before_filter :authenticate_user!, except: :show
  layout :choose_layout
  
  # GET /pages
  # GET /pages.json
  def index
    @pages = current_site.pages

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = current_site.pages.find_by_permalink(params[:id])
    
    if @page == current_site.pages.first
      redirect_to root_url(subdomain: current_site.permalink), :status => 301
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @page }
      end
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = current_site.pages.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = current_site.pages.find_by_permalink(params[:id])
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = current_site.pages.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to quick_page_path(@page), notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = current_site.pages.find_by_permalink(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to quick_page_path(@page), notice: 'Page was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = current_site.pages.find_by_permalink(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
      format.js
    end
  end
  
  def sort
    i = 0
    params[:page].each do |k, v|
      v = nil if v == "null"
      Page.update_all({ ordinal: i, parent_id: v }, { id: k })
      i += 1
    end
    render nothing: true
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
