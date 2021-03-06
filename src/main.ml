(* entry point for ocaml compiler, will do argument parsing and generally make the parts collaborate. *)

let call_with_channel (ch_open, ch_close) fn file =
    let channel = ch_open file in
    let result = fn channel in
        ch_close channel;
        result

let call_with_output_channel fn file = call_with_channel (open_out, close_out) fn file
let call_with_input_channel fn file = call_with_channel (open_in, close_in) fn file

let main ch =
    try
        let lexbuf = Lexing.from_channel ch in
        let token_stream = Grammar_parser.main Grammar_lexer.token lexbuf in
            List.iter (fun (t, str) -> Printf.printf "result: %d %s \n" t str) token_stream
    with Grammar_lexer.Eof ->
        print_string "EOF";;

let filename = "tests/first.calc" in
    Printf.printf "executing: %s \n" filename;
    call_with_input_channel (fun ch -> main ch) filename;;
