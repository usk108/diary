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

	def search
	    keyword = params[:keyword]
	    @memos = Memo.search(:sentence_cont => keyword).result

		#@result = Nokogiri::XML::Node::new('div', search_html)

		res_html = "<h2>#{keyword}-検索結果</h2>"
		@result = Nokogiri::HTML.parse(res_html)
		res_title = @result.at_xpath('//h2')

		# @result = Nokogiri.XML("<div></div>")
		@memos.map{|m|
			html = ApplicationController.helpers.markdown m.sentence
			doc = Nokogiri::HTML.parse(html)
			# 検索対象のxpathを指定する（完全一致）
			(doc/'//*/text()').select{|t| t.text == keyword}.map{|t| @d_path = t.path}
			path = @d_path.gsub(/\/text\(\)/,"")
			d = doc.at_xpath(path)
			@nextSib = d.next_sibling
			while d.name != @nextSib.name do
				res_title.add_next_sibling(@nextSib)
				res_title = @nextSib
				@nextSib = d.next_sibling
				# binding.pry
			end
			res_title.add_next_sibling "<p class='memo_date'>#{m.record.date.year}年#{m.record.date.month}月#{m.record.date.day}日</p>"
			res_title = res_title.next_sibling
			res_title.add_next_sibling "<hr>\n"
			res_title = res_title.next_sibling
		}

		full_html = @result.inner_html
		@result_html = full_html.gsub(/<html><body>|<\/body><\/html>/,"")
	end

	private
		def memo_params
			params.require(:memo).permit(:sentence)
		end
end
