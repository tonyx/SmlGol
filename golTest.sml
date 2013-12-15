
val myCell: Cell = (1,2,Alive); 
val rneighbors = areneighbors ((0,0,Alive),(0,1,Alive));
val not_neighbors = areneighbors((0,0,Alive),(2,4,Alive)) = false;

val neighborsOfACellFromEmptyListIsempty = neighbors (myCell,[]) = [];
val passed_list_are_all_neighbors_test = neighbors ((1,2,Alive),[(1,1,Alive)]) = [(1,1,Alive)];
val one_neighbor_and_one_not_in_grid = neighbors ((0,0,Alive),[(0,1,Alive),(10,11,Alive)]) = [(0,1,Alive)];
val more_neighbors = neighbors ((0,0,Alive),[(0,1,Alive),(1,0,Alive),(10,11,Alive)]) = [(1,0,Alive),(0,1,Alive)];
val more_neighbors_excluding_itself = neighbors ((0,0,Alive),[(0,0,Alive),(0,1,Alive),(1,0,Alive),(10,11,Alive)]) = [(1,0,Alive),(0,1,Alive)]; 

val ehilo = neighbors_alive ((0,0,Alive),[(0,1,Dead),(1,0,Alive),(10,11,Alive)]) = [(1,0,Alive)];

val number_of_Alive = number_neighbors_alive ((0,0,Alive),[(0,1,Dead),(1,0,Alive),(10,11,Alive)]) = 1;

val column = [(0,0,Dead),(0,1,Alive),(0,2,Dead),
              (1,0,Dead),(1,1,Alive),(1,2,Dead),
              (2,0,Dead),(2,1,Alive),(2,2,Dead)];

val next_from_column = next_generation (column) =  
             [(0,0,Dead),(0,1,Dead),(0,2,Dead),
              (1,0,Alive),(1,1,Alive),(1,2,Alive),
              (2,0,Dead),(2,1,Dead),(2,2,Dead)];


