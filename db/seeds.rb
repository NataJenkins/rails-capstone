# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  name: 'user1',
  username: 'user1',
)

# Category seeds

Category.create(
  name: 'Gun',
  priority: 3
)

Category.create(
  name: 'Toy',
  priority: 2
)
Category.create(
  name: 'Utility',
  priority: 1
)
Category.create(
  name: 'Hound',
  priority: 2
)
Category.create(
  name: 'Terrier',
  priority: 5
)
Category.create(
  name: 'Working',
  priority: 5
)

# article seeds

Article.create(
  author_id: User.find_by(name: 'user1').id,
  title: "Labrador Retriever",
  content: "The sweet-faced, lovable Labrador Retriever is America’s most popular dog breed. Labs are friendly, outgoing, and high-spirited companions who have more than enough affection to go around for a family looking for a medium-to-large dog.",
  cover: 'labrador.ret.jpg'
)

Article.create(
  author_id: User.find_by(name: 'user1').id,
  title: "Chihuahua",
  content: "The Chihuahua is a tiny dog with a huge personality. A national symbol of Mexico, these alert and amusing "purse dogs" stand among the oldest breeds of the Americas, with a lineage going back to the ancient kingdoms of pre-Columbian times.",
  cover: 'Chihuahua.jpg'
)

Article.create(
  author_id: User.find_by(name: 'user1').id,
  title: "Canaan",
  content: "One of the AKC's oldest breeds, the Canaan Dog is the national dog of Israel. This quick, medium-sized pasture dog is docile with family, aloof with strangers. The ever-alert Canaan is a vocal and persistent guardian of flock and home.",
  cover: 'canaan.jpg'
)

Article.create(
  author_id: User.find_by(name: 'user1').id,
  title: "Greyhound",
  content: "The champion sprinter of dogdom, the Greyhound is a gentle, noble, and sweet-tempered companion with an independent spirit. For thousands of years these graceful hounds have been an object of fascination for artists, poets, and kings.",
  cover: 'Greyhound.jpg'
)
Article.create(
  author_id: User.find_by(name: 'user1').id,
  title: "American Staffordshire",
  content: "The American Staffordshire Terrier, known to their fans as AmStaffs, are smart, confident, good-natured companions. Their courage is proverbial. A responsibly bred, well-socialized AmStaff is a loyal, trustworthy friend to the end.",
  cover: 'American-Staffordshire.jpg'
)
Article.create(
  author_id: User.find_by(name: 'user1').id,
  title: "German Shepherd",
  content: "Generally considered dogkind’s finest all-purpose worker, the German Shepherd Dog is a large, agile, muscular dog of noble character and high intelligence. Loyal, confident, courageous, and steady, the German Shepherd is truly a dog lover’s delight.",
  cover: 'GermanShep.jpg'
)

# Bridge table

ArticleCategory.create(
  article_id: Article.find_by(title: 'Labrador Retriever').id,
  category_id: Category.find_by(name: 'Gun').id
)

ArticleCategory.create(
  article_id: Article.find_by(title: "Chihuaua").id,
  category_id: Category.find_by(name: 'Toy').id
)

ArticleCategory.create(
  article_id: Article.find_by(title: "Canaan").id,
  category_id: Category.find_by(name: 'Utility').id
)

ArticleCategory.create(
  article_id: Article.find_by(title: "Greyhound").id,
  category_id: Category.find_by(name: 'Hound').id
)

ArticleCategory.create(
  article_id: Article.find_by(title: "American Staffordshire").id,
  category_id: Category.find_by(name: 'Terrier').id
)

ArticleCategory.create(
  article_id: Article.find_by(title: "German Shepherd").id,
  category_id: Category.find_by(name: 'Working').id
)

# Vote seeds

Vote.create(
  user_id: User.find_by(name: 'user1').id,
  article_id: Article.find_by(title: "Chihuahua").id
)

Vote.create(
  user_id: User.find_by(name: 'user1').id,
  article_id: Article.find_by(title: "American Staffordshire").id
)

Vote.create(
  user_id: User.find_by(name: 'user1').id,
  article_id: Article.find_by(title: "Canaan").id
)