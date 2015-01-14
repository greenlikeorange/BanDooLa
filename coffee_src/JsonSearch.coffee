JsonSearch = 
	{
		levels: []
		depth: ->
			@levels.length
		clear: ->
			@levels = []
		_json_merge: (base,to_merge)->
			base = {} if base is undefined
			console.log(to_merge)
			for k,v of to_merge
				base[k] = v unless base[k]
				console.log "value = #{v} , base[k]= #{base[k]}"
			base
		read: (json)->
			@read_level(0,json)
		read_level: (lvl, json) ->
			new_json = {}
			for k,v of json
				@read_level(lvl+1, v) if typeOf(v) == Object
				new_json[k] = typeOf v
			@levels[lvl] = @_json_merge @levels[lvl],new_json
			# while(nested_ary != [])
			# 	level++
			# 	tmp_ary = []
			# 	next_level = {}
			# 	for item in nested_ary
			# 		for k,v of item
			# 			tmp_ary.push(v) if typeOf v == Object		 
			# 			next_level[k] = typeOf v
			# 		@levels[level] = next_level 
			# 	nested_ary = tmp_ary
	}

window.JsonSearch = JsonSearch