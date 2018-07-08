class CommentsController < ApplicationController

	def create
		@message = Message.find(params[:message_id])
		@comment = @message.commants.create(comment_params)
		@comment.user_id = current_user_id

		if @comment.save
			redirect_to message_path
		else
			render 'new'
		end
	end

	private

	def comment_params
		params.require(:commant).permit(:content)
	end
end
