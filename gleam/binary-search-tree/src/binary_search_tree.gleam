import gleam/list

pub type Tree {
  Nil
  Node(data: Int, left: Tree, right: Tree)
}

pub fn to_tree(data: List(Int)) -> Tree {
  data |> list.fold(Nil, insert_to_tree)
}

pub fn sorted_data(data: List(Int)) -> List(Int) {
  // data |> to_tree |> sort_tree
  // with tail call recursive optimization:
  data |> to_tree |> sort_tree_tail([])
}

pub fn insert_to_tree(tree: Tree, item: Int) -> Tree {
  case tree {
    Nil -> Node(item, Nil, Nil)
    Node(data, left, right) if item <= data ->
      Node(data, insert_to_tree(left, item), right)
    Node(data, left, right) -> Node(data, left, insert_to_tree(right, item))
  }
}

pub fn sort_tree(tree: Tree) -> List(Int) {
  case tree {
    Nil -> []
    Node(data, left, right) ->
      list.append(sort_tree(left), [data, ..sort_tree(right)])
  }
}

fn sort_tree_tail(tree: Tree, acc: List(Int)) -> List(Int) {
  case tree {
    Nil -> acc
    Node(data, left, right) ->
      sort_tree_tail(left, list.append([data], sort_tree_tail(right, acc)))
  }
}
