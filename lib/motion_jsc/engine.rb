class Engine
  def run(js_string)
    script_js = JSStringCreateWithUTF8CString(js_string.UTF8String)
    exception_ptr = Pointer.new(JSValueRef.type)
    exception = exception_ptr[0]
    result = JSEvaluateScript(js_context, script_js, nil, nil, 0, exception)
    return nil unless result
    if exception
      return nil
    else
      js_string_arg = JSValueToStringCopy(js_context, result, nil)
      return JSStringCopyCFString(KCFAllocatorDefault, js_string_arg)
    end
  end

  def js_context
    @js_context ||= JSGlobalContextCreate(nil)
  end
end