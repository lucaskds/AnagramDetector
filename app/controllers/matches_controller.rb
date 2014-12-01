require 'i18n'

class MatchesController < ApplicationController
  def new
  end

  def index
  	@matches = Match.all #Show all matches
  end

  def create
    @post = Match.new(post_params)                         #Get post params
  	@post.match = detect_anagram(@post.str_1, @post.str_2) #Compare str_1 and str_2
  	@post.save                                             #Save the strings and the result of match in the database
  	redirect_to @post                                      #Redirect to show
  end

  def show
  	@post = Match.find(params[:id]) #Show params of post
  end

  private
  def post_params
  	params.require(:post).permit(:str_1, :str_2, :match)  #Strong parameters definition
  end
  
  def detect_anagram(arr_1, arr_2)
    arr_1 = I18n.transliterate(arr_1.tr('ẽẼ','eE')) #Transform all modified characters in their simple version
    arr_2 = I18n.transliterate(arr_2.tr('ẽẼ','eE')) #such as ç -> c / ã -> a...
    arr_1.downcase.tr('^0-9a-z', '').split("").sort == arr_2.downcase.tr('^0-9a-z', '').split("").sort #Downcase all chars, eliminate spaces and others
  end                                                                                                  #symbols, put it all in an array, sort and compare
end
