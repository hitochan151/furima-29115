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

## image テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image  | string | null: false |
| item   | string | null: false |

### Association

- belongs_to :items


## catagory テーブル

| Column   | Type   | Options                        |
| -------  | -------| ---------------------------    |
| name     | string | null: false, foreign_key: true |
| ancestry | string | null: false, foreign_key: true |

### Association

- has_many : items

## items テーブル

| Column           | Type   | Options     |
| ---------------  | ------ | ----------- |
| category_id      | string | null: false |
| user_id          | string | null: false |
| item_name        | string | null: false |
| item_description | string | null: false |
| category         | string | null: false |
| product_ status  | string | null: false |
| shipping_charges | string | null: false |
| prefectures      | string | null: false |
| days             | datetime | null: false |
| selling_price    | string | null: false |

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
