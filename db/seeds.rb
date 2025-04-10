# db/seeds.rb

Room.create([
  { name: "Small Meeting Room", description: "Ideal for small group meetings", roomQrCode: "QR001" },
  { name: "Medium Conference Room", description: "Suitable for medium-sized conferences",  roomQrCode: "QR002" },
  { name: "Large Conference Room", description: "Perfect for large events and conferences",  roomQrCode: "QR003" },
  { name: "Executive Suite", description: "Luxurious room for executive meetings",  roomQrCode: "QR004" },
  { name: "Auditorium", description: "Spacious room for seminars and presentations",  roomQrCode: "QR005" }
])
