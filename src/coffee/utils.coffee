class @Utils
  
  @loadModules: (class_obj, modules)->
    modules.forEach (module_class)->
      class_obj.prototype[module_class.name] = module_class
    return class_obj

