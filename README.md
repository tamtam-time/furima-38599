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
| card_number        |integer | null: false |
| deadline           |integer | null: false |
| code               |integer | null: false |
| postalcode         |integer | null: false |
| prefectures        |string  | null: false |
| municipaldistrict  |string  | null: false |
| district           |string  | null: false |
| building           |string  |             |
| phone              |integer | null: false |

### Association

- has_many :items
- has_many :comments

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
| user       | references | null: false, foreign_key: true  |


### Association

- has_many :comments

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| items     | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

