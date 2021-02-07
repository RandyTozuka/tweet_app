json.count Follow.where(followed_by_id: params[:id]).count
json.flag @follow.blank?
