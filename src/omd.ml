(***********************************************************************)
(* omd: Markdown frontend in OCaml                                     *)
(* (c) 2013 by Philippe Wang <philippe.wang@cl.cam.ac.uk>              *)
(* Licence : ISC                                                       *)
(* http://www.isc.org/downloads/software-support-policy/isc-license/   *)
(***********************************************************************)

include Omd_representation
include Omd_backend

let lex : string -> tok list = Omd_lexer.lex

let parse : ?extensions:(Omd_representation.t -> Omd_representation.tok list -> Omd_representation.tok list -> ((t * Omd_representation.tok list * Omd_representation.tok list) option)) list -> tok list -> t = Omd_parser.parse

let to_html : ?pindent:bool -> ?nl2br:bool -> t -> string = html_of_md

let to_text : t -> string = text_of_md

let to_markdown : t -> string = markdown_of_md

let html_of_string (html:string) : string =
  html_of_md (parse (lex html))

