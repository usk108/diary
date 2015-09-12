class RecordsController < ApplicationController
  def index
    @records = Record.order("id DESC").limit(7).page(params[:page])
  end

  def new
  	# @record = Record.new
    #  @memo = @record.build_memo
    # redirect_to action: 'create'
    @record = Record.create(date: Time.now)
    redirect_to "/records/#{@record.id}/memos/new"
  end

  def create
    # @record = Record.new(record_params)
    # @record.save
    @record = Record.create(date: Time.now)
  	# redirect_to records_path
    # redirect_to controller: 'memos', :action => "new", :id => @record.id
    binding.pry
    redirect_to "/records/#{@record.id}/memos/new"
  end

  def edit
  	@record = Record.find(params[:index])
  end

  private
    def record_params
      params.require(:record).permit(:date)
    end
end
