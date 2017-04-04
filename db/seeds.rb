def copy_image_fixture(file_name, id)
  dir = Rails.root.join('public', 'uploads')
  Dir.mkdir(dir) unless File.directory?(dir)
  FileUtils.cp(file_name, dir.join(id.to_s))
end

cpus_category = Category.create(name_ru: 'Процессор', name_en: 'CPUs')
motherboards_category = Category.create(name_ru: 'Материнская плата', name_en: 'Motherboards')
ram_category = Category.create(name_ru: 'ОЗУ', name_en: 'RAM')
hdd_category = Category.create(name_ru: 'Жесткий диск', name_en: 'HDDs')

fixtures_category = Category.create(name_ru: 'Фикстуры', name_en: 'Fixtures')

fixtures_path = Rails.root.join('app', 'assets', 'images', 'fixtures')

cpu = Product.create(title_en: 'Intel Core i7', title_ru: 'Интел Кор i7', price: 300, description_en: Faker::Lorem.paragraph, description_ru: "Отличный товар", category: cpus_category)
copy_image_fixture(fixtures_path.join('cpu.jpg'), cpu.id)

ram = Product.create(title_en: '4GB DDR3 RAM', title_ru: '4ГБ ДДР3 ОЗУ', price: 40, description_en: Faker::Lorem.paragraph, description_ru: "Отличный товар", category: ram_category)
copy_image_fixture(fixtures_path.join('ram.jpg'), ram.id)

hdd = Product.create(title_en: '1TB Seagate HDD', title_ru: '1TB Сигата жесткий диск',  price: 60, description_en: Faker::Lorem.paragraph, description_ru: "Отличный товар", category: hdd_category)
copy_image_fixture(fixtures_path.join('hdd.jpg'), hdd.id)

mb = Product.create(title_en: 'Asus P5Q3', title_ru: 'Асус P5Q3', price: 120, description_en: Faker::Lorem.paragraph, description_ru: "Отличный товар", category: motherboards_category)
copy_image_fixture(fixtures_path.join('mb.jpg'), mb.id)

50.times do
  Product.create(title_en: Faker::Commerce.product_name,
                 title_ru: "Наиманование продукта",
                 price: Faker::Commerce.price,
                 description_en: Faker::Lorem.paragraph,
                 description_ru: "Отличный товар",
                 category: fixtures_category)
end

user = User.create(name: 'John Doe', email: 'johndoe@example.com', password: '12345678', password_confirmation: '12345678')
admin_user = User.create(name: 'Admin', email: 'admin@example.com', password: 'adminadminadmin', password_confirmation: 'adminadminadmin', admin: true)