# my-closet DB設計

<!-- 完成 -->
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index|
|email|string|null: false, unique:true|
|password|string|null: false|
|image|string||
### Association
- has_many :outfits
- has_many :outfit_likes
- has_many :outfit_comments
- has_many :items
- has_many :item_likes
- has_many :item_comments

<!-- 完成 -->
## outfitsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|text|text||
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :outfit_likes
- has_many :outfit_comments
- has_many :item_outfits
- has_many :items, through: :item_outfits

<!-- 完成 -->
## outfit_likesテーブル
|Column|Type|Options|
|------|----|-------|
|outfit_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :outfit
- belongs_to :user

<!-- 完成 -->
## outfit_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|outfit_id|references|null: false, foreign_key: true|
|user_id|references|null: false,foreign_key: true|
### Association
- belongs_to :outfit
- belongs_to :user

<!-- 完成 -->
## item_outfitsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null:false, foreign_key: true|
|outfit_id|references|null:false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :outfit 

<!-- 完成 -->
## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|text|text||
### Association
- belongs_to :user
- has_many :item_likes
- has_many: item_comments
- has_many :outfits, through: :item_outfits
- belongs_to :size
- belongs_to :brand
- belongs_to :category
- has_many :color_items
- has_many :colors, through: :color_items

<!-- 完成 -->
## item_likesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null:false, foreign_key: true|
|user_id|references|null:false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

<!-- 完成 -->
## item_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|item_id|references|null:false,foreign_key: true|
|user_id|references|null:false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user


## colorsテーブル
|Column|Type|Options|
|------|----|-------|
|type|string|null: false|
### Association
- has_many :items, through: :color_items
- has_many :color_items

<!-- 完成 -->
## color_itemsテーブル
|Column|Type|Options|
|------|----|-------|
|color_id|references|null:false, foreign_key: true|
|item_id|references|null:false, foreign_key: true|
### Association
- belongs_to :color
- belongs_to :item


## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|type|string||
### Association
- has_many :items


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
- has_many :items


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|type|string|null: false|
|item_id|references|null: false, foreign_key:true|
### Association
- has_many :items
