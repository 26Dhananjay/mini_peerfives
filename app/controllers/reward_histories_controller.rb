class RewardHistoriesController < ApplicationController
  def index_p5
    @user = User.find(params[:id])
    @p5_histories = @user.given_rewards
  end

  def index_rewards
    @user = User.find(params[:id])
    @reward_histories = @user.received_rewards
  end

  def new
    @user = User.find(params[:id])
    @other_users = User.where.not(id: @user.id)
  end

  def create
    giver = User.find(params[:giver_id])
    receiver = User.find(params[:receiver_id])
    points = params[:points].to_i

    if giver.p5_balance >= points
      RewardHistory.create!(datetime: Time.now, points: points, given_by: giver.id, given_to: receiver.id)
      giver.update!(p5_balance: giver.p5_balance - points)
      receiver.update!(reward_balance: receiver.reward_balance + points)
      redirect_to user_path(giver), notice: 'Reward given successfully!'
    else
      redirect_back fallback_location: root_path, alert: 'Insufficient balance!'
    end
  end

  def destroy
    reward = RewardHistory.find(params[:id])
    giver = reward.giver
    receiver = reward.receiver

    giver.update!(p5_balance: giver.p5_balance + reward.points)
    receiver.update!(reward_balance: receiver.reward_balance - reward.points)
    reward.destroy

    redirect_back fallback_location: root_path, notice: 'Reward reversed!'
  end
end
