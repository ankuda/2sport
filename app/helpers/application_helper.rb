module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["class"] = "hide"
    end
    content_tag("div", attributes, &block)
  end

  def object(obj, attr)
    obj.new_record? ? obj.send("build_#{attr}") : obj.send(attr)
  end
end
