class Connection < ActiveRecord::Base
  belongs_to :engine, foreign_key: "engineName"

  def self.combine
    all.map { |connection| connection.sessionName }.join(",")
  end

  def get_exchange
    if exchange ==  1
      return "NYSE"
    elsif exchange ==  2
      return "NASDAQ"
    elsif exchange ==  3
      return "BATS"
    else
      return "DIRECT EDGE"
    end
  end

  def get_ip
    ip.to_s.insert(3, '.').insert(6, '.').insert(10, '.')
  end
end
