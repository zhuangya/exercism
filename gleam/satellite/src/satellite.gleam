import gleam/bool.{guard}
import gleam/list
import gleam/set

pub type Tree(a) {
  Nil
  Node(value: a, left: Tree(a), right: Tree(a))
}

pub type Error {
  DifferentLengths
  DifferentItems
  NonUniqueItems
}

pub fn tree_from_traversals(
  inorder inorder: List(a),
  preorder preorder: List(a),
) -> Result(Tree(a), Error) {
  use <- guard(
    list.length(inorder) != list.length(preorder),
    Error(DifferentLengths),
  )
  use <- guard(
    set.size(set.from_list(inorder)) != list.length(inorder),
    Error(NonUniqueItems),
  )
  use <- guard(
    set.from_list(inorder) != set.from_list(preorder),
    Error(DifferentItems),
  )
  Ok(traverse(inorder, preorder))
}

fn traverse(inorder i: List(a), preorder p: List(a)) -> Tree(a) {
  case p, i {
    [], [] -> Nil
    [first, ..rest], i -> {
      let assert #(ileft, [_, ..iright]) =
        list.split_while(i, fn(x) { x != first })
      let #(pleft, pright) = list.split(rest, list.length(ileft))
      Node(first, traverse(ileft, pleft), traverse(iright, pright))
    }
    _, _ -> Nil
  }
}
