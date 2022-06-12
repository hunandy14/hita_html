https://javasparrowk.blogspot.com/2020/08/jsp-formsubmitchromeiesubmit-button.html

主要的問題是因為IE可以連續submit連送2次。但是chrome為了避免購物車連送重複訂單的問題直接給禁止了。
改成一次點擊事件只能提交一次而已，而且提交的時機是在事件結束後，提交第一次執行submit時的表單快照。

設置成 input bottom 結束後"好像"不會自動提交。且提交時只是先封存表單快照，等事件結束後才提交，第二次以上的提交會無效。
設置成 input submit 後事件結束不會自動提交要自己寫JS提交，由JS提交後會立刻跳轉畫面。

解決辦法是用 ifram 避免提交後畫面跳轉，並利用 ifram 觸發 init 事件來提交第二次。(否則一個事件只能提交一次)。
