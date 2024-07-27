CREATE TABLE "UserProgress"(
    "progress_id" SERIAL,
    "id" INTEGER NULL,
    "lesson_id" INTEGER NULL,
    "times_reviewed" INTEGER NULL,
    "next_review" TIMESTAMP(0) WITHOUT TIME ZONE NULL
);
ALTER TABLE "UserProgress"
ADD PRIMARY KEY("progress_id");
CREATE TABLE "Vocabulary"(
    "vocab_id" INTEGER NOT NULL,
    "lesson_id" INTEGER NULL,
    "hiragana" TEXT NOT NULL,
    "word" VARCHAR(50) NOT NULL,
    "meaning" TEXT NOT NULL,
    "example_sentence" TEXT NULL
);
ALTER TABLE "Vocabulary"
ADD PRIMARY KEY("vocab_id");
CREATE TABLE "Lesson"(
    "lesson_id" INTEGER NOT NULL,
    "level_id" INTEGER NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT NULL
);
ALTER TABLE "Lesson"
ADD PRIMARY KEY("lesson_id");
CREATE TABLE "Question"(
    "question_id" INTEGER NOT NULL,
    "lesson_id" INTEGER NOT NULL,
    "type" INTEGER NOT NULL,
    "question_content" TEXT NOT NULL,
    "option_1" TEXT NOT NULL,
    "option_2" TEXT NOT NULL,
    "option_3" TEXT NOT NULL,
    "option_4" TEXT NOT NULL,
    "correct_answer" TEXT NOT NULL
);
ALTER TABLE "Question"
ADD PRIMARY KEY("question_id");
CREATE TABLE "User"(
    "id" SERIAL,
    "username" VARCHAR(50) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "email" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
    "name" VARCHAR(100) NULL,
    "dob" DATE NULL
);
ALTER TABLE "User"
ADD PRIMARY KEY("id");
CREATE TABLE "Kanji"(
    "kanji_id" BIGINT NOT NULL,
    "lesson_id" BIGINT NOT NULL,
    "kanji" VARCHAR(20) NOT NULL,
    "photo" TEXT NOT NULL,
    "on" TEXT NOT NULL,
    "kun" TEXT NOT NULL,
    "meaning" TEXT NOT NULL,
    "example_sentence" TEXT NOT NULL
);
ALTER TABLE "Kanji"
ADD PRIMARY KEY("kanji_id");
CREATE TABLE "Comment"(
    "comment_id" INTEGER NOT NULL,
    "word_id" INTEGER NULL,
    "id" INTEGER NULL,
    "content" TEXT NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
    "kanji_id" INTEGER NULL
);
ALTER TABLE "Comment"
ADD PRIMARY KEY("comment_id");
ALTER TABLE "UserProgress"
ADD CONSTRAINT "userprogress_lesson_id_foreign" FOREIGN KEY("lesson_id") REFERENCES "Lesson"("lesson_id");
ALTER TABLE "Vocabulary"
ADD CONSTRAINT "vocabulary_lesson_id_foreign" FOREIGN KEY("lesson_id") REFERENCES "Lesson"("lesson_id");
ALTER TABLE "Comment"
ADD CONSTRAINT "comment_word_id_foreign_vocab" FOREIGN KEY("word_id") REFERENCES "Vocabulary"("vocab_id");
ALTER TABLE "Comment"
ADD CONSTRAINT "comment_id_foreign" FOREIGN KEY("id") REFERENCES "User"("id");
ALTER TABLE "Question"
ADD CONSTRAINT "question_lesson_id_foreign" FOREIGN KEY("lesson_id") REFERENCES "Lesson"("lesson_id");
ALTER TABLE "Comment"
ADD CONSTRAINT "comment_kanji_id_foreign_kanji" FOREIGN KEY("kanji_id") REFERENCES "Kanji"("kanji_id");
ALTER TABLE "Kanji"
ADD CONSTRAINT "kanji_lesson_id_foreign" FOREIGN KEY("lesson_id") REFERENCES "Lesson"("lesson_id");
ALTER TABLE "UserProgress"
ADD CONSTRAINT "userprogress_id_foreign" FOREIGN KEY("id") REFERENCES "User"("id");
CREATE TABLE "Todo" (
    "todo_id" SERIAL PRIMARY KEY,
    "user_id" INTEGER NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "completed" BOOLEAN DEFAULT FALSE,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE "Todo"
ADD CONSTRAINT "todo_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "User"("id");
INSERT INTO "Lesson" (lesson_id, level_id, title, description)
VALUES (1, 5, 'Lesson 1', 'Minna No Nihongo 1'),
    (2, 5, 'Lesson 2', 'Minna No Nihongo 1'),
    (3, 5, 'Lesson 3', 'Minna No Nihongo 1'),
    (26, 4, 'Lesson 26', 'Minna No Nihongo 2'),
    (27, 4, 'Lesson 27', 'Minna No Nihongo 2'),
    (28, 4, 'Lesson 28', 'Minna No Nihongo 2'),
    (29, 4, 'Lesson 29', 'Minna No Nihongo 2');
INSERT INTO "Vocabulary" (
        vocab_id,
        lesson_id,
        hiragana,
        word,
        meaning,
        example_sentence
    )
VALUES (
        1,
        1,
        'わたし',
        '私',
        'Tôi',
        'わたしはがくせいです。(Tôi là học sinh.)'
    ),
    (
        2,
        1,
        'あなた',
        '貴方',
        'Bạn',
        'あなたはどこから来ましたか？(Bạn đến từ đâu?)'
    ),
    (
        3,
        1,
        'ノート',
        'ノート',
        'Vở, notebook',
        'ノートを持っていますか？(Bạn có mang vở không?)'
    ),
    (
        4,
        1,
        'めいし',
        '名刺',
        'Danh thiếp',
        'これはわたしのめいしです。(Đây là danh thiếp của tôi.)'
    ),
    (
        5,
        1,
        'ボールペン',
        'ボールペン',
        'Bút bi',
        'ボールペンを貸してください。(Xin cho mượn bút bi.)'
    ),
    (
        6,
        1,
        'えんぴつ',
        '鉛筆',
        'Bút chì',
        'えんぴつで書きます。(Viết bằng bút chì.)'
    ),
    (
        7,
        1,
        'つくえ',
        '机',
        'Bàn',
        'つくえの上に本があります。(Có quyển sách trên bàn.)'
    ),
    (
        8,
        1,
        'きょうしつ',
        '教室',
        'Lớp học',
        'きょうしつで勉強します。(Học trong lớp học.)'
    ),
    (
        9,
        1,
        'あさ',
        '朝',
        'Buổi sáng',
        'あさごはんを食べます。(Ăn sáng.)'
    ),
    (
        10,
        1,
        'いきます',
        '行きます',
        'Đi',
        '学校にいきます。(Đi đến trường.)'
    ),
    (
        11,
        2,
        'かんたん',
        '簡単',
        'Đơn giản',
        'この問題はかんたんです。(Vấn đề này đơn giản.)'
    ),
    (12, 2, 'ちかい', '近い', 'Gần', '駅がちかいです。(Ga gần.)'),
    (
        13,
        2,
        'とおい',
        '遠い',
        'Xa',
        '学校はとおいです。(Trường xa.)'
    ),
    (
        14,
        2,
        'はやい',
        '早い',
        'Nhanh, sớm',
        '電車ははやいです。(Tàu nhanh.)'
    ),
    (
        15,
        2,
        'おそい',
        '遅い',
        'Chậm, muộn',
        'バスはおそいです。(Xe buýt chậm.)'
    ),
    (
        16,
        2,
        'おおい',
        '多い',
        'Nhiều',
        '宿題がおおいです。(Bài tập nhiều.)'
    ),
    (
        17,
        2,
        'すくない',
        '少ない',
        'Ít',
        '人がすくないです。(Ít người.)'
    ),
    (
        18,
        2,
        'あたたかい',
        '暖かい',
        'Ấm áp',
        '今日はあたたかいです。(Hôm nay ấm áp.)'
    ),
    (
        19,
        2,
        'すずしい',
        '涼しい',
        'Mát mẻ',
        'すずしい風が吹きます。(Gió mát thổi.)'
    ),
    (
        20,
        2,
        'あまい',
        '甘い',
        'Ngọt',
        'このケーキはあまいです。(Bánh này ngọt.)'
    ),
    (
        21,
        3,
        'からい',
        '辛い',
        'Cay',
        'カレーがからいです。(Cà ri cay.)'
    ),
    (
        22,
        3,
        'おもい',
        '重い',
        'Nặng',
        'このかばんはおもいです。(Cặp này nặng.)'
    ),
    (
        23,
        3,
        'かるい',
        '軽い',
        'Nhẹ',
        'かるい荷物です。(Hành lý nhẹ.)'
    ),
    (
        24,
        3,
        'いい',
        '良い',
        'Tốt',
        'いい天気です。(Thời tiết tốt.)'
    ),
    (
        25,
        3,
        'きせつ',
        '季節',
        'Mùa',
        '日本のきせつ。(Mùa của Nhật Bản.)'
    ),
    (
        26,
        3,
        'はる',
        '春',
        'Mùa xuân',
        'はるが好きです。(Thích mùa xuân.)'
    ),
    (
        27,
        3,
        'なつ',
        '夏',
        'Mùa hè',
        'なつは暑いです。(Mùa hè nóng.)'
    ),
    (
        28,
        3,
        'あき',
        '秋',
        'Mùa thu',
        'あきは涼しいです。(Mùa thu mát.)'
    ),
    (
        29,
        3,
        'ふゆ',
        '冬',
        'Mùa đông',
        'ふゆは寒いです。(Mùa đông lạnh.)'
    ),
    (
        713,
        26,
        'みます',
        '見ます、診ます',
        'Kiểm tra, khám bệnh',
        '医者がみます。(Bác sĩ khám bệnh.)'
    ),
    (
        719,
        26,
        'ひろいます',
        '拾います',
        'Nhặt, lượm',
        '道でお金をひろいます。(Nhặt tiền trên đường.)'
    ),
    (
        720,
        26,
        'れんらくします',
        '連絡します',
        'Liên lạc',
        '友達にれんらくします。(Liên lạc với bạn bè.)'
    ),
    (
        721,
        26,
        'きぶんがいい',
        '気分がいい',
        'Cảm thấy thoải mái, cảm thấy khỏe',
        '今日はきぶんがいいです。(Hôm nay cảm thấy thoải mái.)'
    ),
    (
        722,
        26,
        'きぶんがわるい',
        '気分が悪い',
        'Cảm thấy không thoải mái, cảm thấy mệt',
        'きぶんがわるいです。(Cảm thấy không thoải mái.)'
    ),
    (
        723,
        26,
        'うんどうかい',
        '運動会',
        'Hội thi thể thao',
        '学校でうんどうかいがあります。(Có hội thi thể thao ở trường.)'
    ),
    (
        724,
        27,
        'かいます',
        '飼います',
        'Nuôi',
        '犬をかいます。(Nuôi chó.)'
    ),
    (
        725,
        27,
        'しんぱい［な］',
        '心配［な］',
        'Lo lắng',
        'テストがしんぱいです。(Lo lắng về bài kiểm tra.)'
    ),
    (
        726,
        27,
        'ペット',
        'ペット',
        'Thú cưng, động vật nuôi',
        'ペットをかっています。(Nuôi thú cưng.)'
    ),
    (
        727,
        27,
        'とり',
        '鳥',
        'Chim',
        'とりが鳴いています。(Chim đang hót.)'
    ),
    (
        728,
        27,
        'こえ',
        '声',
        'Tiếng',
        '美しいこえです。(Giọng nói đẹp.)'
    ),
    (729, 27, 'なみ', '波', 'Sóng', '海のなみ。(Sóng biển.)'),
    (
        730,
        27,
        'はなび',
        '花火',
        'Pháo hoa',
        '花火を見ます。(Xem pháo hoa.)'
    ),
    (
        731,
        27,
        'どうぐ',
        '道具',
        'Dụng cụ',
        '料理のどうぐ。(Dụng cụ nấu ăn.)'
    ),
    (
        732,
        27,
        'クリーニング',
        'クリーニング',
        'Giặt là',
        'クリーニング店に行きます。(Đi đến cửa hàng giặt là.)'
    ),
    (733, 27, 'いえ', '家', 'Nhà', '私のいえ。(Nhà của tôi.)'),
    (
        734,
        27,
        'マンション',
        'マンション',
        'Chung cư',
        '新しいマンション。(Chung cư mới.)'
    ),
    (
        735,
        28,
        'ねっしん［な］',
        '熱心［な］',
        'Nhiệt tình',
        'ねっしんに勉強します。(Học hành nhiệt tình.)'
    ),
    (
        736,
        28,
        'えらい',
        '偉い',
        'Siêu, giỏi',
        '彼はえらい人です。(Anh ấy là người giỏi.)'
    ),
    (
        737,
        28,
        'ちょうどいい',
        'ちょうどいい',
        'Vừa vặn',
        'ちょうどいいサイズです。(Kích thước vừa vặn.)'
    ),
    (
        738,
        28,
        'けしき',
        '景色',
        'Phong cảnh',
        '美しいけしき。(Phong cảnh đẹp.)'
    ),
    (
        739,
        28,
        'びよういん',
        '美容院',
        'Hiệu làm đẹp',
        'びよういんに行きます。(Đi đến hiệu làm đẹp.)'
    ),
    (
        740,
        28,
        'だいどころ',
        '台所',
        'Nhà bếp',
        'だいどころで料理します。(Nấu ăn trong nhà bếp.)'
    ),
    (
        741,
        28,
        'けいけん',
        '経験',
        'Kinh nghiệm',
        '豊富なけいけん。(Kinh nghiệm phong phú.)'
    ),
    (
        742,
        28,
        'ちから',
        '力',
        'Sức mạnh',
        '大きなちから。(Sức mạnh lớn.)'
    ),
    (
        743,
        28,
        'にんき',
        '人気',
        'Được yêu thích',
        '[がくせいに]～があります: Được [sinh viên] yêu thích'
    ),
    (
        744,
        28,
        'かたち',
        '形',
        'Hình dáng',
        'いろいろなかたち。(Các loại hình dáng.)'
    ),
    (
        745,
        28,
        'いろ',
        '色',
        'Màu sắc',
        '美しいいろ。(Màu sắc đẹp.)'
    ),
    (746, 28, 'あじ', '味', 'Vị', 'おいしいあじ。(Vị ngon.)'),
    (
        747,
        28,
        'ガム',
        'ガム',
        'Kẹo cao su',
        'ガムを噛みます。(Nhai kẹo cao su.)'
    ),
    (
        748,
        28,
        'しなもの',
        '品物',
        'Hàng hóa',
        '新しいしなもの。(Hàng hóa mới.)'
    ),
    (
        749,
        28,
        'ねだん',
        '値段',
        'Giá cả',
        'ねだんが高いです。(Giá cao.)'
    ),
    (
        750,
        29,
        '～がわ',
        '～側',
        'Phía ~',
        '右がわ。(Phía bên phải.)'
    ),
    (
        751,
        29,
        'ポケット',
        'ポケット',
        'Túi',
        'ポケットに入れます。(Bỏ vào túi.)'
    ),
    (752, 29, '～へん', '～辺', 'Chỗ ~', 'このへん。(Chỗ này.)'),
    (
        753,
        29,
        'おぼえていません',
        '覚えていません',
        'Tôi không nhớ.',
        '私はおぼえていません。(Tôi không nhớ.)'
    ),
    (
        754,
        29,
        'あみだな',
        '網棚',
        'Giá để hành lý',
        '電車のあみだな。(Giá để hành lý trên tàu.)'
    ),
    (
        755,
        29,
        'たしか',
        '確か',
        'Chắc là',
        'たしかにそうです。(Chắc là như vậy.)'
    ),
    (
        756,
        29,
        '[ああ、]よかった',
        '[ああ、]よかった',
        '[Ôi,] tốt quá.',
        '[ああ、]よかったです。(Ôi, tốt quá.)'
    ),
    (
        757,
        29,
        'しんじゅく',
        '新宿',
        'Tên một địa điểm/nhà ga ở Tokyo',
        'しんじゅくに行きます。(Đi đến Shinjuku.)'
    );