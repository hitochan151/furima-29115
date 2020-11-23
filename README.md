# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| -----------------  | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| family_name        | string | null: false |
| frist_name         | string | null: false |
| family_name_kana   | string | null: false |
| frist_name_kana    | string | null: false |
| brith_day          | date   | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_many :purchasers


## items テーブル

| Column               | Type       | Options     |
| ---------------      | ------     | ----------- |
| user                 | references | null: false , foreign_key: true |
| name                 | string     | null: false |
| selling_price        | integer    | null: false |
| description          | text       | null: false |
| category_id          | integer    | null: false |
| product_status_id    | integer    | null: false |
| shipping_charges_id  | integer    | null: false |
| prefecture_id       | integer    | null: false |
| days_id              | integer    | null: false |

### Association

- belongs_to :user
- has_one :purchaser

## purchaser テーブル

| Column  | Type        | Options                        |
| ------- | --------    | ----------------------------   |
| user    | references  | null: false, foreign_key: true |
| item    | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : destniation

## destniation テーブル

| Column           | Type   | Options     |
| ---------------  | ------ | ----------- |
| post_code        | string | null: false |
| prefecture_id    | integer| null: false |
| city             | string | null: false |
| address          | string | null: false |
| building_name    | string |             |
| phone_number     | string | null: false |
| purchaser        | string | foreign_key: true |

### Association

- belongs_to : purchaser
