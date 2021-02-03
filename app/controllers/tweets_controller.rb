class TweetsController < ApplicationController
  before_action :set_icons

  def index
  end

  def notification
  end

  def create
    @tweet=Tweet.new(tweet_params)
    @tweet.save unless params[:tweet][:text].blank?
  end

  def set_icons
    @icons = [{link:"/", text:"", class: "fab fa-twitter"},
              {link:"/", text:"ホーム", class: "fas fa-home"},
              {link:"/tweets/topic", text: "話題を検索", class: "fas fa-hashtag"},
              {link:"/tweets/notification", text: "通知", class: "far fa-bell"},
              {link:"/tweets/message", text: "メッセージ", class: "far fa-envelope"},
              {link:"/tweets/bookmark", text: "ブックマーク", class: "far fa-bookmark"},
              {link:"/tweets/list", text: "リスト", class: "far fa-list-alt"},
              {link:"/users/#{current_user.id}", text: "プロフィール", class: "far fa-user"},
              {link:"/tweets/info", text: "もっと見る", class: "fas fa-info-circle"}]
  end

  def like
    @like = Like.find_by(like_params)
    @like.blank? ? Like.new(like_params).save : @like.delete
  end

  private
  def tweet_params
    params[:tweet].permit(:text).merge(user_id: current_user.id)
  end

  def like_params
    {user_id: current_user.id, tweet_id: params[:id]}
  end

end#ofclass
