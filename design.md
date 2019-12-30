pdType expected features

 * 提供猜測給定維度的輔助函式. 例如, guess(dim) 傳回 [[type, match-percent], ...] 並依以下規則排序:
   1. match-percent 超過 N% 的 排前面 ( N = 80% ? )
   2. 若 match-percent 同分, pdType 複雜度高的, 排前面

 * 與其為 type 給定複雜分數, 不如讓 type 依複雜度排序: ( 複雜度高的排前面? )
   [date, number, order, string]

 * 給定一組 types, ( 例如 [number, string, number] ), 提供一個自動對應函式, 以 greedy 做 data type mapping

 * 資料類型可考慮資料內涵, 例如 stddeviation, 規律性等等.
   比方說 1991, 1992, 1993 就會比 30.1, 30.7, 45.2 更適合當序列資料.
