class ResponsesController < ApplicationController
  # GET /responses
  # GET /responses.xml
  def index
    @responses = Response.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @responses }
    end
  end

  # GET /responses/1
  # GET /responses/1.xml
  def show
    @response = Response.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @response }
    end
  end

  # GET /responses/new
  # GET /responses/new.xml
  def new
    @blogs = Blog.all
    @response = Response.new
    @blog = Blog.find_by_id(params[:blog_id])
    @response.blog = @blog
    @response.user = current_user
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @response }
    end
  end

  # GET /responses/1/edit
  def edit
    @blogs = Blog.all
    @response = Response.find(params[:id])
    @blog = Blog.find_by_id(params[:blog_id])
  end

  # POST /responses
  # POST /responses.xml
  def create
    @blogs = Blog.all   
    @response = Response.new(params[:response])
    @blog = @response.blog
    respond_to do |format|
      if @response.save
        @response = Response.new
        @response.blog =  @blog
        @response.user = current_user
        # format.html { redirect_to([@response.blog,@response], :notice => 'Response was successfully created.') }
        format.html { render :action => "new" }
        format.xml  { render :xml => @response, :status => :created, :location => @response }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @response.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /responses/1
  # PUT /responses/1.xml
  def update
    @blogs = Blog.all  
    @response = Response.find(params[:id])
    @blog = @response.blog
    respond_to do |format|
      if @response.update_attributes(params[:response])
        # format.html { redirect_to([@response.blog,@response], :notice => 'Response was successfully updated.') }
        format.html { render :action => "edit" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @response.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.xml
  def destroy
    @response = Response.find(params[:id])
    @response.destroy

    respond_to do |format|
      format.html { redirect_to(blog_responses_url) }
      format.xml  { head :ok }
    end
  end
end
