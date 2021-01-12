# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| last_name        | string | null: false |
| first_name       | string | null: false |
| last_name(kana)  | string | null: false |
| first_name(kana) | string | null: false |
| birthday         | string | null: false |

### Association

- has_many :items
- has_many :purchase

## items テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| explanation      | string     | null: false       |
| category         | string     | null: false       |
| state            | string     | null: false       |
| delivery_price   | string     | null: false       |
| delivery_time    | string     | null: false       |
| price            | string     | null: false       |
| user             | references | foreign_key: true |

### Association

- belongs_to :users
- has_one :purchase

## purchase テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association

- belongs_to :items
- belongs_to :purchase
- has_one :address

## address テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| postal_code      | string     | null: false       |
| prefectures      | string     | null: false       |
| municipality     | string     | null: false       |
| address          | string     | null: false       |
| building_name    | string     | null: false       |
| phone_number     | string     | null: false       |
| purchase         | references | foreign_key: true |

### Association

- belongs_to :purchase
