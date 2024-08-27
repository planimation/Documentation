def generate_problem_file(filename: str):
    f = open(filename)
    chars = f.readlines()

    positions = []
    orange = []
    start = ""
    goal = ""


    for y in range(len(chars)):
        for x in range(len(chars[y])):
            if chars[y][x] == '.':
                positions.append(f"pos_{x+1}_{y+1}")
            if chars[y][x] == 'S':
                positions.append(f"pos_{x+1}_{y+1}")
                start = f"pos_{x+1}_{y+1}"
            if chars[y][x] == 'G':
                positions.append(f"pos_{x+1}_{y+1}")
                goal = f"pos_{x+1}_{y+1}"
            if chars[y][x] == 'O':
                positions.append(f"pos_{x}_{y}")
                orange.append(f"tile_orange_{x}_{y}")
    
    connections = []
    for pos in positions:
        x = int(pos.split("_")[1])
        y = int(pos.split("_")[2])
        if f"pos_{x+1}_{y}" in positions:
            connections.append(f"(right {pos} pos_{x+1}_{y})")
        if f"pos_{x}_{y+1}" in positions:
            connections.append(f"(up {pos} pos_{x}_{y+1})")
        if f"pos_{x-1}_{y}" in positions:
            connections.append(f"(left {pos} pos_{x-1}_{y})")
        if f"pos_{x}_{y-1}" in positions:
            connections.append(f"(down {pos} pos_{x}_{y-1})")
    
    print(f"(define (problem {filename[0:-5]})\n    (:domain grid)\n    (:objects")
    
    for pos in positions:
        print(f"\n        {pos}", end="")
    print(" - pos")

    for tile in orange:
        print(f"\n        {tile}", end="")
    print(" - orange")


    print("        mov_player_1 mov_player_2 - movable\n    )")

    print(f"    (:init\n        (at mov_player_1 {start})\n        (at_above mov_player_2 {start})")
    
    for pos in positions:
        print(f"        (position {pos})")
    
    for tile in orange:
        print(f"        (at {tile} pos_{tile.split('_')[2]}_{tile.split('_')[3]})")
    
    for connection in connections:
        print(f"        {connection}")
    
    print("    )\n\n    (:goal\n        (and")
    print(f"            (at mov_player_2 {goal})\n            (at_above mov_player_1 {goal})\n")
    print("        )\n    )\n)")
    f.close()
    
    




            
            
            

if __name__ == "__main__":
    generate_problem_file("orange_simple.txt")