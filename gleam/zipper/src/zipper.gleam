pub type Tree(a) {
  Leaf
  Node(value: a, left: Tree(a), right: Tree(a))
}

pub opaque type Zipper(a) {
  Zipper(focus: Tree(a), breadcrumbs: List(Breadcrumb(a)))
}

type Breadcrumb(a) {
  FromLeft(parent_value: a, right_sibling: Tree(a))
  FromRight(parent_value: a, left_sibling: Tree(a))
}

pub fn to_zipper(tree: Tree(a)) -> Zipper(a) {
  Zipper(focus: tree, breadcrumbs: [])
}

fn rebuild_parent(focus: Tree(a), breadcrumb: Breadcrumb(a)) -> Tree(a) {
  case breadcrumb {
    FromLeft(parent_value, right_sibling) ->
      Node(value: parent_value, left: focus, right: right_sibling)
    FromRight(parent_value, left_sibling) ->
      Node(value: parent_value, left: left_sibling, right: focus)
  }
}

pub fn to_tree(zipper: Zipper(a)) -> Tree(a) {
  case zipper {
    Zipper(focus: focus, breadcrumbs: []) -> focus

    Zipper(focus: focus, breadcrumbs: [breadcrumb, ..rest]) -> {
      to_tree(Zipper(
        focus: rebuild_parent(focus, breadcrumb),
        breadcrumbs: rest,
      ))
    }
  }
}

pub fn value(zipper: Zipper(a)) -> Result(a, Nil) {
  case zipper {
    Zipper(focus: Node(value: value, left: _, right: _), breadcrumbs: _) ->
      Ok(value)
    Zipper(focus: Leaf, breadcrumbs: _) -> Error(Nil)
  }
}

pub fn up(zipper: Zipper(a)) -> Result(Zipper(a), Nil) {
  case zipper {
    Zipper(focus: _, breadcrumbs: []) -> Error(Nil)
    Zipper(focus: focus, breadcrumbs: [breadcrumb, ..rest]) ->
      Ok(Zipper(focus: rebuild_parent(focus, breadcrumb), breadcrumbs: rest))
  }
}

pub fn left(zipper: Zipper(a)) -> Result(Zipper(a), Nil) {
  case zipper {
    Zipper(focus: Leaf, breadcrumbs: _) -> Error(Nil)
    Zipper(
      focus: Node(value: value, left: left, right: right),
      breadcrumbs: breadcrumbs,
    ) ->
      Ok(
        Zipper(focus: left, breadcrumbs: [
          FromLeft(parent_value: value, right_sibling: right),
          ..breadcrumbs
        ]),
      )
  }
}

pub fn right(zipper: Zipper(a)) -> Result(Zipper(a), Nil) {
  case zipper {
    Zipper(focus: Leaf, breadcrumbs: _) -> Error(Nil)
    Zipper(
      focus: Node(value: value, left: left, right: right),
      breadcrumbs: breadcrumbs,
    ) ->
      Ok(
        Zipper(focus: right, breadcrumbs: [
          FromRight(parent_value: value, left_sibling: left),
          ..breadcrumbs
        ]),
      )
  }
}

pub fn set_value(zipper: Zipper(a), new_value: a) -> Zipper(a) {
  case zipper {
    Zipper(focus: Leaf, breadcrumbs: _) -> zipper

    Zipper(
      focus: Node(value: _, left: left, right: right),
      breadcrumbs: breadcrumbs,
    ) ->
      Zipper(
        focus: Node(value: new_value, left: left, right: right),
        breadcrumbs: breadcrumbs,
      )
  }
}

pub fn set_left(
  zipper: Zipper(a),
  new_left: Tree(a),
) -> Result(Zipper(a), Nil) {
  case zipper {
    Zipper(focus: Leaf, breadcrumbs: _) -> Error(Nil)
    Zipper(
      focus: Node(value: value, left: _, right: right),
      breadcrumbs: breadcrumbs,
    ) ->
      Ok(Zipper(
        focus: Node(value: value, left: new_left, right: right),
        breadcrumbs: breadcrumbs,
      ))
  }
}

pub fn set_right(
  zipper: Zipper(a),
  new_right: Tree(a),
) -> Result(Zipper(a), Nil) {
  case zipper {
    Zipper(focus: Leaf, breadcrumbs: _) -> Error(Nil)
    Zipper(
      focus: Node(value: value, left: left, right: _),
      breadcrumbs: breadcrumbs,
    ) ->
      Ok(Zipper(
        focus: Node(value: value, left: left, right: new_right),
        breadcrumbs: breadcrumbs,
      ))
  }
}
