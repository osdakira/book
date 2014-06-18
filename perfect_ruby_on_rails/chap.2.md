# MVC

### バリデーション

- validates_associated: 関連先のレコードが valid であること
- confirmation

### callback
- after_initialize
- after_find

### コールバックが動かないメソッド

- decrement
- decrement_counter
- increment
- increment_counter
- toggle
- touch
- update_counters

- delete
- delete_all
- update_column
- update_columns
- update_all

### render

- 3.2: 4.1
- text: [:plain, :html, :body]
- :nothing
- :template
- :file
- :inline

- 4.1: variant で出し分け
- UserAgent で出し分けるとか

- slim

### url_for

- url_for
- helper.distance_of_time_in_words_to_now
