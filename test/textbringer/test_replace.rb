require_relative "../test_helper"

class TestReplace < Textbringer::TestCase
  def test_query_replace_regexp
    buffer = Buffer.current
    buffer.insert(<<EOF)
　劉備は、船の商人らしい男を見かけてあわててそばへ寄って行った。
「茶を売って下さい、茶が欲しいんですが」
「え、茶だって？」
　洛陽《らくよう》の商人は、鷹揚《おうよう》に彼を振向いた。
「あいにくと、お前さんに頒《わ》けてやるような安茶は持たないよ。一葉《ひとは》いくらというような佳品しか船にはないよ」
「結構です。たくさんは要《い》りませんが」
「おまえ茶をのんだことがあるのかね。地方の衆が何か葉を煮てのんでいるが、あれは茶ではないよ」
「はい。その、ほんとの茶を頒《わ》けていただきたいのです」
　彼の声は、懸命だった。
　茶がいかに貴重か、高価か、また地方にもまだない物かは、彼もよくわきまえていた。
EOF
    buffer.beginning_of_buffer
    push_keys("yn.")
    query_replace_regexp("茶", "水")
    assert_equal(<<EOF, buffer.to_s)
　劉備は、船の商人らしい男を見かけてあわててそばへ寄って行った。
「水を売って下さい、茶が欲しいんですが」
「え、水だって？」
　洛陽《らくよう》の商人は、鷹揚《おうよう》に彼を振向いた。
「あいにくと、お前さんに頒《わ》けてやるような安茶は持たないよ。一葉《ひとは》いくらというような佳品しか船にはないよ」
「結構です。たくさんは要《い》りませんが」
「おまえ茶をのんだことがあるのかね。地方の衆が何か葉を煮てのんでいるが、あれは茶ではないよ」
「はい。その、ほんとの茶を頒《わ》けていただきたいのです」
　彼の声は、懸命だった。
　茶がいかに貴重か、高価か、また地方にもまだない物かは、彼もよくわきまえていた。
EOF
    buffer.beginning_of_buffer
    push_keys("n!")
    query_replace_regexp("茶", "水")
    assert_equal(<<EOF, buffer.to_s)
　劉備は、船の商人らしい男を見かけてあわててそばへ寄って行った。
「水を売って下さい、茶が欲しいんですが」
「え、水だって？」
　洛陽《らくよう》の商人は、鷹揚《おうよう》に彼を振向いた。
「あいにくと、お前さんに頒《わ》けてやるような安水は持たないよ。一葉《ひとは》いくらというような佳品しか船にはないよ」
「結構です。たくさんは要《い》りませんが」
「おまえ水をのんだことがあるのかね。地方の衆が何か葉を煮てのんでいるが、あれは水ではないよ」
「はい。その、ほんとの水を頒《わ》けていただきたいのです」
　彼の声は、懸命だった。
　水がいかに貴重か、高価か、また地方にもまだない物かは、彼もよくわきまえていた。
EOF
  end
end
