class @Utils
  
  @loadModules: (class_obj)->
    modules = Array::splice.call(arguments, 0)
    modules.forEach (module_class)->
      class_obj.prototype[module_class.name] = module_class
    return class_obj

