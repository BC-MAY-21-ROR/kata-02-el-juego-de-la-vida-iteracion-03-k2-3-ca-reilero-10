module GridLogic
  def start_values(path_file)
    filas = 0
    columnas = 0
    grilla = []

    File.foreach(path_file) do |line|
      if line[0].to_i > 0
        filas = line[0].to_i
        columnas = line[2].to_i
      end

      if line[0].start_with?('.', '*')
        empty_array = []

        line.split('').count.times do |v|
          empty_array.push(line[v]) if line[v] == '.' || line[v] == '*'
        end

        grilla.push(empty_array)
      end
    end

    return [grilla, filas, columnas]
  end

  def calculate_next_generation(grilla, filas, columnas, nueva_grilla)
    filas.times do |y|
      columnas.times do |x|
        alive_cell = grilla[y][x] == '*'

        alive_neighbors = [
          grilla[y -1][x - 1] == '*', # Top left
          grilla[y - 1][x] == '*', # Top center
          grilla[y - 1][x + 1] == '*', # Top right
          grilla[y][x + 1] == '*', # Right
          (grilla[y + 1][x + 1] == '*' if grilla[y + 1] != nil), # Bottom
          (grilla[y + 1][x] == '*' if grilla[y + 1] != nil), # Bottom center
          (grilla[y + 1][x - 1] == '*' if grilla[y + 1] != nil), # Bottom left
          grilla[y][x - 1] == '*' # Left
        ].count(true)

        nueva_grilla[y][x] = '*' if (alive_cell && alive_neighbors.between?(2, 3) || (!alive_cell && alive_neighbors === 3))
      end
    end

    return nueva_grilla
  end
end

class Grid
  include GridLogic

  # getter & setter
  attr_accessor :grilla, :generacion

  # getter
  attr_reader :filas, :columnas

  def initialize(path_file)
    @grilla, @filas, @columnas = start_values(path_file)
    @generacion = 1

    print_grilla
  end

  def next_genertion
    nueva_grilla = Array.new(filas) { Array.new(columnas) { '.' } }

    self.grilla = calculate_next_generation(grilla, filas, columnas, nueva_grilla)

    print_grilla
  end

  def call_print
    print_grilla
  end

  private

  def print_grilla
    puts "Generacion #{generacion}"

    filas.times do |y|
      puts grilla[y].join
    end

    self.generacion += 1
  end

end

elGrid = Grid.new('./generacion_1.txt')
elGrid.next_genertion
elGrid.next_genertion
elGrid.next_genertion
elGrid.next_genertion

