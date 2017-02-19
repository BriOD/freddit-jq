class ConversationsController < ApplicationController
  before_action :verify_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @conversations = Conversation.order(sort_column: :desc).page(params[:page])
  end

  def show
    @conversation = Conversation.find_by_id(params[:id])
  end

  def new
    @conversation = current_user.conversations.build
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def conversation_params
    params.require(:conversation).permit(:topic, comments_attributes: [:body])
  end
end
