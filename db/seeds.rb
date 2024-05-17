puts "Eliminando todos los datos anteriores..."

Task.delete_all
WorkUser.delete_all
Board.delete_all
Design.delete_all
WorkTeam.delete_all
User.delete_all

puts "Datos anteriores eliminados exitosamente."

# Crear dos equipos de trabajo
puts "Creando dos equipos de trabajo..."
work_team_a = WorkTeam.create(name: "Team A", description: "Description of Team A")
work_team_b = WorkTeam.create(name: "Team B", description: "Description of Team A")
puts "Equipos de trabajo creados exitosamente."

# Crear 15 usuarios
puts "Creando usuarios..."
users = []
15.times do |i|
  user = User.create(
    first_name: "User#{i + 1}",  # 'name' cambiado a 'first_name'
    last_name: "Last name#{i + 1}",  # 'apellido' cambiado a 'last_name'
    position: "Position #{i + 1}",
    email: "User#{i + 1}@example.com",
    password: "password#{i + 1}"
  )
  users << user
end
puts "Usuarios creados exitosamente."

# Asignar usuarios a equipos de trabajo
puts "Asignando usuarios a equipos de trabajo..."
users.shuffle! # Mezclamos los usuarios para que la asignación sea aleatoria
users.each_with_index do |user, index|
  if index < 10
    WorkUser.create(user: user, work_team: work_team_a)
  else
    WorkUser.create(user: user, work_team: work_team_b)
  end
end

# Agregar algunos usuarios al segundo equipo de trabajo también
users.sample(5).each do |user|
  WorkUser.create(user: user, work_team: work_team_b)
end
puts "Usuarios asignados a equipos de trabajo exitosamente."

# Crear diseños de ejemplo
puts "Creando diseños de ejemplo..."
Design.create(name: "Design 1", description: "Design Description 1", type_of_attribute: "Type 1")
Design.create(name: "Design 2", description: "Design Description 2", type_of_attribute: "Type 2")
Design.create(name: "Design 3", description: "Design Description 3", type_of_attribute: "Type 3")
puts "Diseños de ejemplo creados exitosamente."

# Crear tableros para cada equipo de trabajo
puts "Creando tableros para cada equipo de trabajo..."
[work_team_a, work_team_b].each do |work_team|
  2.times do |i|
    board = work_team.boards.create(
      name: "Board #{i + 1} - #{work_team.name}",
      description: "Board Description #{i + 1} of #{work_team.name}",
      design: Design.all.sample
    )

    # Crear tareas para cada tablero
    puts "Creando tareas para el tablero #{board.name}..."
    
    # Creamos un array para almacenar los estados utilizados
    used_statuses = []

    5.times do |j|
      # Seleccionamos un estado aleatorio que no haya sido utilizado previamente
      status = (["TO DO", "WIP", "DONE"] - used_statuses).sample
      
      # Si ya se han utilizado todos los estados, seleccionamos uno al azar
      status = ["TO DO", "WIP", "DONE"].sample if status.nil?
      
      # Agregamos el estado utilizado al array de estados
      used_statuses << status

      Task.create(
        title: "Task #{j + 1} en #{board.name}",
        description: "Description of task #{j + 1} on the #{board.name}",
        status: status,
        priority: rand(1..5),
        board: board,
        creator: User.all.sample,
        assignee: User.all.sample
      )
    end
    puts "Tareas creadas para el tablero #{board.name} exitosamente."
  end
end

puts "Proceso de seeding completado."
