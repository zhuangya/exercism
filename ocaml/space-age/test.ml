(* space-age - 1.0 *)
open Base
open OUnit2
open Space_age

let ae ~delta exp_result got_result _test_ctxt =
  match (exp_result, got_result) with
  | Ok exp, Ok got ->
    let diff = Float.abs (exp -. got) in
    let msg = Printf.sprintf "Expected %f, got %f (diff %f > delta %f)" exp got diff delta in
    assert_bool msg (Float.(diff <= delta))
  | Error exp_msg, Error got_msg ->
    assert_equal exp_msg got_msg ~printer:Fn.id
  | Ok _, Error m ->
    assert_failure (Printf.sprintf "Expected Ok, but got Error: %s" m)
  | Error m, Ok _ ->
    assert_failure (Printf.sprintf "Expected Error: %s, but got Ok" m)

let tests = [
  "age on Earth" >::
  ae ~delta:0.05 (Ok 31.69) (age_on "Earth" 1000000000);
  "age on Mercury" >::
  ae ~delta:0.05 (Ok 280.88) (age_on "Mercury" 2134835688);
  "age on Venus" >::
  ae ~delta:0.05 (Ok 9.78) (age_on "Venus" 189839836);
  "age on Mars" >::
  ae ~delta:0.05 (Ok 35.88) (age_on "Mars" 2129871239);
  "age on Jupiter" >::
  ae ~delta:0.05 (Ok 2.41) (age_on "Jupiter" 901876382);
  "age on Saturn" >::
  ae ~delta:0.05 (Ok 2.15) (age_on "Saturn" 2000000000);
  "age on Uranus" >::
  ae ~delta:0.05 (Ok 0.46) (age_on "Uranus" 1210123456);
  "age on Neptune" >::
  ae ~delta:0.05 (Ok 0.35) (age_on "Neptune" 1821023456);
  "invalid planet causes error" >::
  ae ~delta:0.05 (Error "not a planet") (age_on "Sun" 680804807);
]

let () =
  run_test_tt_main ("space-age tests" >::: tests)
