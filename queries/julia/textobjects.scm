(compound_expression) @block.outer    ; begin blocks
(let_statement)       @block.outer

(struct_definition) @class.outer    ; not classes, but close enough
(call_expression) @call.outer

(comment) @comment.outer

(if_statement) @conditional.outer

(function_definition) @function.outer
(assignment_expression
  (call_expression) (_)) @function.outer    ; math functions
(function_expression)    @function.outer    ; lambdas
(macro_definition)       @function.outer

(for_statement)    @loop.outer
(while_statement)  @loop.outer

((subscript_expression
  "," @_start . (_) @parameter.inner)
 (#make-range! "parameter.outer" @_start @parameter.inner)) 
((subscript_expression
  . (_) @parameter.inner . ","? @_end)
 (#make-range! "parameter.outer" @parameter.inner @_end)) 

((argument_list
  "," @_start . (_) @parameter.inner)
 (#make-range! "parameter.outer" @_start @parameter.inner)) 
((argument_list
  . (_) @parameter.inner . ","? @_end)
 (#make-range! "parameter.outer" @parameter.inner @_end)) 

((parameter_list
  "," @_start . (_) @parameter.inner)
 (#make-range! "parameter.outer" @_start @parameter.inner)) 
((parameter_list
  . (_) @parameter.inner . ","? @_end)
 (#make-range! "parameter.outer" @parameter.inner @_end)) 
