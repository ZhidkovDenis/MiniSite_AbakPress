module PagesHelper
	
	#Возвращает строку, содержащую HTML-код, описывающий поддерево страниц сайта
	#Входные параметры:
	# - pages - набор страниц, служащих корневыми узлами в процессе построения дерева
	def GetPagesTreeHTML(pages)
		htmlResult= "" #переменная для хранения результирующего HTML-кода
		#для каждого объекта-страницы из pages выполнить блок 
		pages.each do |page|
			#сформировать HTML-код ссылки на страницу
			htmlResult+= "<div style='padding-left: 15px;'><a href = /" + page.urlPage + ">" + page.title + "</a></br>"
			#получить все подстраницы текущего просматриваемого объекта
			subpages = page.subpages
			#если подстраницы есть, то вызвать для них GetPagesTreeHTML и дописать результат в htmlResult
			unless subpages.nil?
				htmlResult+=GetPagesTreeHTML(subpages)
			end
			htmlResult+="</div>"
		end
		#вернуть строку результата
		return htmlResult
	end 
end
