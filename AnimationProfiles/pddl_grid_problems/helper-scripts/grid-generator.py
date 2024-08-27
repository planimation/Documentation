def create_grid(width: int, height: int, name_prefix: str) -> str:
    # Generate all point objects
    point_objects = [f"{name_prefix}{x+1}_{y+1}" for x in range(width) for y in range(height)]
    grid = [[f"{name_prefix}{x+1}_{y+1}" for x in range(width)] for y in range(height)]
    
    # string starts with a commented list of all objects
    result = "; "
    result += " ".join(point_objects)
    result += '\n'

    for point in point_objects:
        result += f"(position {point})\n"

    # each position should be connected
    for x in range(width):
        for y in range(height):
            if (x - 1) >= 0:
                result += f"(left {grid[y][x]} {grid[y][x - 1]})\n"
            if (x + 1) < width:
                result += f"(right {grid[y][x]} {grid[y][x + 1]})\n"
            if (y - 1) >= 0:
                result += f"(down {grid[y][x]} {grid[y - 1][x]})\n"
            if (y + 1) < height:
                result += f"(up {grid[y][x]} {grid[y + 1][x]})\n"
    return result

print(create_grid(8,8,"pos"))