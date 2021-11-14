class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :about]
# 初期設定では用意されていないカラム（name）をusersテーブルに追加
# devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
      user_path(resource)
  end
  
  protected

  def configure_permitted_parameters
    #   ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作が許可されます
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end