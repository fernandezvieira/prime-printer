class MultiplcationGrid
  def self.print(array)
    # create a string buffer object and continuously append to it
    # like this we use less IO time as we only print once at the end
    output_buffer = "       " + ((" %7d" * array.size) % array) + "\n"

    array.each_with_index do |n, index|
      line_spacing = "       -"*index
      output_buffer  << "%7d" % n << line_spacing

      index.upto(array.size-1) do |i|
        output_buffer << " %7d" % (n*array[i])
      end

      output_buffer << "\n"
    end

    puts output_buffer
  end
end
