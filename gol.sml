datatype CellState = Dead | Alive;

type Cell = int * int * CellState;

fun neighbors (cell, grid) = 
let
  fun same_position ((x1,y1),(x2,y2)) =
    x1 = x2 andalso y1 = y2
  fun areneighbors ((x1,y1,_), (x2,y2,_))  = 
    Int.abs(x1-x2)<=1 andalso Int.abs(y1-y2) <= 1 andalso  not (same_position ((x1,y1),(x2,y2)))
  fun neighbors_iter(cell_list, accumul) =  
    case cell_list of
         H::T => if areneighbors(cell,H) then neighbors_iter(T, H::accumul) else neighbors_iter(T,accumul)
       | [] => accumul
in
  neighbors_iter(grid,[])
end

fun neighbors_alive (cell,grid) = List.filter (fn (_,_,s) => s=Alive) (neighbors (cell,grid));

fun number_neighbors_alive (cell,grid)  =  List.length (neighbors_alive (cell,grid));

fun next_generation (grid) = 
let
  fun next_gen_iter (cell_list,accumul) = 
    case cell_list of
         (x,y,Alive)::T => ( case number_neighbors_alive ((x,y,Alive),grid) of
                               (2|3) => next_gen_iter(T,accumul@[(x,y,Alive)])
                             |_ => next_gen_iter(T,accumul@[(x,y,Dead)])
                             )

        |(x,y,Dead)::T => ( case number_neighbors_alive ((x,y,Dead),grid) of
                                3 => next_gen_iter(T,accumul@[(x,y,Alive)])
                              |_ => next_gen_iter(T,accumul@[(x,y,Dead)])
                              )
        | [] => accumul
in
  next_gen_iter (grid,[])
end

