class UsersController < ApplicationController
before_action :set_icons

  def show
    @user = User.find(params[:id])
  end

  def follow
    @follow = Follow.find_by(follow_params)
    @follow.blank? ? Follow.new(follow_params).save : @follow.delete
  end

  def set_icons
          @icons = [{link: "/", text: "", class: "fab fa-twitter"},
                    {link: "/", text: "ホーム", class: "fas fa-home"},
                    {link: "/tweets/topic", text: "話題を検索", class: "fas fa-hashtag"},
                    {link: "/tweets/notification", text: "通知", class: "far fa-bell"},
                    {link: "/tweets/message", text: "メッセージ", class: "far fa-envelope"},
                    {link: "/tweets/bookmark", text: "ブックマーク", class: "far fa-bookmark"},
                    {link: "/tweets/list", text: "リスト", class: "far fa-list-alt"},
                    {link: "/users/#{current_user.id if user_signed_in?}", text: "プロフィール", class: "far fa-user"},
                    {link: "/tweets/info", text: "もっと見る", class: "fas fa-info-circle"}]
  end

  private
    def follow_params
      {following_id: current_user.id, followed_by_id: params[:id]}
    end

end#of class
