class MicropostsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy


    def create
      @micropost = current_user.microposts.build(micropost_params)
      @micropost.image.attach(params[:micropost][:image])
      if @micropost.save
        flash[:success] = "Micropost created!"
        redirect_to current_user
      else
        @feed_items = current_user.feed.paginate(page: params[:page])
        render 'users/show'
      end
    end

    def destroy
      @micropost.destroy
      flash[:success] = "Micropost deleted"
      if request.referrer.nil? || request.referrer == microposts_url
        redirect_to current_user
      else
        redirect_to request.referrer
      end
    end

    private

    def micropost_params
      params.require(:micropost).permit(:content, :image)
    end

      def correct_user
        @micropost = current_user.microposts.find_by(id: params[:id])
        redirect_to current_user if @micropost.nil?
      end

end
