Book.destroy_all

Book.create(
title: 'Hyperion',
autor: 'gustavo souza',
description: 'texto descritivo deste livro',
amazon_id:   "77657533",
finished_on: 7.days.ago,
rating: 4
)

Book.create(
title: 'Hyperion 2',
autor: 'gustavo souza',
description: 'texto descritivo deste livro',
amazon_id:   "77657534",
finished_on: 3.days.ago,
rating: 5
)

Book.create(
title: 'Livro do mal',
autor: 'Ze Ninguem',
description: 'texto descritivo deste livro',
amazon_id:   "77657533",
finished_on: 1.days.ago,
rating: 2
)

puts 'books succefuly created by seed!'
