# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           |string  | null: false |
| email              |string  | null: false |
| encrypted_password |string  | null: false |
| first_name         |string  | null: false |
| last_name          |string  | null: false |
| birthday           |integer | null: false |

### Association

- has_many :items
- has_many :buys
- has_one :cards

## items テーブル

| Column     | Type       | Options                         |
| ---------- | ---------- | ------------------------------- |
| name       | string     | null: false                     |
| explain    | text       | null: false                     |
| category   | string     | null: false                     |
| status     | string     | null: false                     |
| postage    | integer    | null: false                     |
| area       | string     | null: false                     |
| days       | integer    | null: false                     |
| price      | integer    | null: false                     |

### Association

- belongs_to :users
- has_one :buys

## buys テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | --------------------------------|
| postalcode         |integer     | null: false                     |
| prefectures        |string      | null: false                     |
| municipaldistrict  |string      | null: false                     |
| district           |string      | null: false                     |
| building           |string      |                                 |
| phone              |integer     | null: false                     |

### Association

- has_many :users
- has_one :cards

## cards テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| card_number        |integer | null: false |
| deadline           |integer | null: false |
| code               |integer | null: false |

- belongs_to :users
- belongs_to :buys