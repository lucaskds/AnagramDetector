class MatchesController < ApplicationController
  def new
  	
  end

  def index
  	@posts = Match.all
  end

  def create
    @post = Match.new(post_params)
  	@post.match = detect_anagram(@post.str_1, @post.str_2)
  	@post.save
  	redirect_to @post
  end

  def show
  	@post = Match.find(params[:id])
  end

  private
  def post_params
  	params.require(:post).permit(:str_1, :str_2, :match)
  end
  
  def detect_anagram(arr_1, arr_2)
    arr_1.downcase.tr('^0-9a-z\u00C0-\u00C4\u00C7-\u00CF\u00D1-\u00D6\u00D9-\u00DDẼĨŨ\u00E0-\u00E4\u00E7-\u00EF\u00F1-\u00F6\u00F9-\u00FDẽĩũ', '').split("").sort == arr_2.downcase.tr('^0-9a-z\u00C0-\u00C4\u00C7-\u00CF\u00D1-\u00D6\u00D9-\u00DDẼĨŨ\u00E0-\u00E4\u00E7-\u00EF\u00F1-\u00F6\u00F9-\u00FDẽĩũ', '').split("").sort
  end
end
