class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
   # @posts = Post.all

   if params[:search]
    outArray = Post.find(:all, :conditions => ['contentSummary LIKE ? OR tags LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%"])
    @posts = Kaminari.paginate_array(outArray).page(params[:page])

   elsif params[:topics]
    outArray = Post.find(:all, :conditions => ['tags LIKE ?', "%#{params[:topics]}%"])
    @posts = Kaminari.paginate_array(outArray).page(params[:page])

   elsif params[:view]
     case params[:view]
      when 'top'
        outArray = Post.where("score >= ?", 2).order("score DESC")
    #    @posts = outArray.page(params[:page]).per(20)
     @posts = Kaminari.paginate_array(outArray).page(params[:page])

      when 'new'
        outArray = Post.where("score = ?", 1).order("score DESC")
        @posts = outArray.page(params[:page]).per(20)

      end
   else
    outArray = Post.where("score >= ?", 3).order("score DESC")
    @posts = outArray.page(params[:page]).per(20)

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
          respond_to do | format |  
            format.json { render :json => @post}
          end
        when 'up'
          @post.increment!(:score)
            respond_to do | format |  
              format.json { render :json => @post}
            end
        when 'down'
          @post.decrement!(:score)
            respond_to do | format |  
              format.json { render :json => @post} 
            end
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
