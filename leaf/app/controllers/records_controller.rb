class RecordsController < ApplicationController
  def index
  	@records = Record.all
  end

  def new
  	@record = Record.new
  end

 #  def create
 #  	@record = Record.new(record_params)
	# @record.save
	# @memo = Memo.new(record_params[:memos_attributes])
	# @memo.save
	# redirect_to records_path
 #  end
  def create
  	@record = Record.new(record_params)
	  @record.save
  	redirect_to records_path
  end

  def edit
  	@record = Record.find(params[:index])
  end

  private
    def record_params
      params.require(:record).permit(:date)
    end
end
