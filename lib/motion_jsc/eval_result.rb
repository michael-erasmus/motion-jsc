class EvalResult
  attr :value
  attr :exception

  def initialize(context, value_ref, exception)
    @context = context
    @value = get_value(value_ref)
    @exception = get_value(exception) || exception if exception
  end

  def successful?
   @exception.nil?
  end

  private
  def get_value(value_ref)
    case JSValueGetType(@context, value_ref)
    when KJSTypeNumber then JSValueToNumber(@context, value_ref, nil)
    when KJSTypeString then
      js_string_arg = JSValueToStringCopy(@context, value_ref, nil)
      JSStringCopyCFString(KCFAllocatorDefault, js_string_arg)
    end
  end
end