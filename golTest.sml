
val myCell: Cell = (1,2,Alive); 
val neighbors_test = areneighbors ((0,0,Alive),(0,1,Alive));
val not_neighbors_test = areneighbors((0,0,Alive),(2,4,Alive)) = false;

val set_of_neighbors_of_a_cell_against_an_empty_grid_is_empty = neighbors (myCell,[]) = [];
val set_of_neighbors_of_a_cell_against_a_grid_with_only_one_neighbors = neighbors ((1,2,Alive),[(1,1,Alive)]) = [(1,1,Alive)];
val test_one_neighbor_and_one_not = neighbors ((0,0,Alive),[(0,1,Alive),(10,11,Alive)]) = [(0,1,Alive)];
val test_twho_neighbors_and_one_not = neighbors ((0,0,Alive),[(0,1,Alive),(1,0,Alive),(10,11,Alive)]) = [(1,0,Alive),(0,1,Alive)];
val test_more_neighbors_excluding_cell_itself = neighbors ((0,0,Alive),[(0,0,Alive),(0,1,Alive),(1,0,Alive),(10,11,Alive)]) = [(1,0,Alive),(0,1,Alive)]; 

val test_neighbors_alive = neighbors_alive ((0,0,Alive),[(0,1,Dead),(1,0,Alive),(10,11,Alive)]) = [(1,0,Alive)];

val test_number_of_Alive = number_neighbors_alive ((0,0,Alive),[(0,1,Dead),(1,0,Alive),(10,11,Alive)]) = 1;

val column = [(0,0,Dead),(0,1,Alive),(0,2,Dead),
              (1,0,Dead),(1,1,Alive),(1,2,Dead),
              (2,0,Dead),(2,1,Alive),(2,2,Dead)];

val next_from_column = next_generation (column) =  
             [(0,0,Dead),(0,1,Dead),(0,2,Dead),
              (1,0,Alive),(1,1,Alive),(1,2,Alive),
              (2,0,Dead),(2,1,Dead),(2,2,Dead)];


