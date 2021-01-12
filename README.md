# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_name_kana      | string | null: false |
| first_name_kana     | string | null: false |
| birthday            | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| name              | string     | null: false       |
| explanation       | text       | null: false       |
| category_id       | integer    | null: false       |
| state_id          | integer    | null: false       |
| delivery_price_id | integer    | null: false       |
| prefectures_id    | integer    | null: false       |
| delivery_time_id  | integer    | null: false       |
| price             | integer    | null: false       |
| user              | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :purchase
- has_one :address

## address テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| postal_code      | string     | null: false       |
| prefectures_id   | integer    | null: false       |
| municipality     | string     | null: false       |
| address          | string     | null: false       |
| building_name    | string     |                   |
| phone_number     | string     | null: false       |
| purchase         | references | foreign_key: true |

### Association

- belongs_to :purchase
