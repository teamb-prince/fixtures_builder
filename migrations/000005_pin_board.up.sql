CREATE TABLE pin_board
(
    id          SERIAL,
    pin_id uuid references pin(id),
    board_id uuid references board(id)
)