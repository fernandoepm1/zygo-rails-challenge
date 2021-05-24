# frozen_string_literal: true

def random_image
  [
    'https://i.pinimg.com/736x/d6/c9/fc/d6c9fcf5155be81b318904b1576a9242.jpg',
    'https://freevector-images.s3.amazonaws.com/uploads/vector/preview/36970/36970.png',
    'https://media.istockphoto.com/vectors/stack-of-books-vector-id165958054?b=1&k=6&m=165958054&s=612x612&w=0&h=LEFy4__zCRsgWG7a5KqwTLqA2MU03tJ9VlWRQ2wUMIM=',
    'https://www.adazing.com/wp-content/uploads/2019/02/open-book-clipart-07-300x300.png',
    'https://image.shutterstock.com/image-illustration/old-opened-book-color-illustration-260nw-52557637.jpg',
    'https://image.shutterstock.com/image-vector/ancient-opened-book-vector-illustration-260nw-53920186.jpg',
    'https://static.vecteezy.com/system/resources/thumbnails/000/297/034/small/auqf_bgq8_190123.jpg',
    'https://cdn.pixabay.com/photo/2014/04/02/14/12/book-306468__340.png',
    'https://www.seekpng.com/png/detail/119-1190407_open-book-vector-book.png',
    'https://banner2.cleanpng.com/20180328/dqe/kisspng-book-fly-away-home-a-day-s-work-clip-art-open-book-5abbb684c96e02.4374658715222513968251.jpg'
  ].sample
end

10.times do
  author = FactoryBot.create(:author)

  5.times do
    image_url = random_image

    FactoryBot.create(:book, author: author, image_url: image_url)
  end
end
