open Ocaml99
open OUnit2

let tests =
  "test suite for ocaml99"
  >::: [
         (* p1 *)
         ("last empty" >:: fun _ -> assert_equal None (last []))
       ; ( "last lst with one element" >:: fun _ ->
           assert_equal (Some 1) (last [1])
         )
       ; ( "last lst with more than one elements" >:: fun _ ->
           assert_equal (Some 3) (last [1; 2; 3])
         )
       ; (* p8 *)
         ("compress empty" >:: fun _ -> assert_equal [] (compress []))
       ; ( "compress list" >:: fun _ ->
           assert_equal
             ["a"; "b"; "c"; "a"; "d"; "e"]
             (compress
                [
                  "a"
                ; "a"
                ; "a"
                ; "a"
                ; "b"
                ; "c"
                ; "c"
                ; "a"
                ; "a"
                ; "d"
                ; "e"
                ; "e"
                ; "e"
                ; "e"
                ]
             )
         )
       ]

let _ = run_test_tt_main tests
