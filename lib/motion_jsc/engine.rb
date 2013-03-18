class Engine
  def run(js_string)
    script_js = JSStringCreateWithUTF8CString(js_string.UTF8String)
    exception_ptr = Pointer.new(JSValueRef.type)
    result = JSEvaluateScript(js_context, script_js, nil, nil, 0, exception_ptr)
    exception = exception_ptr[0]
    if exception
      return nil
    else
      return nil unless result
      get_ruby_value(result)
    end
  end

  def get_ruby_value(value_ref)
    case JSValueGetType(js_context, value_ref)
    when KJSTypeNumber then
      JSValueToNumber(js_context, value_ref,nil)
    when KJSTypeString then
      js_string_arg = JSValueToStringCopy(js_context, value_ref, nil)
      JSStringCopyCFString(KCFAllocatorDefault, js_string_arg)
    end
  end

  def js_context
    @js_context ||= JSGlobalContextCreate(nil)
  end
end