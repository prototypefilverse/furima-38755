# テーブル設計

## users テーブル

| Column             | Type   | Options                               |
| ------------------ | ------ | ------------------------------------- |
| nickname           | string | null: false                           |
| email              | string | null: false, unique: true             |
| encrypted_password | string | null: false, 半角英数字混合必須          | 
| first_name         | string | null: false, 全角入力必須               |
| family_name        | string | null: false, 全角入力必須               |
| first_name_kana    | string | null: false, 全角（カタカナ）での入力必須  |
| family_name_kana   | string | null: false, 全角（カタカナ）での入力必須  |
| birth_day          | date   | null: false                           |


### Association

- has_many :items 
- has_many :orders


## items テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | -----------------------------  |   
| user             | references | null: false, foreign_key: true |
| image            |            | (Active Storage)               |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| price            | integer    | null: false, ¥300~¥9,999,999の間のみ保存可能      
|                  |            |              半角数値のみ保存可能

### Association

- belongs_to :user
- has_one :order
- has_one_attached :image

## orders テーブル

| Column    | Type       | Options                        |
| --------  | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :payment


## payments テーブル

| Column        | Type       | Options                        |
| --------      | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true |
| postcode      | string     | null: false, 「3桁ハイフン4桁」の半角文字列のみ保存可能   |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false, 10桁以上11桁以内の半角数値のみ保存可能(ハイフン不可)  |


### Association

belongs_to :order