defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    earth_time = seconds / 31557600
    case planet do
      :earth -> earth_time
      :mercury -> earth_time / 0.2408467
      :venus -> earth_time / 0.61519726
      :mars -> earth_time / 1.8808158
      :jupiter -> earth_time / 11.862615
      :saturn -> earth_time / 29.447498
      :uranus -> earth_time / 84.016846
      :neptune -> earth_time / 164.79132
    end
  end
end
