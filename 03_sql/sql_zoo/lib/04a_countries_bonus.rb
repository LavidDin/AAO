# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
    SELECT
      name
    FROM
      countries
    WHERE
      gdp > ALL (
        SELECT
          gdp
        FROM
          countries
        WHERE
          continent = 'Europe' AND gdp IS NOT NULL
      )
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
    SELECT
      c1.continent,
      name,
      c1.area
    FROM
      countries AS c1
    JOIN (
      SELECT
        continent,
        MAX(area) AS area
      FROM
        countries
      GROUP BY
        continent
    ) AS c2
    ON
      c1.continent = c2.continent
    AND c1.area = c2.area
  SQL
end


def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
    SELECT
      name,
      continent
    FROM
      countries AS c1
    WHERE
      population > ALL
      (
        SELECT
          population * 3
        FROM
          countries AS c2
        WHERE
          c1.continent = c2.continent
        AND c1.name != c2.name
      )
  SQL
end
