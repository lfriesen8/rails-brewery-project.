require 'csv'

puts "Resetting database..."
Beer.destroy_all
Brewery.destroy_all

puts "Seeding breweries..."
CSV.foreach(Rails.root.join('db', 'breweries.csv'), headers: true) do |row|
  Brewery.create!(
    id: row[0].to_i,  # Explicitly setting the ID
    name: row['name']&.strip || "Unknown",
    city: row['city']&.strip || "Unknown",
    state: row['state']&.strip || "Unknown"
  )
end

puts "✅ Seeded #{Brewery.count} breweries."

puts "Seeding beers..."
CSV.foreach(Rails.root.join('db', 'beers.csv'), headers: true) do |row|
  brewery = Brewery.find_by(id: row['brewery_id'].to_i)

  if brewery
    Beer.create!(
      name: row['name']&.strip || "Unknown",
      style: row['style']&.strip || "Unknown",
      abv: row['abv'].to_f,
      ibu: row['ibu'].to_i,
      ounces: row['ounces'].to_f,
      brewery: brewery
    )
  else
    puts "⚠️ No brewery found for beer '#{row['name']}', skipping."
  end
end

puts "✅ Seeded #{Beer.count} beers."

