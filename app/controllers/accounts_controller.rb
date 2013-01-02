class AccountsController < ApplicationController

  def create
    if @account = Account.create
      render 'accounts/show', :status => 201
    else
      render :text => 'error', :status => 400
    end
  end

  def show
    @account = Account.find(params[:id])
    render 'accounts/show'
  end

end
