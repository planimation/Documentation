def generate_problem_file(filename: str):
    f = open(filename)
    chars = f.readlines()

    positions = []
    blocks = []
    goals = []
    start = ""


    for y in range(len(chars)):
        for x in range(len(chars[y])):
            if chars[y][x] == '.':
                positions.append(f"pos_{x+1}_{y+1}")
            if chars[y][x] == 'S':
                positions.append(f"pos_{x+1}_{y+1}")
                start = f"pos_{x+1}_{y+1}"
            if chars[y][x] == 'G':
                positions.append(f"pos_{x+1}_{y+1}")
                goals.append(f"pos_{x+1}_{y+1}")
            if chars[y][x] == 'B':
                positions.append(f"pos_{x+ 1}_{y+1}")
                blocks.append(f"pos_{x+1}_{y+1}")
    
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
    
    print(f"(define (problem {filename[0:-5]})\n    (:domain template)\n    (:objects")
    
    for pos in positions:
        print(f"\n        {pos}", end="")
    print(" - pos")

    for block in blocks:
        print(f"\n        blk_{block.split('_')[1]}_{block.split('_')[2]}", end="")
    print(" - block")

    for goal in goals:
        print(f"\n        but_{goal.split('_')[1]}_{goal.split('_')[2]}", end="")
    print(" - button")

    print(f"\n        ply - player")

    print(f"    )\n    (:init")
    
    for pos in positions:
        print(f"        (position {pos})")

    for connection in connections:
        print(f"        {connection}")
    
    
    print(f"        (at ply {start})")
    
    for goal in goals:
        print(f"        (at but_{goal.split('_')[1]}_{goal.split('_')[2]} {goal})")
    
    for block in blocks:
        print(f"        (at blk_{block.split('_')[1]}_{block.split('_')[2]} {block})")
    
    
    
    print("    )\n")
    print("""    (:goal
        (forall (?but - button) 
            (exists (?blk - block) 
                (exists (?pos - pos)
                    (and 
                        (at ?but ?pos)
                        (at ?blk ?pos)
                    )
                )
            )
        )
    )
)""")

    f.close()
    
    




            
            
            

if __name__ == "__main__":
    generate_problem_file("sok1.txt")