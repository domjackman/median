module ApplicationHelper

	def md(text)
		if text.present?
			RDiscount.new(text).to_html.html_safe
		else
			""
		end
	end

end
