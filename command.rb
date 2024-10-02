class Light
  def turn_on
    puts "Світло увімкнено"
  end

  def turn_off
    puts "Світло вимкнено"
  end
end

class Command
  def execute
    raise NotImplementedError, "Клас, що наслідується, має реалізувати цей метод"
  end
end

# Команда для увімкнення світла
class TurnOnLightCommand < Command
  def initialize(light)
    @light = light
  end

  def execute
    @light.turn_on
  end
end

class TurnOffLightCommand < Command
  def initialize(light)
    @light = light
  end

  def execute
    @light.turn_off
  end
end

class RemoteControl
  def initialize
    @commands = {}
  end

  def set_command(button, command)
    @commands[button] = command
  end

  def press_button(button)
    command = @commands[button]
    if command
      command.execute
    else
      puts "Кнопка #{button} не запрограмована"
    end
  end
end

light = Light.new
turn_on_command = TurnOnLightCommand.new(light)
turn_off_command = TurnOffLightCommand.new(light)

# Програмуємо пульт
remote = RemoteControl.new
remote.set_command("A", turn_on_command)
remote.set_command("B", turn_off_command)

# Використовуємо пульт
remote.press_button("A") # Світло увімкнено
remote.press_button("B") # Світло вимкнено

