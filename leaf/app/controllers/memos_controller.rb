class MemosController < ApplicationController
	def new
	end

	def create
    end

	private
		def memo_params
			params.require(:memo).permit(:text)
		end
end
