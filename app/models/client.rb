require 'js_script_generator'
class Client < User::Base

  devise :registerable

  embeds_many :inquires, order: :created_at.desc

  has_many :operators

  def script
    JsScriptGenerator.get self.id
  end
end
