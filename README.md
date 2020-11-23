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
| shipping_charges_id  | integer    | null: false |
| prefectures_id       | integer    | null: false |
| days_id              | integer    | null: false |

### Association

- belongs_to :user


## purchaser テーブル

| Column  | Type        | Options                        |
| ------- | --------    | ----------------------------   |
| user    | references  | null: false, foreign_key: true |
| item    | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one : destniation

## destniation テーブル

| Column           | Type   | Options     |
| ---------------  | ------ | ----------- |
| family_name      | string | null: false |
| frist_name       | string | null: false |
| family_name_kana | string | null: false |
| frist_name_kana  | string | null: false |
| post_code        | string | null: false |
| prefecture       | string | null: false |
| city             | string | null: false |
| adress           | string | null: false |
| building_name    | string | null: false |
| phone_numder     | string | null: false |

### Association

- belongs_to : purchaser
