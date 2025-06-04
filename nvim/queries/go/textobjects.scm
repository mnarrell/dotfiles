;; Function with comments
(comment)* @comment
(function_declaration) @function

;; Method with comments
(comment)* @comment
(method_declaration) @function

;; Combined function + comments capture
((comment)* @comment
 (function_declaration) @function) @function.outer

((comment)* @comment
 (method_declaration) @function) @function.outer

;; Just the function body (inner)
(function_declaration
  body: (block) @function.inner)

(method_declaration
  body: (block) @function.inner)
