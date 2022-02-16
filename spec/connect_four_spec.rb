require '../lib/connect_four.rb'

describe ConnectFour do
  describe "#whitePlay" do
    it "Places a white piece on the board." do
      game = ConnectFour.new
      expect(game.whitePlay(7)).to eql(
        [[nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, "U+26AA"]])
    end
    it "Raises a error if out of range." do
      game = ConnectFour.new
      expect(game.whitePlay(8)).to eql("Out of range! Input a differnt column")
    end

    it "Places a white piece on top of a dark piece" do
      game = ConnectFour.new
      game.playBlack(1)
      expect(game.playWhite(1)).to eql(
        [,,,,,,],
        [,,,,,,],
        [,,,,,,],
        [,,,,,,],
        [,,,,,,"U+26AA"],
        [,,,,,,"U+26AB"])
  end
end
