class Engine
  def run(js_string)
    script_js = JSStringCreateWithUTF8CString(js_string.UTF8String)
    exception_ptr = Pointer.new(JSValueRef.type)
    value_ref = JSEvaluateScript(js_context, script_js, nil, nil, 0, exception_ptr)
    exception = exception_ptr[0]
    EvalResult.new(js_context, value_ref, exception)
  end


  private
  def js_context
    @js_context ||= JSGlobalContextCreate(nil)
  end
end