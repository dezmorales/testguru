# frozen_string_literal: true

module TestPassagesHelper
  def timer(times_up)
    tag.div(id: 'timer',
            class: 'row justify-content-center border rounded-pill mb-4',
            data: { times_up: })
  end
end
