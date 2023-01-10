# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| nickname           |string  | null: false               |
| email              |string  | null: false, unique: true |
| encrypted_password |string  | null: false               |
| first_name         |string  | null: false               |
| last_name          |string  | null: false               |
| first_name_yomi    |string  | null: false               |
| last_name_yomi     |string  | null: false               |
| birthday           |integer | null: false               |

### Association

- belongs_to :items
- belongs_to :destinations
- belongs_to :historys

## items テーブル

| Column     | Type       | Options                         |
| ---------- | ---------- | ------------------------------- |
| item_name  | string     | null: false                     |
| explain    | text       | null: false                     |
| category   | string     | null: false                     |
| status     | string     | null: false                     |
| postage_id | integer    | null: false                     |
| area_id    | integer    | null: false                     |
| send_day   | integer    | null: false                     |
| price      | integer    | null: false                     |
| user       | references | null: false, foreign_key: true  |

### Association

- has_one :user
- belongs_to :history

## destinations テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | --------------------------------|
| postalcode         |string      | null: false                     |
| prefectures_id     |string      | null: false                     |
| municipaldistrict  |string      | null: false                     |
| district           |string      | null: false                     |
| building           |string      |                                 |
| phone              |string      | null: false                     |
| history            |references  | null: false, foreign_key: true  |

### Association

- has_many :users
- belongs_to :historys

## historys テーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| item_name          | string      | null: false                     |
| user               | references  | null: false, foreign_key: true  |
| destination        | references  | null: false, foreign_key: true  |

### Association

- has_many :users
- belongs_to :historys

- has_one :item
- belongs_to :history

- has_one :destination
- belongs_to :history