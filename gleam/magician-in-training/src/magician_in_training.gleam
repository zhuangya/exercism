import gleam/queue.{
  type Queue, length, pop_back, pop_front, push_back, push_front,
}

pub fn insert_top(queue: Queue(Int), card: Int) {
  push_back(queue, card)
}

pub fn remove_top_card(queue: Queue(Int)) -> Queue(Int) {
  case pop_back(queue) {
    Ok(#(_, list)) -> list
    Error(_) -> queue
  }
}

pub fn insert_bottom(queue: Queue(Int), card: Int) -> Queue(Int) {
  push_front(queue, card)
}

pub fn remove_bottom_card(queue: Queue(Int)) -> Queue(Int) {
  case pop_front(queue) {
    Ok(#(_, list)) -> list
    Error(_) -> queue
  }
}

pub fn check_size_of_stack(queue: Queue(Int), target: Int) -> Bool {
  length(queue) == target
}
