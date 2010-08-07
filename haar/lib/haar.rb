class Haar
  def calculate array
    raise ArgumentError, 'Array can not be an odd length' unless array.length % 2 == 0
    raise ArgumentError, 'Array can not be empty' if array.length == 0

    return step array, array
  end

  private
  def step original, current 
    return current if 
      original.inject { |sum, el| sum + el } / original.size.to_f == current[0]

    pairs = []
    current.each_slice(2) { |a| pairs.push a }

    avg_co = pairs.map { |pair| 
      wavelet_pair = []
      wavelet_pair[0] = (pair[0] + pair[1]) / 2.0
      wavelet_pair[1] = pair[0] - wavelet_pair[0]
      wavelet_pair
    }.transpose

    return step original, avg_co[0] + avg_co[1]
  end
end
