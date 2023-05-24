50.times do
    Street.create(
      name: FFaker::AddressPL.unique.street,    
      notes: Faker::Lorem.paragraph(sentence_count: 1, supplemental: false, random_sentences_to_add: 2),
      archive: Faker::Boolean.boolean(true_ratio: 0.2))
end
1000.times do
    Place.create(
      address: Faker::Number.between(from: 1, to: 100),
      notes: Faker::Lorem.paragraph(sentence_count: 1, supplemental: false, random_sentences_to_add: 2),
      archive: Faker::Boolean.boolean(true_ratio: 0.2),
      street_id: Faker::Number.between(from: 1, to: 50))
end
2000.times do
  Parishioner.create(
    firstname: FFaker::NamePL.female_first_name,
    lastname: FFaker::NamePL.female_last_name,
    birth: Faker::Date.between(from: '1940-09-23', to: '2000-09-25'),
    birth_place: FFaker::AddressPL.city,
    death_mark: Faker::Boolean.boolean(true_ratio: 0.1),
    death_date: Faker::Date.between(from: '2000-09-25', to: '2014-09-25'),
    baptism_date: Faker::Date.between(from: '1940-09-23', to: '2000-09-25'),
    baptism_parish: FFaker::AddressPL.full_address,
    baptism_number: Faker::Number.between(from: 1, to: 300),
    confirmation_name: FFaker::NamePL.female_first_name,
    confirmation_witness: FFaker::NamePL.full_name,
    confirmation_date: Faker::Date.between(from: '2000-09-25', to: '2014-09-25'),
    confirmation_number: Faker::Number.between(from: 1, to: 300),
    notes: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
    archive: Faker::Boolean.boolean(true_ratio: 0.2),
    place_id: Faker::Number.between(from: 1, to: 1000))
end
2000.times do
  Parishioner.create(
    firstname: FFaker::NamePL.male_first_name,
    lastname: FFaker::NamePL.male_last_name,
    birth: Faker::Date.between(from: '1940-09-23', to: '2000-09-25'),
    birth_place: FFaker::AddressPL.city,
    death_mark: Faker::Boolean.boolean(true_ratio: 0.1),
    death_date: Faker::Date.between(from: '2000-09-25', to: '2014-09-25'),
    baptism_date: Faker::Date.between(from: '1940-09-23', to: '2000-09-25'),
    baptism_parish: FFaker::AddressPL.full_address,
    baptism_number: Faker::Number.between(from: 1, to: 300),
    confirmation_name: FFaker::NamePL.male_first_name,
    confirmation_witness: FFaker::NamePL.full_name,
    confirmation_date: Faker::Date.between(from: '2000-09-25', to: '2014-09-25'),
    confirmation_number: Faker::Number.between(from: 1, to: 300),
    notes: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
    archive: Faker::Boolean.boolean(true_ratio: 0.2),
    place_id: Faker::Number.between(from: 1, to: 1000))
end

20.times do
  Minister.create(
    fullname: FFaker::NamePL.male_full_name,
    notes: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
    archive: Faker::Boolean.boolean(true_ratio: 0.2))
end

8000.times do
  Visit.create(
    issue: Faker::Date.between(from: '1999-09-23', to: '2021-09-25'),
    parishioner_id: Faker::Number.between(from: 1, to: 4000),
    minister_id: Faker::Number.between(from: 1, to: 20),
    eucharist: Faker::Boolean.boolean(true_ratio: 0.9),
    confession: Faker::Boolean.boolean(true_ratio: 0.3),
    anointing: Faker::Boolean.boolean(true_ratio: 0.1),
    notes: Faker::Lorem.paragraph(sentence_count: 1, supplemental: false, random_sentences_to_add: 3))
end

10.times do
  Feature.create(
    name: Faker::Number.between(from: 2000, to: 2021),
    notes: Faker::Lorem.paragraph(sentence_count: 2),
    archive: Faker::Boolean.boolean(true_ratio: 0.2))
end

10.times do
  Characteristic.create(
    name: Faker::Number.between(from: 1967, to: 2021),
    notes: Faker::Lorem.paragraph(sentence_count: 2),
    archive: Faker::Boolean.boolean(true_ratio: 0.2))
end

1000.times do
  FeaturesPlace.create(
  place_id: Faker::Number.between(from: 1, to: 1000),
  feature_id: Faker::Number.between(from: 1, to: 10))
end

1000.times do
  CharacteristicsParishioner.create(
  parishioner_id: Faker::Number.between(from: 1, to: 4000),
  characteristic_id: Faker::Number.between(from: 1, to: 10))
end