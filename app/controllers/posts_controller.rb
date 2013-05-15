class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
   # @posts = Post.all

   if params[:search]
    @posts = Post.find(:all, :conditions => ['contentSummary LIKE ? OR tags LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%"])
   
   elsif params[:topics]
    @posts = Post.find(:all, :conditions => ['tags LIKE ?', "%#{params[:topics]}%"])
   
   elsif params[:view]
     case params[:view]
      when 'top'
        @posts = Post.where("score >= ?", 2).order("score DESC").limit(15)
      when 'new'
        @posts = Post.where("score = ?", 1).order("score DESC").limit(100)
      end
   else
    @posts = Post.where("score >= ?", 3).order("score DESC").limit(10)
   end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end


#def search
#  @post = Post.search params[:search]
#end



  # PROBABLY BEST TO HAVE A SEPERATE INDEX TO FIND BY TAG

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
      @post = Post.find(params[:id])
    if params[:vote]
        case params[:vote]
        when 'junk'
          @post.update_attribute(:score, 0)
        when 'up'
          @post.increment!(:score)
        when 'down'
          @post.decrement!(:score)
        end
      end
          respond_to do |format|
            case params[:view] #THIS IS STILL BROKEN - FIX IT!
            when 'new'
                render :template => 'posts#view=new'
                format.json { head :no_content }
            when 'top'
                format.html { redirect_to posts_url, notice: 'Post was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { redirect_to posts_url, notice: 'Post was successfully updated.' }
                format.json { head :no_content }
            end

      end 
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

          respond_to do |format|
       @post.update_attributes(params[:post])
        format.html { redirect_to posts_url, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      end   
  end

=begin

  def up_vote
    @post = Post.find(params[:id])
    if @post.increment!(:score)
   respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
      end
    end
  end

    def down_vote
    @post = Post.find(params[:id])
    if @post.decrement!(:score)
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
      end
    end
  end

    def junk
    @post = Post.find(params[:id])
    if @post.update_attribute(:score, 0)
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
      end
    end
  end


=end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
