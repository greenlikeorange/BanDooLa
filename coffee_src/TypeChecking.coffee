class2type = {}
type2Object = {}
types = [
  [Boolean, "Boolean"],
  [Number, "Number"],
  [String, "String"],
  [Function, "Function"],
  [Array, "Array"],
  [Date, "Date"],
  [RegExp, "RegExp"],
  [Object, "Object"],
  [Error, "Error"]
];

types.forEach (name,i) ->
	class2type[ "[object " + name[1] + "]" ] = name[0]
	type2Object[name[1].toLowerCase()] = name[0]

typeOf = (obj) ->
    return obj + "" if  obj == null  
    if typeof obj == "object" || typeof obj == "function" 
    	 class2type[ toString.call(obj) ] || Object 
    else
    	 type2Object[typeof obj] || typeof obj;
window.typeOf = typeOf