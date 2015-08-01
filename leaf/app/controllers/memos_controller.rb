class MemosController < ApplicationController
	def new
		@record = Record.find(params[:record_id])
		@memo = @record.build_memo
	end

	def create
        @record = Record.find(params[:record_id])
        # binding.pry
        @memo = @record.create_memo(memo_params)
        # binding.pry
        redirect_to records_path
    end

	def edit
		# binding.pry
		@memo = Memo.find(params[:id])
	end

	def update
		@memo = Memo.find(params[:id])
		@memo.update(memo_params)
        redirect_to records_path
	end

	private
		def memo_params
			params.require(:memo).permit(:sentence)
		end
end
