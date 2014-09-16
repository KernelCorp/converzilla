require 'js_script_generator'
class Client < User::Base

  devise :registerable

  has_many :inquires, order: :created_at.desc, dependent: :destroy
  has_many :operators

  accepts_nested_attributes_for :inquires

  def script
    JsScriptGenerator.get(self.id)
  end
end
