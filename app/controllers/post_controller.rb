class PostController < ApplicationController
  def index
    the_post = params.fetch("new_post")
    matching_posts = Posts.all
    @list_of_posts = matching_posts.order({ :created_at => :desc })

    render({ :template => "posts/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_posts = Posts.where({ :id => the_id })

    @the_post = matching_posts.at(0)

    render({ :template => "posts/show.html.erb" })
  end

  def create
    user_id = session.fetch(:first_name)
    #post = params.fetch("new_post")
    post = Post.new
    post.author_id = author_id
    post.content = post
  
    if the_post.valid?
      the_post.save
      redirect_to("/posts", { :notice => "Post created successfully." })
    else
      redirect_to("/posts", { :notice => "Post failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_post = Posts.where({ :id => the_id }).at(0)

    the_post.author = params.fetch("query_author")
    the_post.content = params.fetch("query_post")

    if the_post.valid?
      the_post.save
      redirect_to("/comments/#{the_post.id}", { :notice => "Post updated successfully."} )
    else
      redirect_to("/comments/#{the_post.id}", { :alert => "Post failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_post = Post.where({ :id => the_id }).at(0)

    the_post.destroy

    redirect_to("/posts", { :notice => "Post deleted successfully."} )
  end
end
