class ListsController < ApplicationController
  def new
    @list=List.new
  end

  def create
    @list=List.new(list_params)#データを受け取り新規登録するインスタンス
    if @list.save
      redirect_to list_path(@list.id)
    else
      render:new
    end
  end

  def index
    @lists=List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list =List.find(params[:id])
  end

  def update
    list=List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list=List.find(params[:id])
    list.destroy
    redirect_to"/lists"
  end

  private
  #ストロングパラメータ
  #以下controller内でのみ呼び出せる
  def list_params
    params.require(:list).permit(:title,:body,:image)
    #params formから送られてくるデータが入る
  #require 送られてきたデータの中からモデル名
  #(今回はlist)を指定し、データを絞りこむ
  #permit requireで絞り込んだデータの中から保存を許可する
  #カラムを指定する
  end
end
