# -*- coding: utf-8 -*-
class UsersController < ApplicationController

 def new
  @user = User.new
  @title = "Sign up"
 end

 def create
  #raise params.inspect
  @user = User.new(params[:user])
  if  @user.save
    sign_in @user
    #handle a successful save
    flash[:success] = "Welcome to the Sample App!"
    redirect_to @user, :flash => { :success => "Welcome to the Sample App!"}
  else
    @title ="Sign up"
    render 'new'
  end
 end

 def show
  @user = User.find(params[:id])
  @title = @user.name
 end

 def try
  @title = "try"
 end


 def edit
  @user = User.find(params[:id])
  @title = "Edit user"
 end

 def update
   @user = User.find(params[:id])
   @title = "Edit user"
   render 'edit'
 end
 

end

