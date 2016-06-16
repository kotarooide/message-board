class MessagesController < ApplicationController
  def index
    @message = Message.new
    # なんでこれ必要なの？
    @messages = Message.all
  # 　全部渡すの？
  end
  
  def create
    @message = Message.new(message_params)
    # {message: "name", "body"}ってこと？
    if @message.save
      redirect_to root_path , notice: 'メッセージを保存しました'
    # 処理完了メッセージをViewに投げる
    else
      @messages = Message.all
      flash.now[:alert] = "メッセージの保存に失敗しました。"
      render 'index'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
end
