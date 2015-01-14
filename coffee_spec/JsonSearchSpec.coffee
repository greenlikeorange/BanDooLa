describe 'JsonSearch', ->
	describe 'reading json', ->
			afterEach -> 
				JsonSearch.clear()

	 	it 'reads one level json correctly', ->
	 	    json = {"one": "one", "two": 2, "three": "three"}
	 	    JsonSearch.read(json)
	 	    expect(JsonSearch.levels[0]).toEqual {"one": String,"two": Number,"three":String}

	  	it 'reads two level json correctly', ->
	  		json = {
	  			"str": "just string"
	  			"obj": { "nested_string": "string1", "nested_number": 1}
	  			"obj2": { "nested_two": "string1", "nested_number": 1}
	  			"number": 3
	  		}
	  		JsonSearch.read(json)
	  		expect(JsonSearch.levels[0]).toEqual {"str": String, "obj": Object, "obj2": Object, "number": Number}
	  		expect(JsonSearch.levels[1]).toEqual  { "nested_string": String, "nested_two": String,"nested_number": Number}
	  	it 'reads three levels json correctly', ->
	  		json = {
	  			"str": "just string"
	  			"obj": { "nested_string": "string1", "double_nested": {"double_nested_no": 2} }
	  			"obj2": { "nested_two": "string1", "nested_number": 1}
	  			"number": 3
	  		}
	  		JsonSearch.read(json)
	  		expect(JsonSearch.levels[0]).toEqual {"str": String, "obj": Object, "obj2": Object, "number": Number}
	  		expect(JsonSearch.levels[1]).toEqual  { "nested_string": String,"double_nested": Object, "nested_two": String,"nested_number": Number}
	  		expect(JsonSearch.levels[2]).toEqual  { "double_nested_no": Number }
	  	it 'shows the correct depth of json', ->
	  		json = {
	  			"str": "just string"
	  			"obj": { "nested_string": "string1","double_nested": {"double_nested_no": 2}}
	  			"obj2": { "nested_two": "string1", "nested_number": 1}
	  			"number": 3
	  		} 
	  		JsonSearch.read(json)
	  		expect(JsonSearch.depth()).toEqual 3 

describe 'TypeChecking', ->
	it 'should show number types correctly', ->
		expect(typeOf(1)).toEqual Number
		expect(typeOf(3.1)).toEqual Number

	it 'should show string types correctly', ->
		expect(typeOf("string")).toEqual String

	it 'should show object types correctly', ->
		expect(typeOf({})).toEqual Object

	it 'should show function types correctly', ->
		my_func = ->
		expect(typeOf(my_func)).toEqual Function

	it 'should show array types correctly', ->
		expect(typeOf([])).toEqual Array 

	it 'should show date types correctly', ->
		date = new Date()
		expect(typeOf(date)).toEqual Date 
	it 'should show date types correctly', ->
		boo = true
		expect(typeOf(boo)).toEqual Boolean

	it 'should show date types correctly', ->
		reg = new RegExp()
		expect(typeOf(reg)).toEqual RegExp

	it 'should show error types correctly',->
		err = new Error()
		expect(typeOf(err)).toEqual Error

describe 'Json Merging', ->
	it 'merges empty json over a goood json', ->
		base = {"something": "somewhere"}
		to_merge = {}
		expect(JsonSearch._json_merge(base,to_merge)).toEqual {"something": "somewhere"}
	it 'merges a good json over an empty json', ->
		base = {}
		to_merge = {"something": "somewhere"}
		expect(JsonSearch._json_merge(base,to_merge)).toEqual {"something": "somewhere"}

  
	