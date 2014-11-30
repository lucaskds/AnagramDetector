require 'i18n'

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
    arr_1 = I18n.transliterate(arr_1.tr('ẽẼ','eE'))
    arr_2 = I18n.transliterate(arr_2.tr('ẽẼ','eE'))
    arr_1.downcase.tr('^0-9a-z', '').split("").sort == arr_2.downcase.tr('^0-9a-z', '').split("").sort
  end
end
