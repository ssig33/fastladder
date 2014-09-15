class OreoreapiController < ApplicationController
  def hatebu_comment
    json = nil
    timeout(2){
      json = JSON.parse open("http://b.hatena.ne.jp/entry/json/?url=#{CGI.escape params[:link]}").read
    }
    html = json['bookmarks'].map{|x|
      if !x['comment'].blank?
        "<b>#{x['user']}</b>: #{x['comment']}</br>"
      else
        ""
      end
    }.join("\n")
    html = "<p>#{html}</p>"
    render json: {id: params[:id], html: html}
  rescue 
    render json: {id: params[:id], html: nil}
  end
end
