class EvalResult
  attr :value

  def initialize(context, value_ref)
    @context = context
    set_value(value_ref)
  end

  def successful?
    true
  end

  private
  def set_value(value_ref)
    @value = case JSValueGetType(@context, value_ref)
    when KJSTypeNumber then JSValueToNumber(@context, value_ref, nil)
    when KJSTypeString then
      js_string_arg = JSValueToStringCopy(@context, value_ref, nil)
      JSStringCopyCFString(KCFAllocatorDefault, js_string_arg)
    end
  end
end