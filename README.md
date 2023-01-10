# README

# テーブル設計

## users テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | --------------------------------|
| nickname           |string      | null: false                     |
| email              |string      | null: false, unique: true       |
| encrypted_password |string      | null: false                     |
| first_name         |string      | null: false                     |
| last_name          |string      | null: false                     |
| first_name_yomi    |string      | null: false                     |
| last_name_yomi     |string      | null: false                     |
| birthday           |integer     | null: false                     |
| history            |references  | null: false, foreign_key: true  |

### Association

- has_many :items
- belongs_to :historys

## items テーブル

| Column     | Type       | Options                         |
| ---------- | ---------- | ------------------------------- |
| item_name  | string     | null: false                     |
| explain    | text       | null: false                     |
| category_id| integer    | null: false                     |
| status_id  | integer    | null: false                     |
| postage_id | integer    | null: false                     |
| area_id    | integer    | null: false                     |
| send_day_id| integer    | null: false                     |
| price      | integer    | null: false                     |
| user       | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :history

## destinations テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | --------------------------------|
| postalcode         |string      | null: false                     |
| prefectures_id     |integer     | null: false                     |
| municipaldistrict  |string      | null: false                     |
| district           |string      | null: false                     |
| building           |string      |                                 |
| phone              |string      | null: false                     |
| history            |references  | null: false, foreign_key: true  |

### Association

- has_many :users
- belongs_to :history

## historys テーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| user               | references  | null: false, foreign_key: true  |
| item               | references  | null: false, foreign_key: true  |

### Association

- belongs_to :users
- belongs_to :item
- has_one :destination