# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| -----------------  | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| user_image         | string | null: false |
| family_name        | string | null: false |
| frist_name         | string | null: false |
| family_name_kana   | string | null: false |
| frist_name_kana    | string | null: false |
| brith_day          | date   | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_one :card
- has_one :destniation


## items テーブル

| Column               | Type    | Options     |
| ---------------      | ------  | ----------- |
| user_id              | string  | null: false |
| item_name            | string  | null: false |
| selling_price        | string  | null: false |
| comment              | string  | null: false |
| category_id          | string  | null: false |
|  item_description_id | integer | null: false |
| shipping_charges_id  | integer | null: false |
| prefectures_id       | integer | null: false |
| days_id              | integer | null: false |

### Association

- belongs_to : catagory
- belongs_to :user
- has_many : image

## destniation テーブル

| Column           | Type   | Options     |
| ---------------  | ------ | ----------- |
| user_id          | string | null: false |
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

- has_one :users

## card テーブル

| Column           | Type   | Options     |
| ---------------  | ------ | ----------- |
| user_id          | integer | null: false |
| customer_id      | integer | null: false |
| card_id          | integer | null: false |

### Association

- has_one :users
