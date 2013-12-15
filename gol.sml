datatype CellState = Dead | Alive;

type Cell = int * int * CellState;

fun areneighbors ((x1,y1,_): Cell, (x2,y2,_): Cell) = 
  Int.abs(x1-x2)<=1 andalso Int.abs(y1-y2) <= 1 andalso  (not  (x1 = x2) orelse not (y1 = y2)) ;

fun neighbors (X:Cell,Y: Cell list): Cell list = 
let
  fun neighbors_iter(cell_list, accumul): Cell list =  
    case cell_list of
         H::T => if areneighbors(X,H) then neighbors_iter(T, H::accumul) else neighbors_iter(T,accumul)
       | [] => accumul
in
  neighbors_iter(Y,[])
end

fun neighbors_alive (X,Y) = List.filter (fn (_,_,s) => s=Alive) (neighbors (X,Y));

fun number_neighbors_alive (X,Y)  =  List.length (neighbors_alive (X,Y));


fun next_generation (grid) = 
let
  fun next_gen_iter (the_list,accumul) = 
    case the_list of
         (x,y,Alive)::T => ( case number_neighbors_alive ((x,y,Alive),grid) of
                               2 => next_gen_iter(T,accumul@[(x,y,Alive)])
                             |3 =>  next_gen_iter(T,accumul@[(x,y,Alive)])
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


