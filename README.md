## users

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :purchase_records

## items

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| text                | text       | null: false                    |
| category_id         | integer    | null: false                    |
| product_status_id   | integer    | null: false                    |
| shipping_charges_id | integer    | null: false                    |
| shipping_area_id    | integer    | null: false                    |
| days_to_ship_id     | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record

## purchase_records

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer_information

## buyer_informations

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| shipping_area_id    | integer    | null: false                    |
| municipality        | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |
| order               | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record