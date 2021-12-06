input = File.read('input')
#input = File.read('example')

draw, *boards = input.split("\n\n")
draw = draw.split(",").map(&:to_i)

boards = boards.collect do |board|
  
  rows = board.split("\n").collect do |row|
      {
        numbers: row.split(" ").map(&:to_i),
        marked: []
    }
  end
  
  columns = []
  rows.each_with_index do |row, i|
    row[:numbers].each_with_index do |cell, j|
      columns[j] = { numbers: [], marked: [] } if columns[j] == nil
      columns[j][:numbers][i] = cell
    end
  end

  {
    rows: rows,
    columns: columns,
    won: false
  }
  
end

draw.each do |num|
  boards.each do |board|
    [:rows, :columns].each do |type|
    board[type].each do |subset|
      if subset[:numbers].include? num
        subset[:marked] << num
        if subset[:marked].length == subset[:numbers].length
          unless board[:won]
            board[:won] = true

              puts "BINGO!!"

              sum_unmarked = board[:rows].collect do |row|
                row[:numbers]- row[:marked]
              end.flatten.sum

              puts "drawn number:#{num} sum:#{sum_unmarked} answer:#{num * sum_unmarked}"
            end
          end
        end
      end
    end
  end
end
