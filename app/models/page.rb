class Page < ActiveRecord::Base
  #Установить связи: родительская страница - много подстраниц; одна подстраница - одна родительская страница
  has_many :subpages, :class_name => 'Page', :foreign_key => 'parentID'
  belongs_to :parentpage, :class_name => 'Page', :foreign_key => 'parentID'

  #Валидация атрибута :name (имени страницы):
  #- не может быть пустым
  #- может содержать только русские, латинские символы, цифры и символ подчеркивания (_)
  validates :name, :presence => {:message => " - Имя страницы должно быть задано!"}, 
  :format => { :with => /^[_a-zA-Z0-9А-Я-а-я]+$/,:message => " - Имя страницы может содержать только символы русского и
   латинского алфавита, цифры и символ подчеркивания (_)" } 

  #Валидация атрибута :title (название страницы):
  #- не может быть пустым
  validates :title, :presence => {:message => " - Название страницы должно быть задано!"} 

  #Валидация атрибута :urlPage (адреса страницы):
  #- должен быть уникальным
  validates :urlPage, :uniqueness => {:message => " - Подстраница с указанным именем уже существует в просматриваемом 
    уровне иеархии (адрес: %{value})"}

  #Возвращает дочерние страницы, непосредственно принадлежащие заданной родительской странице
  #Параметры: parentID - идентификатор родительской страницы
  def self.GetChildren(parentID)
  	if parentID.nil?
  		Page.find(:all, :conditions => "parentID IS NULL")
  	else
  		Page.find(:all, :conditions => ["parentID = ?", parentID] )
  	end
  end
end
