module ApplicationHelper
  def data_br(data_us)
    data_us.strftime("%d/%m/%Y")
  end

  def ambiente_br
    if Rails.env.development?
      "Desenvolvimento"
    elsif Rails.env.test?
      "Teste"
    else
      "Produção"
    end
  end
end
