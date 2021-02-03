json.count Like.where(tweet_id: params[:id]).count
json.flag @like.blank?
