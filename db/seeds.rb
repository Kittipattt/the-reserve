# db/seeds.rb
Room.create!(
  name: 'Executive Conference Room',
  description: 'A premium room designed for high-level meetings, equipped with a large screen and executive furniture.',
  capacity: 12,
  price: 250.0,
  image_url: 'https://via.placeholder.com/400x250?text=Executive+Room'
)

Room.create!(
  name: 'Boardroom',
  description: 'Perfect for board meetings, this room has a large table with comfortable seating for up to 15 people.',
  capacity: 15,
  price: 350.0,
  image_url: 'https://via.placeholder.com/400x250?text=Boardroom'
)

Room.create!(
  name: 'Casual Meeting Room',
  description: 'A casual room for smaller meetings with a relaxed setting, perfect for brainstorming sessions.',
  capacity: 8,
  price: 150.0,
  image_url: 'https://via.placeholder.com/400x250?text=Casual+Room'
)
