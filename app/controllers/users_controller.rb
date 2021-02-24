class UsersController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json
    end
  end

  def index
    return nil if params[:keyword] == ""
    @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(10)
    respond_to do |format|
      format.html
      format.json
    end
  end
end
