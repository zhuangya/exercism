import gleam/string
import gleam/result.{unwrap}
import gleam/list

pub fn first_letter(name: String) {
  name
  |> string.trim
  |> string.first
  |> unwrap("")
}

pub fn initial(name: String) {
  name
  |> first_letter
  |> string.uppercase
  |> string.append(".")
}

pub fn initials(full_name: String) {
  full_name
  |> string.split(" ")
  |> list.map(initial)
  |> string.join(" ")
}

pub fn pair(full_name1: String, full_name2: String) {
  let names = initials(full_name1) <> "  +  " <> initials(full_name2)

  "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     " <> names <> "     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
}
