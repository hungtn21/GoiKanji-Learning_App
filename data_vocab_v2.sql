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
VALUES (1, 5, 'Lesson 1', 'Nihongo N5'),
    (2, 5, 'Lesson 2', 'Nihongo N5'),
    (3, 5, 'Lesson 3', 'Nihongo N5'),
    (4, 5, 'Lesson 4', 'Nihongo N5'),
    (5, 5, 'Lesson 5', 'Nihongo N5'),
    (6, 5, 'Lesson 6', 'Nihongo N5'),
    (7, 5, 'Lesson 7', 'Nihongo N5'),
    (8, 5, 'Lesson 8', 'Nihongo N5'),
    (21, 4, 'Lesson 21', 'Nihongo N4'),
    (22, 4, 'Lesson 22', 'Nihongo N4'),
    (23, 4, 'Lesson 23', 'Nihongo N4'),
    (24, 4, 'Lesson 24', 'Nihongo N4'),
    (25, 4, 'Lesson 25', 'Nihongo N4'),
    (26, 4, 'Lesson 26', 'Nihongo N4'),
    (27, 4, 'Lesson 27', 'Nihongo N4'),
    (28, 4, 'Lesson 28', 'Nihongo N4'),
    (41, 3, 'Lesson 41', 'Nihongo N3'),
    (42, 3, 'Lesson 42', 'Nihongo N3'),
    (43, 3, 'Lesson 43', 'Nihongo N3'),
    (44, 3, 'Lesson 44', 'Nihongo N3'),
    (45, 3, 'Lesson 45', 'Nihongo N3'),
    (46, 3, 'Lesson 46', 'Nihongo N3'),
    (47, 3, 'Lesson 47', 'Nihongo N3'),
    (48, 3, 'Lesson 48', 'Nihongo N3'),
    (51, 3, 'Lesson 51', 'Nihongo N3'),
    (52, 3, 'Lesson 52', 'Nihongo N3'),
    (53, 3, 'Lesson 53', 'Nihongo N3'),
    (54, 3, 'Lesson 54', 'Nihongo N3'),
    (55, 3, 'Lesson 55', 'Nihongo N3'),
    (56, 3, 'Lesson 56', 'Nihongo N3'),
    (57, 3, 'Lesson 57', 'Nihongo N3'),
    (58, 3, 'Lesson 58', 'Nihongo N3'),
    (59, 2, 'Lesson 59', 'Nihongo N2'),
    (60, 2, 'Lesson 60', 'Nihongo N2'),
    (61, 2, 'Lesson 61', 'Nihongo N2'),
    (62, 2, 'Lesson 62', 'Nihongo N2'),
    (63, 2, 'Lesson 63', 'Nihongo N2'),
    (64, 2, 'Lesson 64', 'Nihongo N2'),
    (65, 2, 'Lesson 65', 'Nihongo N2'),
    (66, 2, 'Lesson 66', 'Nihongo N2'),
    (67, 2, 'Lesson 67', 'Nihongo N2'),
    (68, 2, 'Lesson 68', 'Nihongo N2'),
    (69, 2, 'Lesson 69', 'Nihongo N2'),
    (70, 2, 'Lesson 70', 'Nihongo N2'),
    (71, 2, 'Lesson 71', 'Nihongo N2'),
    (72, 2, 'Lesson 72', 'Nihongo N2'),
    (81, 1, 'Lesson 81', 'Nihongo N1'),
    (82, 1, 'Lesson 82', 'Nihongo N1'),
    (83, 1, 'Lesson 83', 'Nihongo N1'),
    (84, 1, 'Lesson 84', 'Nihongo N1'),
    (85, 1, 'Lesson 85', 'Nihongo N1'),
    (86, 1, 'Lesson 86', 'Nihongo N1'),
    (87, 1, 'Lesson 87', 'Nihongo N1'),
    (88, 1, 'Lesson 88', 'Nihongo N1');
INSERT INTO "Lesson" (lesson_id, level_id, title, description)
VALUES -- Level 15
    (101, 15, 'Lesson 101', 'Kanji N5'),
    (102, 15, 'Lesson 102', 'Kanji N5'),
    (103, 15, 'Lesson 103', 'Kanji N5'),
    (104, 15, 'Lesson 104', 'Kanji N5'),
    (105, 15, 'Lesson 105', 'Kanji N5'),
    (106, 15, 'Lesson 106', 'Kanji N5'),
    (107, 15, 'Lesson 107', 'Kanji N5'),
    (108, 15, 'Lesson 108', 'Kanji N5'),
    -- Level 14
    (121, 14, 'Lesson 121', 'Kanji N4'),
    (122, 14, 'Lesson 122', 'Kanji N4'),
    (123, 14, 'Lesson 123', 'Kanji N4'),
    (124, 14, 'Lesson 124', 'Kanji N4'),
    (125, 14, 'Lesson 125', 'Kanji N4'),
    (126, 14, 'Lesson 126', 'Kanji N4'),
    (127, 14, 'Lesson 127', 'Kanji N4'),
    (128, 14, 'Lesson 128', 'Kanji N4'),
    -- Level 13
    (141, 13, 'Lesson 141', 'Kanji N3'),
    (142, 13, 'Lesson 142', 'Kanji N3'),
    (143, 13, 'Lesson 143', 'Kanji N3'),
    (144, 13, 'Lesson 144', 'Kanji N3'),
    (145, 13, 'Lesson 145', 'Kanji N3'),
    (146, 13, 'Lesson 146', 'Kanji N3'),
    (147, 13, 'Lesson 147', 'Kanji N3'),
    (148, 13, 'Lesson 148', 'Kanji N3'),
    -- Level 12
    (161, 12, 'Lesson 161', 'Kanji N2'),
    (162, 12, 'Lesson 162', 'Kanji N2'),
    (163, 12, 'Lesson 163', 'Kanji N2'),
    (164, 12, 'Lesson 164', 'Kanji N2'),
    (165, 12, 'Lesson 165', 'Kanji N2'),
    (166, 12, 'Lesson 166', 'Kanji N2'),
    (167, 12, 'Lesson 167', 'Kanji N2'),
    (168, 12, 'Lesson 168', 'Kanji N2'),
    -- Level 11
    (181, 11, 'Lesson 181', 'Kanji N1'),
    (182, 11, 'Lesson 182', 'Kanji N1'),
    (183, 11, 'Lesson 183', 'Kanji N1'),
    (184, 11, 'Lesson 184', 'Kanji N1'),
    (185, 11, 'Lesson 185', 'Kanji N1'),
    (186, 11, 'Lesson 186', 'Kanji N1'),
    (187, 11, 'Lesson 187', 'Kanji N1'),
    (188, 11, 'Lesson 188', 'Kanji N1');
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
        'ねこ',
        '猫',
        'Mèo',
        'ねこがすきです。(Tôi thích mèo.)'
    ),
    (
        4,
        1,
        'いぬ',
        '犬',
        'Chó',
        'いぬがいます。(Có một con chó.)'
    ),
    (
        5,
        1,
        'ほん',
        '本',
        'Sách',
        'ほんをよみます。(Tôi đọc sách.)'
    ),
    (
        6,
        1,
        'くるま',
        '車',
        'Xe ô tô',
        'くるまでいきます。(Đi bằng xe ô tô.)'
    ),
    (
        7,
        1,
        'がっこう',
        '学校',
        'Trường học',
        'がっこうへいきます。(Tôi đi đến trường học.)'
    ),
    (
        8,
        1,
        'ともだち',
        '友達',
        'Bạn bè',
        'ともだちとあそびます。(Tôi chơi với bạn bè.)'
    ),
    (
        9,
        1,
        'せんせい',
        '先生',
        'Giáo viên',
        'せんせいはやさしいです。(Giáo viên dễ tính.)'
    ),
    (
        10,
        1,
        'いえ',
        '家',
        'Nhà',
        'いえにかえります。(Tôi về nhà.)'
    ),
    (
        11,
        2,
        'おはよう',
        'お早う',
        'Chào buổi sáng',
        'おはようございます。(Chào buổi sáng.)'
    ),
    (
        12,
        2,
        'こんにちは',
        '今日は',
        'Chào buổi chiều',
        'こんにちは、げんきですか。(Chào buổi chiều, bạn khỏe không?)'
    ),
    (
        13,
        2,
        'こんばんは',
        '今晩は',
        'Chào buổi tối',
        'こんばんは、さようなら。(Chào buổi tối, tạm biệt.)'
    ),
    (
        14,
        2,
        'ありがとう',
        '有難う',
        'Cảm ơn',
        'ありがとう、たすかりました。(Cảm ơn, bạn đã giúp tôi rất nhiều.)'
    ),
    (
        15,
        2,
        'すみません',
        '済みません',
        'Xin lỗi',
        'すみません、おそくなりました。(Xin lỗi, tôi đã đến muộn.)'
    ),
    (
        16,
        2,
        'はい',
        'はい',
        'Vâng',
        'はい、そうです。(Vâng, đúng rồi.)'
    ),
    (
        17,
        2,
        'いいえ',
        'いいえ',
        'Không',
        'いいえ、ちがいます。(Không, không phải vậy.)'
    ),
    (
        18,
        2,
        'さようなら',
        '左様なら',
        'Tạm biệt',
        'さようなら、またあした。(Tạm biệt, hẹn gặp lại ngày mai.)'
    ),
    (
        19,
        2,
        'おやすみ',
        'お休み',
        'Chúc ngủ ngon',
        'おやすみなさい。(Chúc ngủ ngon.)'
    ),
    (
        20,
        2,
        'いただきます',
        'いただきます',
        'Mời ăn',
        'いただきます、ごちそうさまでした。(Mời ăn, cảm ơn vì bữa ăn.)'
    ),
    (
        21,
        3,
        'いち',
        '一',
        'Số một',
        'いちばんです。(Đây là số một.)'
    ),
    (
        22,
        3,
        'に',
        '二',
        'Số hai',
        'にばんです。(Đây là số hai.)'
    ),
    (
        23,
        3,
        'さん',
        '三',
        'Số ba',
        'さんばんです。(Đây là số ba.)'
    ),
    (
        24,
        3,
        'し',
        '四',
        'Số bốn',
        'しばんです。(Đây là số bốn.)'
    ),
    (
        25,
        3,
        'ご',
        '五',
        'Số năm',
        'ごばんです。(Đây là số năm.)'
    ),
    (
        26,
        3,
        'ろく',
        '六',
        'Số sáu',
        'ろくばんです。(Đây là số sáu.)'
    ),
    (
        27,
        3,
        'しち',
        '七',
        'Số bảy',
        'しちばんです。(Đây là số bảy.)'
    ),
    (
        28,
        3,
        'はち',
        '八',
        'Số tám',
        'はちばんです。(Đây là số tám.)'
    ),
    (
        29,
        3,
        'きゅう',
        '九',
        'Số chín',
        'きゅうばんです。(Đây là số chín.)'
    ),
    (
        30,
        3,
        'じゅう',
        '十',
        'Số mười',
        'じゅうばんです。(Đây là số mười.)'
    ),
    (
        31,
        4,
        'あか',
        '赤',
        'Màu đỏ',
        'あかいくるまです。(Đây là chiếc xe màu đỏ.)'
    ),
    (
        32,
        4,
        'あお',
        '青',
        'Màu xanh',
        'あおいそらです。(Đây là bầu trời xanh.)'
    ),
    (
        33,
        4,
        'しろ',
        '白',
        'Màu trắng',
        'しろいふくです。(Đây là quần áo màu trắng.)'
    ),
    (
        34,
        4,
        'くろ',
        '黒',
        'Màu đen',
        'くろいねこです。(Đây là con mèo đen.)'
    ),
    (
        35,
        4,
        'きいろ',
        '黄色',
        'Màu vàng',
        'きいろいはなです。(Đây là bông hoa màu vàng.)'
    ),
    (
        36,
        4,
        'みどり',
        '緑',
        'Màu xanh lá',
        'みどりのもりです。(Đây là khu rừng xanh.)'
    ),
    (
        37,
        4,
        'ちゃいろ',
        '茶色',
        'Màu nâu',
        'ちゃいろいくつです。(Đây là đôi giày màu nâu.)'
    ),
    (
        38,
        4,
        'むらさき',
        '紫',
        'Màu tím',
        'むらさきのふくです。(Đây là quần áo màu tím.)'
    ),
    (
        39,
        4,
        'ピンク',
        'ピンク',
        'Màu hồng',
        'ピンクのかばんです。(Đây là chiếc túi màu hồng.)'
    ),
    (
        40,
        4,
        'オレンジ',
        'オレンジ',
        'Màu cam',
        'オレンジのくだものです。(Đây là quả cam.)'
    ),
    (
        41,
        5,
        'やま',
        '山',
        'Núi',
        'やまにのぼります。(Tôi leo núi.)'
    ),
    (
        42,
        5,
        'かわ',
        '川',
        'Sông',
        'かわでおよぎます。(Tôi bơi ở sông.)'
    ),
    (
        43,
        5,
        'うみ',
        '海',
        'Biển',
        'うみへいきます。(Tôi đi biển.)'
    ),
    (
        44,
        5,
        'そら',
        '空',
        'Bầu trời',
        'そらをみます。(Tôi nhìn bầu trời.)'
    ),
    (45, 5, 'はな', '花', 'Hoa', 'はながさきます。(Hoa nở.)'),
    (
        46,
        5,
        'き',
        '木',
        'Cây',
        'きのしたでやすみます。(Tôi nghỉ dưới gốc cây.)'
    ),
    (47, 5, 'くさ', '草', 'Cỏ', 'くさがはえます。(Cỏ mọc.)'),
    (
        48,
        5,
        'もり',
        '森',
        'Rừng',
        'もりをあるきます。(Tôi đi dạo trong rừng.)'
    ),
    (
        49,
        5,
        'はし',
        '橋',
        'Cầu',
        'はしをわたります。(Tôi qua cầu.)'
    ),
    (
        50,
        5,
        'いけ',
        '池',
        'Ao',
        'いけのまわりをあるきます。(Tôi đi dạo quanh ao.)'
    ),
    (
        51,
        6,
        'きんようび',
        '金曜日',
        'Thứ sáu',
        'きんようびはがっこうがあります。(Thứ sáu tôi có trường học.)'
    ),
    (
        52,
        6,
        'どようび',
        '土曜日',
        'Thứ bảy',
        'どようびはやすみます。(Thứ bảy tôi nghỉ.)'
    ),
    (
        53,
        6,
        'にちようび',
        '日曜日',
        'Chủ nhật',
        'にちようびにあそびます。(Chủ nhật tôi đi chơi.)'
    ),
    (
        54,
        6,
        'げつようび',
        '月曜日',
        'Thứ hai',
        'げつようびからはたらきます。(Từ thứ hai tôi bắt đầu làm việc.)'
    ),
    (
        55,
        6,
        'かようび',
        '火曜日',
        'Thứ ba',
        'かようびにかいぎがあります。(Thứ ba có cuộc họp.)'
    ),
    (
        56,
        6,
        'すいようび',
        '水曜日',
        'Thứ tư',
        'すいようびにかいものにいきます。(Thứ tư tôi đi mua sắm.)'
    ),
    (
        57,
        6,
        'もくようび',
        '木曜日',
        'Thứ năm',
        'もくようびにともだちとあいます。(Thứ năm tôi gặp bạn bè.)'
    ),
    (
        58,
        6,
        'しゅうまつ',
        '週末',
        'Cuối tuần',
        'しゅうまつにかぞくとすごします。(Tôi dành thời gian với gia đình vào cuối tuần.)'
    ),
    (
        59,
        6,
        'へいじつ',
        '平日',
        'Ngày thường',
        'へいじつにべんきょうします。(Tôi học vào ngày thường.)'
    ),
    (
        60,
        6,
        'けつまつ',
        '結末',
        'Kết thúc',
        'けつまつをまちます。(Tôi chờ kết thúc.)'
    ),
    (
        61,
        7,
        'がつ',
        '月',
        'Tháng',
        'いちがつです。(Đây là tháng một.)'
    ),
    (
        62,
        7,
        'にがつ',
        '二月',
        'Tháng hai',
        'にがつです。(Đây là tháng hai.)'
    ),
    (
        63,
        7,
        'さんがつ',
        '三月',
        'Tháng ba',
        'さんがつです。(Đây là tháng ba.)'
    ),
    (
        64,
        7,
        'しがつ',
        '四月',
        'Tháng tư',
        'しがつです。(Đây là tháng tư.)'
    ),
    (
        65,
        7,
        'ごがつ',
        '五月',
        'Tháng năm',
        'ごがつです。(Đây là tháng năm.)'
    ),
    (
        66,
        7,
        'ろくがつ',
        '六月',
        'Tháng sáu',
        'ろくがつです。(Đây là tháng sáu.)'
    ),
    (
        67,
        7,
        'しちがつ',
        '七月',
        'Tháng bảy',
        'しちがつです。(Đây là tháng bảy.)'
    ),
    (
        68,
        7,
        'はちがつ',
        '八月',
        'Tháng tám',
        'はちがつです。(Đây là tháng tám.)'
    ),
    (
        69,
        7,
        'くがつ',
        '九月',
        'Tháng chín',
        'くがつです。(Đây là tháng chín.)'
    ),
    (
        70,
        7,
        'じゅうがつ',
        '十月',
        'Tháng mười',
        'じゅうがつです。(Đây là tháng mười.)'
    ),
    (
        71,
        8,
        'せんせい',
        '先生',
        'Giáo viên',
        'せんせいはおしえます。(Giáo viên dạy học.)'
    ),
    (
        72,
        8,
        'がくせい',
        '学生',
        'Học sinh',
        'がくせいはべんきょうします。(Học sinh học.)'
    ),
    (
        73,
        8,
        'こうこう',
        '高校',
        'Trường cấp ba',
        'こうこうへいきます。(Tôi đi học trường cấp ba.)'
    ),
    (
        74,
        8,
        'だいがく',
        '大学',
        'Đại học',
        'だいがくでべんきょうします。(Tôi học ở đại học.)'
    ),
    (
        75,
        8,
        'がっこう',
        '学校',
        'Trường học',
        'がっこうはおもしろいです。(Trường học rất thú vị.)'
    ),
    (
        76,
        8,
        'クラス',
        'クラス',
        'Lớp học',
        'クラスでともだちにあいます。(Tôi gặp bạn trong lớp học.)'
    ),
    (
        77,
        8,
        'きょうしつ',
        '教室',
        'Phòng học',
        'きょうしつにせんせいがいます。(Giáo viên có trong phòng học.)'
    ),
    (
        78,
        8,
        'じゅぎょう',
        '授業',
        'Tiết học',
        'じゅぎょうがはじまります。(Tiết học bắt đầu.)'
    ),
    (
        79,
        8,
        'しゅくだい',
        '宿題',
        'Bài tập về nhà',
        'しゅくだいをします。(Tôi làm bài tập về nhà.)'
    ),
    (
        80,
        8,
        'テスト',
        'テスト',
        'Kiểm tra',
        'テストがむずかしいです。(Bài kiểm tra rất khó.)'
    );
INSERT INTO "Question" (
        question_id,
        lesson_id,
        type,
        question_content,
        option_1,
        option_2,
        option_3,
        option_4,
        correct_answer
    )
VALUES -- Lesson 1: Nghĩa tiếng Việt của từ tiếng Nhật
    (
        1,
        1,
        '1',
        'Nghĩa từ Việt của từ わたし(私) là:',
        'Bạn',
        'Tôi',
        'Mèo',
        'Chó',
        'Tôi'
    ),
    (
        2,
        1,
        '1',
        'Nghĩa từ Việt của từ あなた(貴方) là:',
        'Xe ô tô',
        'Tôi',
        'Bạn',
        'Trường học',
        'Bạn'
    ),
    (
        3,
        1,
        '1',
        'Nghĩa từ Việt của từ ねこ(猫) là:',
        'Chó',
        'Mèo',
        'Bạn',
        'Nhà',
        'Mèo'
    ),
    (
        4,
        1,
        '1',
        'Nghĩa từ Việt của từ いぬ(犬) là:',
        'Chó',
        'Mèo',
        'Sách',
        'Xe ô tô',
        'Chó'
    ),
    (
        5,
        1,
        '1',
        'Nghĩa từ Việt của từ ほん(本) là:',
        'Trường học',
        'Bạn',
        'Sách',
        'Chó',
        'Sách'
    ),
    -- Lesson 1: Từ tiếng Nhật ứng với nghĩa tiếng Việt
    (
        6,
        1,
        '1',
        'Từ nào sau đây ứng với nghĩa "Tôi"?',
        'あなた',
        'ねこ',
        'わたし',
        'いぬ',
        'わたし'
    ),
    (
        7,
        1,
        '1',
        'Từ nào sau đây ứng với nghĩa "Bạn"?',
        'ほん',
        'あなた',
        'くるま',
        'がっこう',
        'あなた'
    ),
    (
        8,
        1,
        '1',
        'Từ nào sau đây ứng với nghĩa "Mèo"?',
        'いぬ',
        'ともだち',
        'ねこ',
        'せんせい',
        'ねこ'
    ),
    (
        9,
        1,
        '1',
        'Từ nào sau đây ứng với nghĩa "Chó"?',
        'いえ',
        'いぬ',
        'がっこう',
        'ともだち',
        'いぬ'
    ),
    (
        10,
        1,
        '1',
        'Từ nào sau đây ứng với nghĩa "Sách"?',
        'ほん',
        'せんせい',
        'いえ',
        'くるま',
        'ほん'
    ),
    -- Lesson 2: Nghĩa tiếng Việt của từ tiếng Nhật
    (
        11,
        2,
        '1',
        'Nghĩa từ Việt của từ おはよう(お早う) là:',
        'Xin lỗi',
        'Chào buổi sáng',
        'Cảm ơn',
        'Chào buổi chiều',
        'Chào buổi sáng'
    ),
    (
        12,
        2,
        '1',
        'Nghĩa từ Việt của từ こんにちは(今日は) là:',
        'Chào buổi tối',
        'Chào buổi sáng',
        'Chào buổi chiều',
        'Tạm biệt',
        'Chào buổi chiều'
    ),
    (
        13,
        2,
        '1',
        'Nghĩa từ Việt của từ こんばんは(今晩は) là:',
        'Chào buổi sáng',
        'Cảm ơn',
        'Chào buổi tối',
        'Tạm biệt',
        'Chào buổi tối'
    ),
    (
        14,
        2,
        '1',
        'Nghĩa từ Việt của từ ありがとう(有難う) là:',
        'Cảm ơn',
        'Xin lỗi',
        'Không',
        'Có',
        'Cảm ơn'
    ),
    (
        15,
        2,
        '1',
        'Nghĩa từ Việt của từ すみません(済みません) là:',
        'Không',
        'Có',
        'Xin lỗi',
        'Cảm ơn',
        'Xin lỗi'
    ),
    -- Lesson 2: Từ tiếng Nhật ứng với nghĩa tiếng Việt
    (
        16,
        2,
        '1',
        'Từ nào sau đây ứng với nghĩa "Chào buổi sáng"?',
        'おはよう',
        'こんにちは',
        'こんばんは',
        'ありがとう',
        'おはよう'
    ),
    (
        17,
        2,
        '1',
        'Từ nào sau đây ứng với nghĩa "Chào buổi chiều"?',
        'すみません',
        'こんにちは',
        'こんばんは',
        'ありがとう',
        'こんにちは'
    ),
    (
        18,
        2,
        '1',
        'Từ nào sau đây ứng với nghĩa "Chào buổi tối"?',
        'すみません',
        'ありがとう',
        'おはよう',
        'こんばんは',
        'こんばんは'
    ),
    (
        19,
        2,
        '1',
        'Từ nào sau đây ứng với nghĩa "Cảm ơn"?',
        'ありがとう',
        'すみません',
        'おはよう',
        'こんばんは',
        'ありがとう'
    ),
    (
        20,
        2,
        '1',
        'Từ nào sau đây ứng với nghĩa "Xin lỗi"?',
        'こんにちは',
        'すみません',
        'おはよう',
        'ありがとう',
        'すみません'
    ),
    -- Lesson 3: Nghĩa tiếng Việt của từ tiếng Nhật
    (
        21,
        3,
        '1',
        'Nghĩa từ Việt của từ いち là:',
        'Số một',
        'Số hai',
        'Số ba',
        'Số bốn',
        'Số một'
    ),
    (
        22,
        3,
        '1',
        'Nghĩa từ Việt của từ に là:',
        'Số ba',
        'Số bốn',
        'Số hai',
        'Số một',
        'Số hai'
    ),
    (
        23,
        3,
        '1',
        'Nghĩa từ Việt của từ さん là:',
        'Số hai',
        'Số một',
        'Số ba',
        'Số bốn',
        'Số ba'
    ),
    (
        24,
        3,
        '1',
        'Nghĩa từ Việt của từ し là:',
        'Số ba',
        'Số bốn',
        'Số hai',
        'Số một',
        'Số bốn'
    ),
    (
        25,
        3,
        '1',
        'Nghĩa từ Việt của từ ご là:',
        'Số năm',
        'Số sáu',
        'Số bảy',
        'Số tám',
        'Số năm'
    ),
    -- Lesson 3: Từ tiếng Nhật ứng với nghĩa tiếng Việt
    (
        26,
        3,
        '1',
        'Từ nào sau đây ứng với nghĩa "Số một"?',
        'に',
        'さん',
        'し',
        'いち',
        'いち'
    ),
    (
        27,
        3,
        '1',
        'Từ nào sau đây ứng với nghĩa "Số hai"?',
        'さん',
        'し',
        'に',
        'ご',
        'に'
    ),
    (
        28,
        3,
        '1',
        'Từ nào sau đây ứng với nghĩa "Số ba"?',
        'し',
        'さん',
        'ご',
        'ろく',
        'さん'
    ),
    (
        29,
        3,
        '1',
        'Từ nào sau đây ứng với nghĩa "Số bốn"?',
        'ご',
        'し',
        'いち',
        'に',
        'し'
    ),
    (
        30,
        3,
        '1',
        'Từ nào sau đây ứng với nghĩa "Số năm"?',
        'し',
        'に',
        'ご',
        'ろく',
        'ご'
    ),
    -- Lesson 4: Nghĩa tiếng Việt của từ tiếng Nhật
    (
        31,
        4,
        '1',
        'Nghĩa từ Việt của từ あか là:',
        'Màu xanh',
        'Màu đỏ',
        'Màu trắng',
        'Màu đen',
        'Màu đỏ'
    ),
    (
        32,
        4,
        '1',
        'Nghĩa từ Việt của từ あお là:',
        'Màu xanh',
        'Màu đỏ',
        'Màu trắng',
        'Màu đen',
        'Màu xanh'
    ),
    (
        33,
        4,
        '1',
        'Nghĩa từ Việt của từ しろ là:',
        'Màu xanh',
        'Màu đỏ',
        'Màu trắng',
        'Màu đen',
        'Màu trắng'
    ),
    (
        34,
        4,
        '1',
        'Nghĩa từ Việt của từ くろ là:',
        'Màu xanh',
        'Màu đỏ',
        'Màu trắng',
        'Màu đen',
        'Màu đen'
    ),
    (
        35,
        4,
        '1',
        'Nghĩa từ Việt của từ きいろ là:',
        'Màu vàng',
        'Màu đỏ',
        'Màu xanh',
        'Màu trắng',
        'Màu vàng'
    ),
    -- Lesson 4: Từ tiếng Nhật ứng với nghĩa tiếng Việt
    (
        36,
        4,
        '1',
        'Từ nào sau đây ứng với nghĩa "Màu đỏ"?',
        'あお',
        'しろ',
        'あか',
        'くろ',
        'あか'
    ),
    (
        37,
        4,
        '1',
        'Từ nào sau đây ứng với nghĩa "Màu xanh"?',
        'しろ',
        'あお',
        'くろ',
        'あか',
        'あお'
    ),
    (
        38,
        4,
        '1',
        'Từ nào sau đây ứng với nghĩa "Màu trắng"?',
        'あか',
        'しろ',
        'あお',
        'くろ',
        'しろ'
    ),
    (
        39,
        4,
        '1',
        'Từ nào sau đây ứng với nghĩa "Màu đen"?',
        'あか',
        'しろ',
        'あお',
        'くろ',
        'くろ'
    ),
    (
        40,
        4,
        '1',
        'Từ nào sau đây ứng với nghĩa "Màu vàng"?',
        'あお',
        'しろ',
        'きいろ',
        'くろ',
        'きいろ'
    ),
    -- Lesson 5: Nghĩa tiếng Việt của từ tiếng Nhật
    (
        41,
        5,
        '1',
        'Nghĩa từ Việt của từ ひと là:',
        'Người',
        'Mèo',
        'Sách',
        'Xe',
        'Người'
    ),
    (
        42,
        5,
        '1',
        'Nghĩa từ Việt của từ ねんれい là:',
        'Tuổi tác',
        'Ngày',
        'Tháng',
        'Năm',
        'Tuổi tác'
    ),
    (
        43,
        5,
        '1',
        'Nghĩa từ Việt của từ しごと là:',
        'Công việc',
        'Trường học',
        'Sở thích',
        'Gia đình',
        'Công việc'
    ),
    (
        44,
        5,
        '1',
        'Nghĩa từ Việt của từ かぞく là:',
        'Bạn bè',
        'Gia đình',
        'Công việc',
        'Trường học',
        'Gia đình'
    ),
    (
        45,
        5,
        '1',
        'Nghĩa từ Việt của từ ともだち là:',
        'Công việc',
        'Gia đình',
        'Bạn bè',
        'Trường học',
        'Bạn bè'
    ),
    -- Lesson 5: Từ tiếng Nhật ứng với nghĩa tiếng Việt
    (
        46,
        5,
        '1',
        'Từ nào sau đây ứng với nghĩa "Người"?',
        'ねんれい',
        'しごと',
        'ひと',
        'かぞく',
        'ひと'
    ),
    (
        47,
        5,
        '1',
        'Từ nào sau đây ứng với nghĩa "Tuổi tác"?',
        'しごと',
        'ねんれい',
        'ひと',
        'ともだち',
        'ねんれい'
    ),
    (
        48,
        5,
        '1',
        'Từ nào sau đây ứng với nghĩa "Công việc"?',
        'かぞく',
        'しごと',
        'ひと',
        'ねんれい',
        'しごと'
    ),
    (
        49,
        5,
        '1',
        'Từ nào sau đây ứng với nghĩa "Gia đình"?',
        'ともだち',
        'しごと',
        'かぞく',
        'ねんれい',
        'かぞく'
    ),
    (
        50,
        5,
        '1',
        'Từ nào sau đây ứng với nghĩa "Bạn bè"?',
        'しごと',
        'かぞく',
        'ひと',
        'ともだち',
        'ともだち'
    ),
    -- Lesson 6: Nghĩa tiếng Việt của từ tiếng Nhật
    (
        51,
        6,
        '1',
        'Nghĩa từ Việt của từ げつようび là:',
        'Thứ hai',
        'Thứ ba',
        'Thứ tư',
        'Thứ năm',
        'Thứ hai'
    ),
    (
        52,
        6,
        '1',
        'Nghĩa từ Việt của từ かようび là:',
        'Thứ hai',
        'Thứ ba',
        'Thứ tư',
        'Thứ năm',
        'Thứ ba'
    ),
    (
        53,
        6,
        '1',
        'Nghĩa từ Việt của từ すいようび là:',
        'Thứ ba',
        'Thứ tư',
        'Thứ năm',
        'Thứ sáu',
        'Thứ tư'
    ),
    (
        54,
        6,
        '1',
        'Nghĩa từ Việt của từ もくようび là:',
        'Thứ tư',
        'Thứ năm',
        'Thứ sáu',
        'Thứ bảy',
        'Thứ năm'
    ),
    (
        55,
        6,
        '1',
        'Nghĩa từ Việt của từ しゅうまつ là:',
        'Ngày thường',
        'Kết thúc',
        'Cuối tuần',
        'Ngày lễ',
        'Cuối tuần'
    ),
    -- Lesson 6: Từ tiếng Nhật ứng với nghĩa tiếng Việt
    (
        56,
        6,
        '1',
        'Từ nào sau đây ứng với nghĩa "Thứ hai"?',
        'かようび',
        'すいようび',
        'もくようび',
        'げつようび',
        'げつようび'
    ),
    (
        57,
        6,
        '1',
        'Từ nào sau đây ứng với nghĩa "Thứ ba"?',
        'もくようび',
        'かようび',
        'げつようび',
        'しゅうまつ',
        'かようび'
    ),
    (
        58,
        6,
        '1',
        'Từ nào sau đây ứng với nghĩa "Thứ tư"?',
        'すいようび',
        'かようび',
        'もくようび',
        'げつようび',
        'すいようび'
    ),
    (
        59,
        6,
        '1',
        'Từ nào sau đây ứng với nghĩa "Thứ năm"?',
        'しゅうまつ',
        'もくようび',
        'かようび',
        'すいようび',
        'もくようび'
    ),
    (
        60,
        6,
        '1',
        'Từ nào sau đây ứng với nghĩa "Cuối tuần"?',
        'げつようび',
        'しゅうまつ',
        'もくようび',
        'すいようび',
        'しゅうまつ'
    ),
    -- Lesson 7: Nghĩa tiếng Việt của từ tiếng Nhật
    (
        61,
        7,
        '1',
        'Nghĩa từ Việt của từ がつ là:',
        'Tháng',
        'Ngày',
        'Năm',
        'Tuần',
        'Tháng'
    ),
    (
        62,
        7,
        '1',
        'Nghĩa từ Việt của từ にがつ là:',
        'Tháng một',
        'Tháng hai',
        'Tháng ba',
        'Tháng tư',
        'Tháng hai'
    ),
    (
        63,
        7,
        '1',
        'Nghĩa từ Việt của từ さんがつ là:',
        'Tháng hai',
        'Tháng ba',
        'Tháng tư',
        'Tháng năm',
        'Tháng ba'
    ),
    (
        64,
        7,
        '1',
        'Nghĩa từ Việt của từ しがつ là:',
        'Tháng ba',
        'Tháng tư',
        'Tháng năm',
        'Tháng sáu',
        'Tháng tư'
    ),
    (
        65,
        7,
        '1',
        'Nghĩa từ Việt của từ ごがつ là:',
        'Tháng bốn',
        'Tháng năm',
        'Tháng sáu',
        'Tháng bảy',
        'Tháng năm'
    ),
    -- Lesson 7: Từ tiếng Nhật ứng với nghĩa tiếng Việt
    (
        66,
        7,
        '1',
        'Từ nào sau đây ứng với nghĩa "Tháng"?',
        'にがつ',
        'がつ',
        'しがつ',
        'ごがつ',
        'がつ'
    ),
    (
        67,
        7,
        '1',
        'Từ nào sau đây ứng với nghĩa "Tháng hai"?',
        'ごがつ',
        'にがつ',
        'しがつ',
        'さんがつ',
        'にがつ'
    ),
    (
        68,
        7,
        '1',
        'Từ nào sau đây ứng với nghĩa "Tháng ba"?',
        'しがつ',
        'さんがつ',
        'にがつ',
        'がつ',
        'さんがつ'
    ),
    (
        69,
        7,
        '1',
        'Từ nào sau đây ứng với nghĩa "Tháng tư"?',
        'しがつ',
        'ごがつ',
        'さんがつ',
        'にがつ',
        'しがつ'
    ),
    (
        70,
        7,
        '1',
        'Từ nào sau đây ứng với nghĩa "Tháng năm"?',
        'にがつ',
        'さんがつ',
        'ごがつ',
        'がつ',
        'ごがつ'
    ),
    -- Lesson 8: Nghĩa tiếng Việt của từ tiếng Nhật
    (
        71,
        8,
        '1',
        'Nghĩa từ Việt của từ せんせい là:',
        'Học sinh',
        'Giáo viên',
        'Bác sĩ',
        'Kỹ sư',
        'Giáo viên'
    ),
    (
        72,
        8,
        '1',
        'Nghĩa từ Việt của từ がくせい là:',
        'Giáo viên',
        'Học sinh',
        'Nhà văn',
        'Kỹ sư',
        'Học sinh'
    ),
    (
        73,
        8,
        '1',
        'Nghĩa từ Việt của từ こうこう là:',
        'Trường cấp ba',
        'Đại học',
        'Công viên',
        'Bệnh viện',
        'Trường cấp ba'
    ),
    (
        74,
        8,
        '1',
        'Nghĩa từ Việt của từ だいがく là:',
        'Trường cấp ba',
        'Đại học',
        'Công viên',
        'Bệnh viện',
        'Đại học'
    ),
    (
        75,
        8,
        '1',
        'Nghĩa từ Việt của từ がっこう là:',
        'Trường học',
        'Nhà hàng',
        'Công viên',
        'Bệnh viện',
        'Trường học'
    ),
    -- Lesson 8: Từ tiếng Nhật ứng với nghĩa tiếng Việt
    (
        76,
        8,
        '1',
        'Từ nào sau đây ứng với nghĩa "Giáo viên"?',
        'がくせい',
        'こうこう',
        'せんせい',
        'だいがく',
        'せんせい'
    ),
    (
        77,
        8,
        '1',
        'Từ nào sau đây ứng với nghĩa "Học sinh"?',
        'こうこう',
        'せんせい',
        'がくせい',
        'がっこう',
        'がくせい'
    ),
    (
        78,
        8,
        '1',
        'Từ nào sau đây ứng với nghĩa "Trường cấp ba"?',
        'だいがく',
        'がくせい',
        'がっこう',
        'こうこう',
        'こうこう'
    ),
    (
        79,
        8,
        '1',
        'Từ nào sau đây ứng với nghĩa "Đại học"?',
        'がっこう',
        'だいがく',
        'こうこう',
        'せんせい',
        'だいがく'
    ),
    (
        80,
        8,
        '1',
        'Từ nào sau đây ứng với nghĩa "Trường học"?',
        'がっこう',
        'せんせい',
        'こうこう',
        'だいがく',
        'がっこう'
    );

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3000, 51, 'だんせい', '男性', 'đàn ông', 'その男性はとても親切でした。(Người đàn ông đó rất tốt bụng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3001, 51, 'じょせい', '女性', 'phụ nữ', '彼女は美しい女性です。(Cô ấy là một phụ nữ đẹp.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3002, 51, 'こうれい', '高齢', 'cao tuổi', '高齢者には特別な配慮が必要です。(Người cao tuổi cần được quan tâm đặc biệt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3003, 51, 'としうえ', '年上', 'hơn tuổi', '彼は年上の友達が多いです。(Anh ấy có nhiều bạn lớn tuổi hơn.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3004, 51, 'めうえ', '目上', 'bề trên', '目上の人には敬意を払うべきです。(Nên tôn trọng những người bề trên.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3005, 51, 'せんぱい', '先輩', 'tiền bối', '先輩がたくさんアドバイスをくれました。(Tiền bối đã cho tôi rất nhiều lời khuyên.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3006, 51, 'こうはい', '後輩', 'hậu bối', '後輩たちと一緒にプロジェクトを進めています。(Tôi đang tiến hành dự án cùng với các hậu bối.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3007, 51, 'じょうし', '上司', 'cấp trên', '上司は会議で重要な発表をしました。(Sếp đã đưa ra thông báo quan trọng trong cuộc họp.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3008, 51, 'あいて', '相手', 'người đối diện', '相手の意見を尊重しましょう。(Hãy tôn trọng ý kiến của đối phương.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3009, 51, 'しりあい', '知り合い', 'người quen', '知り合いに久しぶりに会いました。(Tôi đã gặp lại người quen sau một thời gian dài.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3010, 51, 'ゆうじん', '友人', 'bạn bè', '彼は友人としてとても信頼できます。(Anh ấy rất đáng tin cậy như một người bạn.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3011, 51, 'なか', '仲', 'mối quan hệ', '二人の仲はとても良いです。(Mối quan hệ giữa hai người rất tốt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3012, 51, 'せいねんがっぴ', '生年月日', 'ngày tháng năm sinh', '彼の生年月日は1985年5月1日です。(Ngày sinh của anh ấy là ngày 1 tháng 5 năm 1985.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3013, 51, 'たんじょう', '誕生', 'ra đời', '赤ちゃんの誕生を祝います。(Chúc mừng sự ra đời của em bé.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3014, 51, 'とし', '年', 'năm', '今年は特別な年になるでしょう。(Năm nay sẽ là một năm đặc biệt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3015, 51, 'しゅっしん', '出身', 'quê quán', '彼は東京出身です。(Anh ấy quê ở Tokyo.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3016, 51, 'こきょう', '故郷', 'cố hương', '故郷に帰りたいです。(Tôi muốn trở về cố hương.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3017, 51, 'せいちょう', '成長', 'trưởng thành', '彼の成長は驚くべきものです。(Sự trưởng thành của anh ấy thật đáng ngạc nhiên.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3018, 51, 'せいじん', '成人', 'người trưởng thành', '彼は成人してから家を出ました。(Anh ấy đã ra khỏi nhà sau khi trở thành người trưởng thành.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3019, 51, 'ごうかく', '合格', 'đỗ đại học', '試験に合格しました。(Tôi đã đỗ kỳ thi.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3020, 51, 'しんがく', '進学', 'vào đại học', '彼は大学に進学しました。(Anh ấy đã vào đại học.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3021, 51, 'たいがく', '退学', 'bỏ học', '学校を退学しました。(Tôi đã bỏ học.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3022, 51, 'しゅうしょく', '就職', 'có việc làm', '就職活動がうまくいきました。(Việc tìm việc của tôi đã thành công.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3023, 51, 'たいしょく', '退職', 'nghỉ việc', '会社を退職しました。(Tôi đã nghỉ việc.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3024, 51, 'しつぎょう', '失業', 'thất nghiệp', '失業期間が長くなりました。(Thời gian thất nghiệp đã kéo dài.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3025, 51, 'ざんぎょう', '残業', 'làm thêm', '毎日残業しています。(Tôi làm thêm giờ mỗi ngày.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3026, 51, 'せいかつ', '生活', 'cuộc sống', '新しい生活が始まりました。(Một cuộc sống mới đã bắt đầu.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3027, 51, 'つうきん', '通勤', 'đi làm', '毎朝通勤が大変です。(Đi làm mỗi sáng thật vất vả.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3028, 51, 'がくれき', '学歴', 'bằng cấp', '彼は高学歴です。(Anh ấy có học vấn cao.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3029, 51, 'きゅうりょう', '給料', 'tiền lương', '給料が上がりました。(Lương của tôi đã tăng lên.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3030, 51, 'めんせつ', '面接', 'phỏng vấn', '面接の結果が良かったです。(Kết quả của buổi phỏng vấn rất tốt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3031, 51, 'きゅうけい', '休憩', 'nghỉ ngơi', '短い休憩を取りました。(Tôi đã nghỉ ngơi một chút.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3032, 51, 'かんこう', '観光', 'tham quan', '京都を観光しました。(Tôi đã tham quan Kyoto.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3033, 51, 'きこく', '帰国', 'về nước', '来月帰国します。(Tôi sẽ về nước vào tháng tới.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3034, 51, 'きせい', '帰省', 'về quê', '夏休みに帰省します。(Tôi sẽ về quê vào kỳ nghỉ hè.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3035, 51, 'きたく', '帰宅', 'về nhà', '仕事の後、帰宅します。(Sau công việc, tôi về nhà.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3036, 51, 'さんか', '参加', 'tham gia', '彼はそのイベントに参加しました。(Anh ấy đã tham gia sự kiện đó.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3037, 51, 'しゅっせき', '出席', 'có mặt', '彼女は会議に出席しました。(Cô ấy đã có mặt tại cuộc họp.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3038, 51, 'けっせき', '欠席', 'vắng mặt', '欠席者が多かったです。(Có nhiều người vắng mặt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3039, 51, 'ちこく', '遅刻', 'đến muộn', '授業に遅刻しました。(Tôi đã đến muộn lớp học.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3040, 51, 'けしょう', '化粧', 'trang điểm', '毎朝化粧をします。(Tôi trang điểm mỗi sáng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3041, 51, 'けいさん', '計算', 'tính toán', '計算が得意です。(Tôi giỏi tính toán.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3042, 51, 'けいかく', '計画', 'kế hoạch', '旅行の計画を立てています。(Tôi đang lập kế hoạch cho chuyến du lịch.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3043, 51, 'せいこう', '成功', 'thành công', 'プロジェクトが成功しました。(Dự án đã thành công.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3044, 51, 'しっぱい', '失敗', 'thất bại', '試験に失敗しました。(Tôi đã thất bại trong kỳ thi.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3045, 51, 'じゅんび', '準備', 'chuẩn bị', 'イベントの準備をしています。(Tôi đang chuẩn bị cho sự kiện.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3046, 51, 'せいり', '整理', 'chỉnh sửa', '部屋を整理しました。(Tôi đã chỉnh sửa lại căn phòng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3047, 51, 'ちゅうもん', '注文', 'đặt hàng', '新しい本を注文しました。(Tôi đã đặt mua một cuốn sách mới.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3048, 51, 'ちょきん', '貯金', 'tiết kiệm', '毎月少しずつ貯金しています。(Tôi tiết kiệm một chút mỗi tháng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3049, 51, 'てつや', '徹夜', 'thức xuyên đêm', '徹夜で勉強しました。(Tôi đã học suốt đêm.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3050, 51, 'ひっこし', '引っ越し', 'chuyển nhà', '新しい家に引っ越しました。(Tôi đã chuyển đến ngôi nhà mới.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3051, 51, 'しんちょう', '身長', 'chiều cao', '彼の身長は180センチです。(Chiều cao của anh ấy là 180 cm.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3052, 51, 'たいじゅう', '体重', 'cân nặng', '体重が増えました。(Tôi đã tăng cân.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3053, 51, 'けが', 'けが', 'vết thương', 'その事故でけがをしました。(Tôi bị thương trong tai nạn đó.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3054, 51, 'かい', '会', 'hội, tiệc', '友達と会を開きました。(Tôi đã tổ chức một buổi gặp mặt với bạn bè.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3055, 51, 'しゅみ', '趣味', 'sở thích', '趣味は読書です。(Sở thích của tôi là đọc sách.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3056, 51, 'きょうみ', '興味', 'hứng thú', '彼は歴史に興味があります。(Anh ấy quan tâm đến lịch sử.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3057, 51, 'おもいで', '思い出', 'nhớ lại', '学生時代の思い出がたくさんあります。(Tôi có nhiều kỷ niệm thời học sinh.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3058, 51, 'じょうだん', '冗談', 'đùa cợt', '彼の冗談は面白いです。(Câu đùa của anh ấy rất vui.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3059, 51, 'もくてき', '目的', 'mục đích', '目的を達成しました。(Tôi đã đạt được mục đích.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3060, 51, 'やくそく', '約束', 'lời hứa', '彼と約束をしました。(Tôi đã hứa với anh ấy.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3061, 51, 'おしゃべり', 'おしゃべり', 'nói chuyện riêng', '授業中におしゃべりをしてはいけません。(Không được nói chuyện riêng trong giờ học.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3062, 51, 'えんりょ', '遠慮', 'ngại ngần', '遠慮しないでください。(Đừng ngại ngùng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3063, 51, 'がまん', '我慢', 'chịu đựng', '痛みを我慢しています。(Tôi đang chịu đựng cơn đau.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3064, 51, 'めわく', '目枠', 'làm phiền', '目標を達成しました。(Tôi đã đạt được mục tiêu.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3065, 51, 'きぼう', '希望', 'hi vọng', '希望を持っています。(Tôi có hy vọng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3066, 51, 'ゆめ', '夢', 'giấc mơ', '夢が叶いました。(Giấc mơ đã trở thành hiện thực.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3067, 51, 'さんせい', '賛成', 'đồng ý', '彼の意見に賛成です。(Tôi đồng ý với ý kiến của anh ấy.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3068, 51, 'はんたい', '反対', 'đối lập', 'その提案には反対です。(Tôi phản đối đề xuất đó.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3069, 51, 'そうぞう', '創造', 'tưởng tượng', '新しいアイデアを創造しました。(Tôi đã sáng tạo ra một ý tưởng mới.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3070, 51, 'どりょく', '努力', 'nỗ lực', '彼は努力家です。(Anh ấy là một người nỗ lực.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3071, 51, 'たいよう', '太陽', 'mặt trời', '太陽が昇ります。(Mặt trời mọc.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3072, 51, 'ちきゅう', '地球', 'trái đất', '地球は丸いです。(Trái đất hình tròn.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3073, 51, 'おんど', '温度', 'nhiệt độ', '今日は温度が高いです。(Hôm nay nhiệt độ cao.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3074, 51, 'しつど', '湿度', 'độ ẩm', '湿度が高くて蒸し暑いです。(Độ ẩm cao và oi bức.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3075, 51, 'しっけ', '湿気', 'hơi ẩm', '梅雨が始まりました。(Mùa mưa đã bắt đầu.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3076, 51, 'つゆ', '梅雨', 'mùa mưa', 'パンにかびが生えました。(Bánh mì đã bị mốc.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3077, 51, 'かび', 'かび', 'nấm mốc', '冬は暖房が必要です。(Mùa đông cần có lò sưởi.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3078, 51, 'だんぼう', '暖房', 'điều hòa ấm', 'リンゴの皮をむきます。(Tôi gọt vỏ táo.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3079, 51, 'かわ', '皮', 'da', '魚を館で料理します。(Tôi nấu cá trong nhà bếp.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3080, 51, 'かん', '館', 'can', 'テレビの画面が大きいです。(Màn hình TV rất lớn.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3081, 51, 'がめん', '画面', 'màn hình', '好きな番組を見ます。(Tôi xem chương trình yêu thích.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3082, 51, 'ばんぐみ', '番組', 'chương trình', '新聞の記事を読みます。(Tôi đọc bài báo trên báo.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3083, 51, 'きじ', '記事', 'ký sự', '近所の公園へ行きます。(Tôi đi đến công viên gần nhà.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3084, 51, 'きんじょ', '近所', 'xung quanh', '警察に助けを求めます。(Tôi nhờ cảnh sát giúp đỡ.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3085, 51, 'けいさつ', '警察', 'cảnh sát', '犯人が捕まりました。(Kẻ phạm tội đã bị bắt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3086, 51, 'はんにん', '犯人', 'tội phạm', '財布に小銭がたくさんあります。(Trong ví có nhiều tiền lẻ.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3087, 51, 'こぜに', '小銭', 'tiền lẻ', '母がごちそうを作りました。(Mẹ đã nấu một bữa tiệc thịnh soạn.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3088, 51, 'ごちそう', 'ごちそう', 'chiêu đãi', '彼は有名な作者です。(Anh ấy là một tác giả nổi tiếng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3089, 51, '作者', '作者', 'tác giả', 'その作品は素晴らしいです。(Tác phẩm đó thật tuyệt vời.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3090, 51, 'さくひん', '作品', 'tác phẩm', '学校で制服を着ます。(Tôi mặc đồng phục ở trường.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3091, 51, 'せいふく', '制服', 'đồng phục', '洗剤で食器を洗います。(Tôi rửa chén bát bằng nước rửa chén.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3092, 51, 'せんざい', '洗剤', 'bột giặt', '靴の底が汚れています。(Đế giày bị bẩn.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3093, 51, 'そこ', '底', 'đáy', '地下鉄に乗ります。(Tôi đi tàu điện ngầm.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3094, 51, 'ちか', '地下', 'ngầm', 'お寺を訪れます。(Tôi thăm chùa.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3095, 51, 'てら', '寺', 'chùa', '道路が混んでいます。(Đường phố đang tắc nghẽn.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3096, 51, 'どうろ', '道路', 'đường', '坂を上ります。(Tôi leo lên đồi.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3097, 51, 'さか', '坂', 'dốc', 'タバコの煙が嫌いです。(Tôi ghét khói thuốc lá.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3098, 51, 'けむり', '煙', 'khói', '灰を捨てます。(Tôi đổ tro.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3099, 51, 'はい', '灰', 'tàn', '会社の判を押します。(Tôi đóng dấu công ty.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3100, 51, 'はん', '判', 'con dấu', '名刺を交換します。(Tôi trao đổi danh thiếp.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3101, 51, 'めいし', '名刺', 'danh thiếp', '運転免許を取りました。(Tôi đã lấy được bằng lái xe.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3102, 51, 'めんきょ', '免許', 'giấy phép', '多くの人が参加しました。(Nhiều người đã tham gia.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3103, 51, 'おおく', '多く', 'nhiều', '試合の前半は良かったです。(Hiệp đầu của trận đấu rất tốt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3104, 51, 'ぜんはん', '前半', 'phần đầu', '試合の後半に点を取られました。(Chúng tôi đã bị ghi bàn trong hiệp hai.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3105, 51, 'こうはん', '後半', 'phần cuối', '最高の結果を出しました。(Tôi đã đạt kết quả tốt nhất.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3106, 51, 'さいこう', '最高', 'cao nhất', '最低の点数を取りました。(Tôi đã đạt điểm thấp nhất.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3107, 51, 'さいてい', '最低', 'thấp nhất', '最初に挨拶をします。(Tôi chào hỏi đầu tiên.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3108, 51, 'さいしょ', '最初', 'đầu tiên', '最後まで頑張ります。(Tôi sẽ cố gắng đến cùng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3109, 51, 'さいご', '最後', 'cuối cùng', 'このドアは自動で開きます。(Cửa này mở tự động.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3110, 51, 'じどう', '自動', 'tự động', '色々な種類の花があります。(Có nhiều loại hoa khác nhau.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3111, 51, 'しゅるい', '種類', 'loại', '彼は性格が良いです。(Anh ấy có tính cách tốt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3112, 51, 'せいかく', '性格', 'tính cách', '金は金属の一種です。(Vàng là một loại kim loại.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3113, 51, 'せいしつ', '性質', 'tính chất', '順番を待ちます。(Tôi chờ đến lượt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3114, 51, 'じゅんばん', '順番', 'thứ tự', '次は私の番です。(Lần tới là lượt của tôi.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3115, 51, 'ばん', '番', 'lượt', '彼の方法は正しいです。(Phương pháp của anh ấy là đúng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3116, 51, 'ほうほう', '方法', 'phương pháp', '新しい製品が発売されました。(Sản phẩm mới đã được phát hành.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3117, 51, 'せいひん', '製品', 'sản phẩm', '値上がりが続いています。(Giá cả đang tiếp tục tăng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3118, 51, 'ねあがり', '値上がり', 'tăng giá', '牛乳は生のまま飲みます。(Tôi uống sữa tươi.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3119, 51, 'なま', '生', 'tươi', '喉が渇きました。(Tôi khát nước.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3120, 52, 'かわく', '渇く', 'khát', '香水を嗅ぎます。(Tôi ngửi nước hoa.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3121, 52, 'かぐ', '嗅ぐ', 'ngửi', 'ドアを叩きます。(Tôi gõ cửa.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3122, 52, 'たたく', '叩く', 'đánh, vỗ', '彼は友達を殴りました。(Anh ấy đã đánh bạn mình.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3123, 52, 'なぐる', '殴る', 'đấm', 'ボールを蹴ります。(Tôi đá quả bóng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3124, 52, 'ける', 'ける', 'đá', '赤ちゃんを抱きます。(Tôi ôm em bé.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3125, 52, 'だく', '抱く', 'ôm', '木が強風で倒れました。(Cây đã đổ do gió mạnh.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3126, 52, 'たおれる', '倒れる', 'đổ', '彼はビール瓶を倒しました。(Anh ấy đã làm đổ chai bia.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3127, 52, 'たおす', '倒す', 'làm đổ', '朝早く起きます。(Tôi dậy sớm vào buổi sáng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3128, 52, 'おきる', '起きる', 'thức dậy', '彼は私を起こしました。(Anh ấy đã đánh thức tôi.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3129, 52, 'おこす', '起こす', 'đánh thức', '道を尋ねます。(Tôi hỏi đường.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3130, 52, 'たずねる', '尋ねる', 'hỏi', '彼の名前を呼びます。(Tôi gọi tên anh ấy.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3131, 52, 'よぶ', '呼ぶ', 'gọi', '助けを叫びます。(Tôi kêu cứu.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3132, 52, 'さけぶ', '叫ぶ', 'gào to', '彼は黙っていました。(Anh ấy đã im lặng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3133, 52, 'だまる', '黙る', 'im lặng', '犬を飼っています。(Tôi nuôi một con chó.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3134, 52, 'かう', '飼う', 'nuôi', '星の数を数えます。(Tôi đếm số lượng ngôi sao.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3135, 52, 'かぞえる', '数える', 'đếm', '洗濯物が乾きました。(Quần áo đã khô.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3136, 52, 'かわく', '乾く', 'khô', '髪を乾かします。(Tôi sấy khô tóc.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3137, 52, 'かわかす', '乾かす', 'làm khô', '布団を畳みます。(Tôi gấp chăn đệm.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3138, 52, 'たたむ', '畳む', 'gấp', '友達を映画に誘います。(Tôi mời bạn đi xem phim.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3139, 52, 'さそう', '誘う', 'mời, rủ', '彼に昼ご飯をおごりました。(Tôi đã mời anh ấy bữa trưa.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3140, 52, 'おごる', 'おごる', 'chiêu đãi', '荷物を預かります。(Tôi giữ hành lý.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3141, 52, 'あずかる', '預かる', 'chăm sóc', 'お金を銀行に預けます。(Tôi gửi tiền vào ngân hàng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3142, 52, 'あずける', '預ける', 'gửi', '会議の日程が決まりました。(Lịch họp đã được quyết định.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3143, 52, 'きまる', '決まる', 'được quyết định', '新しい仕事を決めました。(Tôi đã quyết định công việc mới.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3144, 52, 'きめる', '決める', 'quyết định', '写真にうまく写りました。(Tôi đã lên ảnh một cách đẹp đẽ.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3145, 52, 'うつる', '写る', 'chụp được', '景色を写真に写します。(Tôi chụp lại phong cảnh.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3146, 52, 'うつす', '写す', 'chụp', '昔のことを思い出します。(Tôi nhớ lại những chuyện xưa.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3147, 52, 'おもいだす', '思い出す', 'nhớ lại', '先生に数学を教わります。(Tôi được giáo viên dạy môn toán.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3148, 52, 'おそわる', '教わる', 'được dạy', 'イベントに申し込みました。(Tôi đã đăng ký tham gia sự kiện.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3149, 52, 'もうしこむ', '申し込む', 'đăng ký', '彼の依頼を断りました。(Tôi đã từ chối yêu cầu của anh ấy.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3150, 52, 'ことわる', '断る', 'từ chối', '鍵を見つけました。(Tôi đã tìm thấy chìa khóa.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3151, 52, 'みつかる', '見つかる', 'được tìm thấy', '財布を見つけました。(Tôi đã tìm thấy ví tiền.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3152, 52, 'みつける', '見つける', 'tìm thấy', '警察に捕まりました。(Tôi đã bị cảnh sát bắt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3153, 52, 'つかまる', '捕まる', 'bị bắt', '彼を捕まえました。(Tôi đã bắt anh ấy.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3154, 52, 'つかまえる', '捕まえる', 'bắt', 'バスに乗ります。(Tôi lên xe buýt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3155, 52, 'のる', '乗る', 'leo lên', '彼女を車に乗せます。(Tôi chở cô ấy bằng xe hơi.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3156, 52, 'のせる', '乗せる', 'cho lên', '駅で降ります。(Tôi xuống tại ga.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3157, 52, 'おりる', '降りる', 'xuống', '彼を車から降ろします。(Tôi cho anh ấy xuống xe.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3158, 52, 'おろす', '降ろす', 'cho xuống', '車が直りました。(Xe đã được sửa chữa.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3159, 52, 'なおる', '直る', 'được sửa', '車を修理します。(Tôi sửa xe.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3160, 52, 'なおす', '直す', 'sửa', '病気が治りました。(Bệnh đã khỏi.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3161, 52, 'なおる', '治る', 'hồi phục', '医者が病気を治します。(Bác sĩ chữa bệnh.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3162, 52, 'なおす', '治す', 'cứu chữa', '祖母が亡くなりました。(Bà tôi đã qua đời.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3163, 52, 'なくなる', '亡くなる', 'chết', '父を亡くしました。(Tôi đã mất cha.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3164, 52, 'なくす', '亡くす', 'mất', '赤ちゃんが生まれました。(Em bé đã được sinh ra.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3165, 52, 'うまれる', '生まれる', 'được sinh ra', '彼女が子供を生みました。(Cô ấy đã sinh con.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3166, 52, 'うむ', '生む', 'sinh', '彼と駅で出会いました。(Tôi đã gặp anh ấy ở ga.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3167, 52, 'であう', '出会う', 'gặp (ngẫu nhiên)', '友達の家を訪ねます。(Tôi thăm nhà bạn.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3168, 52, 'たずねる', '訪ねる', 'thăm', '彼と付き合っています。(Tôi đang hẹn hò với anh ấy.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3169, 52, 'つきあう', '付き合う', 'hẹn hò, giao tiếp', '薬がよく効きます。(Thuốc có hiệu quả tốt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3170, 52, 'きく', '効く', 'có hiệu quả', 'そのファッションが流行しています。(Thời trang đó đang thịnh hành.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3171, 52, 'はやる', 'はやる', 'phổ biến', '時間が経つのが早いです。(Thời gian trôi nhanh.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3172, 52, 'たつ', '経つ', 'qua', '会議に間に合いました。(Tôi đã kịp giờ họp.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3173, 52, 'まにあう', '間に合う', 'làm cho kịp giờ', '計画を間に合わせました。(Tôi đã hoàn thành kế hoạch đúng hạn.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3174, 52, 'まにあわせる', '間に合わせる', 'kịp giờ', '毎日学校に通っています。(Tôi đi học mỗi ngày.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3175, 52, 'かよう', '通う', 'đi làm, học', '電車が込んでいます。(Tàu điện đông đúc.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3176, 52, 'こむ', '込む', 'đông', '道で人とすれ違いました。(Tôi đã lướt qua người trên đường.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3177, 52, 'すれちあう', 'すれ違う', 'vượt, lướt', '時計が掛かっています。(Đồng hồ đang treo.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3178, 52, 'かかる', '掛かる', 'được bao phủ', '服をハンガーに掛けます。(Tôi treo áo vào móc.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3179, 52, 'かける', '掛ける', 'bao phủ', '車が動きません。(Xe không chạy.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3180, 52, 'うごく', '動く', 'hoạt động', '手を動かします。(Tôi cử động tay.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3181, 52, 'うごかす', '動かす', 'di chuyển', '家から離れます。(Tôi rời khỏi nhà.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3182, 52, 'はなれる', '離れる', 'tránh xa', '犬を放します。(Tôi thả chó ra.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3183, 52, 'はなす', '離す', 'tách ra', '車がぶつかります。(Xe bị va chạm.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3184, 52, 'ぶつかる', 'ぶつかる', 'bị đâm', '車を壁にぶつけました。(Tôi đã đâm xe vào tường.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3185, 52, 'ぶつける', 'ぶつける', 'đâm', 'ジュースがこぼれました。(Nước trái cây đã đổ ra.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3186, 52, 'こぼれる', 'こぼれる', 'bị tràn', '水をこぼします。(Tôi làm đổ nước.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3187, 52, 'こぼす', 'こぼす', 'tràn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3188, 52, 'ふく', 'ふく', 'lau', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3189, 52, 'かたづく', '片付く', 'được dọn dẹp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3190, 52, 'かたづける', '片付ける', 'dọn dẹp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3191, 52, 'つつむ', '包む', 'bọc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3192, 52, 'はる', '張る', 'dán', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3193, 52, 'なくなる', '無くなる', 'bị mất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3194, 52, 'なくす', '無くす', 'mất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3195, 52, 'たりる', '足りる', 'đủ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3196, 52, 'のこる', '残る', 'bị thừa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3197, 52, 'のこす', '残す', 'thừa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3198, 52, 'くさる', '腐る', 'thối', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3199, 52, 'むける', 'むける', 'bị lột', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3200, 52, 'むく', 'むく', 'lột', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3201, 52, 'すべる', '滑る', 'trượt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3202, 52, 'つもる', '積もる', 'được tích tụ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3203, 52, 'つむ', '積む', 'tích tụ, chất lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3204, 52, 'あく', '空く', 'bị thủng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3205, 52, 'あける', '空ける', 'thủng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3206, 52, 'さがる', '下がる', 'bị giảm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3207, 52, 'さげる', '下げる', 'giảm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3208, 52, 'ひえる', '冷える', 'bị lạnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3209, 52, 'ひやす', '冷やす', 'làm lạnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3210, 52, 'さめる', '冷める', 'bị nguội', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3211, 52, 'さます', '冷ます', 'làm nguội', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3212, 52, 'もえる', '燃える', 'cháy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3213, 52, 'もやす', '燃やす', 'đốt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3214, 52, 'わく', '沸く', 'sôi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3215, 52, 'わかす', '沸かす', 'đun sôi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3216, 52, 'なる', '鳴る', 'kêu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3217, 52, 'ならす', '鳴らす', 'làm kêu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3218, 52, 'やくだつ', '役立つ', 'hữu ích', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3219, 52, 'やくだてる', '役立てる', 'được sử dụng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3220, 52, 'かざり', '飾り', 'trang trí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3221, 52, 'あそび', '遊び', 'chơi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3222, 52, 'あつまり', '集まり', 'tập hợp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3223, 52, 'おしえ', '教え', 'dạy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3224, 52, 'おどり', '踊り', 'nhảy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3225, 52, 'おもい', '思い', 'suy nghĩ, cảm giác', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3226, 52, 'かんがえ', '考え', 'nghĩ, ý tưởng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3227, 52, 'かたづけ', '片づけ', 'ngăn nắp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3228, 52, 'てつだい', '手伝い', 'giúp đỡ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3229, 52, 'はたらき', '働き', 'hoạt động', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3230, 52, 'きまり', '決まり', 'luật lệ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3231, 52, 'さわぎ', '騒ぎ', 'ồn ào, om xòm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3232, 52, 'しらせ', '知らせ', 'tin tức, thông báo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3233, 52, 'たのみ', '頼み', 'yêu cầu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3234, 52, 'つかれ', '疲れ', 'vất vả, mệt mỏi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3235, 52, 'ちがい', '違い', 'khác biệt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3236, 52, 'はじめ', '始め', 'khởi đầu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3237, 52, 'つづき', '続き', 'tiếp tục', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3238, 52, 'くれ', '暮れ', 'cuối năm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3239, 52, 'いき', '行き', 'đi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3240, 53, 'かえり', '帰り', 'trở về', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3241, 53, 'いそぎ', '急ぎ', 'khẩn cấp, vội', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3242, 53, 'おくれ', '遅れ', 'gián đoạn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3243, 53, 'かし', '貸し', 'cho mượn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3244, 53, 'かり', '借り', 'mượn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3245, 53, 'かち', '勝ち', 'thắng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3246, 53, 'まけ', '負け', 'thua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3247, 53, 'むかえ', '迎え', 'đón', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3248, 53, 'はじまり', '始まり', 'bắt đầu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3249, 53, 'おわり', '終わり', 'kết thúc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3250, 53, 'もどり', '戻り', 'trở về, trả lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3251, 53, 'わかれ', '別れ', 'chia ly', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3252, 53, 'よろこび', '喜び', 'hớn hở', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3253, 53, 'たのしみ', '楽しみ', 'sung sướng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3254, 53, 'わらい', '笑い', 'cười', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3255, 53, 'おどろき', '驚き', 'ngạc nhiên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3256, 53, 'いかり', '怒り', 'giận dữ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3257, 53, 'かたしみ', '悲しみ', 'buồn bã', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3258, 53, 'しあわせな', '幸せな', 'hạnh phúc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3259, 53, 'とくいな', '得意な', 'mạnh, giỏi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3260, 53, 'にがてな', '苦手な', 'yếu, kém', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3261, 53, 'ねっしんな', '熱心な', 'chăm chỉ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3262, 53, 'むちゅうな', '夢中な', 'chú tâm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3263, 53, 'たいくつな', '退屈な', 'chán', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3264, 53, 'けんこうな', '健康な', 'khỏe khoắn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3265, 53, 'くるしい', '苦しい', 'cực khổ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3266, 53, 'へいきな', '平気な', 'bình thản', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3267, 53, 'くやしい', '悔しい', 'cay cú', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3268, 53, 'うらやましい', 'うらやましい', 'ghen tỵ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3269, 53, 'かゆい', 'かゆい', 'ngứa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3270, 53, 'おとなしい', 'おとなしい', 'trầm lặng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3271, 53, 'がまんづよい', '我慢強い', 'chịu đựng giỏi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3272, 53, 'しょうじきな', '正直な', 'trung thực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3273, 53, 'けちな', 'けちな', 'kẹt xỉ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3274, 53, 'わがままな', '我儘な', 'ích kỷ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3275, 53, 'せっきょくてきな', '積極的な', 'tích cực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3276, 53, 'しょうきょくてきな', '消極的な', 'tiêu cực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3277, 53, 'まんぞくな', '満足な', 'thỏa mãn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3278, 53, 'ふまんな', '不満な', 'bất mãn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3279, 53, 'ふあんな', '不安な', 'bất an', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3280, 53, 'たいへんな', '大変な', 'tồi tệ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3281, 53, 'むりな', '無理な', 'vô lý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3282, 53, 'ふちゅういな', '不注意な', 'không chú ý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3283, 53, 'らくな', '楽な', 'thoải mái', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3284, 53, 'めんどうな', '面倒な', 'phiền phức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3285, 53, 'しつれいな', '失礼な', 'thất lễ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3286, 53, 'とうぜんな', '当然な', 'đương nhiên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3287, 53, 'いがいな', '意外な', 'không ngờ đến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3288, 53, 'けっこうな', '結構な', 'tốt, đủ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3289, 53, 'はでな', '派手な', 'lòe loẹt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3290, 53, 'じみな', '地味な', 'giản dị', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3291, 53, 'おしゃれな', 'おしゃれな', 'thời trang, mốt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3292, 53, 'へんな', '変な', 'lạ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3293, 53, 'ふしぎな', '不思議な', 'thần bí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3294, 53, 'ましな', 'ましな', 'tốt lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3295, 53, 'むだな', 'むだな', 'lãng phí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3296, 53, 'じゆうな', '自由な', 'tự do', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3297, 53, 'ふじゆうな', '不自由な', 'tàn tật, không tự do', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3298, 53, 'あたたまる', '温まる', 'trở nên ấm hơn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3299, 53, 'あたためる', '温める', 'ấm, nóng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3300, 53, 'たかまる', '高まる', 'cao lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3301, 53, 'たかめる', '高める', 'làm cao lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3302, 53, 'つよまる', '強まる', 'mạnh lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3303, 53, 'つよめる', '強める', 'làm mạnh lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3304, 53, 'よわまる', '弱まる', 'yếu đi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3305, 53, 'よわめる', '弱める', 'làm yếu đi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3306, 53, 'ひろまる', '広まる', 'rộng ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3307, 53, 'ひろめる', '広める', 'làm rộng ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3308, 53, 'ふかまる', '深まる', 'sâu hơn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3309, 53, 'ふかめる', '深める', 'làm sâu thêm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3310, 53, 'せわ', '世話', 'chăm sóc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3311, 53, 'かてい', '家庭', 'gia đình', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3312, 53, 'きょうりょく', '協力', 'hiệp lực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3313, 53, 'かんしゃ', '感謝', 'cảm tạ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3314, 53, 'おれい', 'お礼', 'đáp lễ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3315, 53, 'おわび', 'お詫び', 'xin lỗi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3316, 53, 'おじぎ', 'おじぎ', 'cúi chào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3317, 53, 'あくしゅ', '握手', 'bắt tay', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3318, 53, 'いじわる', 'いじわる', 'xấu bụng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3319, 53, 'いたずら', 'いたずら', 'nghịch ngợm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3320, 53, 'せつやく', '節約', 'tiết kiệm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3321, 53, 'けいえい', '経営', 'quản lý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3322, 53, 'はんせい', '反省', 'tự kiểm tra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3323, 53, 'じっこう', '実行', 'thực hành', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3324, 53, 'しんぽ', '進歩', 'tiến bộ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3325, 53, 'へんか', '変化', 'thay đổi, biến hóa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3326, 53, 'はったつ', '発達', 'phát triển', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3327, 53, 'たいりょく', '体力', 'thể lực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3328, 53, 'しゅつじょう', '出場', 'tham dự', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3329, 53, 'かつやく', '活躍', 'hoạt động', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3330, 53, 'きょうそう', '競争', 'cạnh tranh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3331, 53, 'おうえん', '応援', 'cổ vũ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3332, 53, 'はくしゅ', '拍手', 'vỗ tay', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3333, 53, 'にんき', '人気', 'nổi tiếng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3334, 53, 'うわさ', 'うわさ', 'tin đồn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3335, 53, 'じょうほう', '情報', 'thông tin', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3336, 53, 'こうかん', '交換', 'trao đổi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3337, 53, 'りゅうこう', '流行', 'trào lưu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3338, 53, 'せんでん', '宣伝', 'tuyên truyền', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3339, 53, 'こうこく', '広告', 'quảng cáo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3340, 53, 'ちゅうもく', '注目', 'chú trọng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3341, 53, 'つうやく', '通訳', 'thông dịch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3342, 53, 'ほにゃく', '翻訳', 'biên dịch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3343, 53, 'でんごん', '伝言', 'tin nhắn thoại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3344, 53, 'ほうこく', '報告', 'báo cáo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3345, 53, 'ろくが', '録画', 'ghi lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3346, 53, 'こんざつ', '混雑', 'hỗn tạp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3347, 53, 'じゅうたい', '渋滞', 'tắc đường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3348, 53, 'しょうとつ', '衝突', 'xung đột', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3349, 53, 'ひがい', '被害', 'thiệt hại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3350, 53, 'じこ', '事故', 'tai nạn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3351, 53, 'じけん', '事件', 'sự kiện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3352, 53, 'こしょう', '故障', 'hỏng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3353, 53, 'しゅうり', '修理', 'sửa chữa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3354, 53, 'ていでん', '停電', 'mất điện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3355, 53, 'ちょうし', '調子', 'trạng thái', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3356, 53, 'きんちょう', '緊張', 'lo lắng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3357, 53, 'じしん', '自身', 'tự tin', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3358, 53, 'じまん', '自慢', 'tự mãn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3359, 53, 'かんしん', '感心', 'quan tâm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3360, 54, 'かんどう', '感動', 'cảm động', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3361, 54, 'こうふん', '興奮', 'hưng phấn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3362, 54, 'かんそう', '感想', 'cảm tưởng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3363, 54, 'よそう', '予想', 'dự đoán', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3364, 54, 'せんもん', '専門', 'chuyên môn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3365, 54, 'けんきゅう', '研究', 'nghiên cứu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3366, 54, 'ちょうさ', '調査', 'điều tra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3367, 54, 'げんいん', '原因', 'nguyên nhân', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3368, 54, 'けっか', '結果', 'kết quả', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3369, 54, 'かいけつ', '解決', 'giải quyết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3370, 54, 'かくにん', '確認', 'xác nhận', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3371, 54, 'りよう', '利用', 'sử dụng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3372, 54, 'りかい', '理解', 'lý giải', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3373, 54, 'はっけん', '発見', 'phát kiến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3374, 54, 'はつめい', '発明', 'phát minh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3375, 54, 'かんけい', '関係', 'quan hệ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3376, 54, 'だんたい', '団体', 'đoàn thể', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3377, 54, 'せんきょ', '選挙', 'bầu cử', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3378, 54, 'ぜいきん', '税金', 'thuế', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3379, 54, 'せきにん', '責任', 'trách nhiệm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3380, 54, 'しょるい', '書類', 'tài liệu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3381, 54, 'だいめい', '題名', 'tiêu đề', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3382, 54, 'じょうけん', '条件', 'điều kiện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3383, 54, 'しめきり', '締め切り', 'hạn cuối', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3384, 54, 'きかん', '期間', 'thời gian, thời kỳ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3385, 54, 'ばい', '倍', 'lần', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3386, 54, 'くじ', 'くじ', 'xổ số, rút thăm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3387, 54, 'ちかみち', '近道', 'đường tắt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3388, 54, 'ちゅうしん', '中心', 'trung tâm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3389, 54, 'あたり', '辺り', 'gần, lân cận', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3390, 54, 'まわり', '周り', 'xung quanh, vòng quanh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3391, 54, 'あな', '穴', 'lỗ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3392, 54, 'れつ', '列', 'hàng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3393, 54, 'はば', '幅', 'chiều rộng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3394, 54, 'はんい', '範囲', 'phạm vi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3395, 54, 'ないよう', '内容', 'nội dung', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3396, 54, 'なかみ', '中身', 'bên trong', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3397, 54, 'とくちょう', '特徴', 'đặc trưng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3398, 54, 'ふつう', '普通', 'bình thường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3399, 54, 'あたりまえ', '当たり前', 'đương nhiên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3400, 54, 'にせ', '偽', 'giả', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3401, 54, 'べつ', '別', 'khác', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3402, 54, 'こくせき', '国籍', 'quốc tịch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3403, 54, 'とうよう', '東洋', 'phương đông', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3404, 54, 'せいよう', '西洋', 'phương tây', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3405, 54, 'こくさい', '国際', 'quốc tế', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3406, 54, 'しぜん', '自然', 'tự nhiên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3407, 54, 'けしき', '景色', 'phong cảnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3408, 54, 'しゅうきょう', '宗教', 'tôn giáo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3409, 54, 'あい', '愛', 'yêu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3410, 54, 'とどく', '届く', 'được giao đến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3411, 54, 'とどける', '届ける', 'giao đến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3412, 54, 'かく', 'かく', 'gãi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3413, 54, 'つかむ', 'つかむ', 'tóm, chộp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3414, 54, 'にぎる', '握る', 'nắm chặt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3415, 54, 'おさえる', '抑える', 'giữ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3416, 54, 'ちかづく', '近づく', 'lại gần', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3417, 54, 'ちかづける', '近づける', 'mang đến gần', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3418, 54, 'あう', '合う', 'gặp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3419, 54, 'あわせる', '合わせる', 'tập hợp, hiệp lực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3420, 54, 'あたる', '当たる', 'bị đánh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3421, 54, 'あてる', '当てる', 'đánh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3422, 54, 'くらべる', '比べる', 'so sánh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3423, 54, 'にあう', '似合う', 'hợp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3424, 54, 'にる', '似る', 'giống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3425, 54, 'にせる', '似せる', 'bắt chước', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3426, 54, 'わかれる', '分かれる', 'được chia ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3427, 54, 'わける', '分ける', 'chia', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3428, 54, 'たす', '足す', 'cộng, thêm vào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3429, 54, 'ひく', '引く', 'kéo, trừ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3430, 54, 'ふえる', '増える', 'tăng lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3431, 54, 'ふやす', '増やす', 'làm tăng lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3432, 54, 'へる', '減る', 'giảm xuống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3433, 54, 'へらす', '減らす', 'làm giảm xuống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3434, 54, 'かわる', '変わる', 'thay đổi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3435, 54, 'かえる', '変える', 'làm thay đổi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3436, 54, 'かわる', '代わる・替わる・換わる', 'thay', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3437, 54, 'かえる', '代える・替える・換える', 'đổi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3438, 54, 'かえる', '返る', 'được trả lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3439, 54, 'かえす', '返す', 'trả lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3440, 54, 'ゆずる', '譲る', 'nhường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3441, 54, 'たすかる', '助かる', 'được giúp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3442, 54, 'たすける', '助ける', 'giúp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3443, 54, 'いじめる', 'いじめる', 'bắt nạt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3444, 54, 'だまる', 'だまる', 'lừa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3445, 54, 'ぬすむ', '盗む', 'lấy cắp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3446, 54, 'ささる', '刺さる', 'bị đâm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3447, 54, 'さす', '刺す', 'đâm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3448, 54, 'ころす', '殺す', 'giết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3449, 54, 'かくれる', '隠れる', 'ẩn náu, trốn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3450, 54, 'かくす', '隠す', 'che giấu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3451, 54, 'うまる', '埋まる', 'bị chôn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3452, 54, 'うめる', '埋める', 'chôn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3453, 54, 'かこむ', '囲む', 'vây quanh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3454, 54, 'つまる', '詰まる', 'đầy, chặt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3455, 54, 'つめる', '詰める', 'đóng gói', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3456, 54, 'ひらく', '開く', 'mở', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3457, 54, 'とじる', '閉じる', 'dđóng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3458, 54, 'とぶ', '飛ぶ', 'bay', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3459, 54, 'とばす', '飛ばす', 'cho bay', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3460, 54, 'ふる', '振る', 'rung, vẫy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3461, 54, 'めくる', 'めくる', 'lật lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3462, 54, 'みかける', '見かける', 'tình cờ thấy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3463, 54, 'たしかめる', '確かめる', 'kiểm tra lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3464, 54, 'ためす', '試す', 'thử', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3465, 54, 'くりかえす', '繰り返す', 'lặp lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3466, 54, 'やくす', '訳す', 'dịch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3467, 54, 'おこなう', '行う', 'tổ chức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3468, 54, 'まちがう', '間違う', 'bị sai', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3469, 54, 'まちがえる', '間違える', 'làm sai', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3470, 54, 'ゆるす', '許す', 'tha thứ, cho phép', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3471, 54, 'なれる', '慣れる', 'quen', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3472, 54, 'ならす', '慣らす', 'khởi động', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3473, 54, 'たつ', '立つ', 'đứng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3474, 54, 'たてる', '立てる', 'dựng lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3475, 54, 'たつ', '建つ', 'được xây', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3476, 54, 'たてる', '建てる', 'xây', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3477, 54, 'そだつ', '育つ', 'được nuôi dạy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3478, 54, 'そだてる', '育てる', 'nuôi, dạy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3479, 54, 'はえる', '生える', 'mọc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3480, 55, 'はやす', '生やす', 'nuôi(râu)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3481, 55, 'よごれる', '汚れる', 'bị bẩn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3482, 55, 'よごす', '汚す', 'làm bẩn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3483, 55, 'こわれる', '壊れる', 'bị hỏng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3484, 55, 'こわす', '壊す', 'làm hỏng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3485, 55, 'われる', '割れる', 'bị vỡ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3486, 55, 'わる', '割る', 'làm vỡ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3487, 55, 'おれる', '折れる', 'bị gãy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3488, 55, 'おる', '折る', 'làm gãy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3489, 55, 'やぶれる', '破れる', 'bị rách', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3490, 55, 'やぶる', '破る', 'xé rách', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3491, 55, 'まがる', '曲がる', 'gập, cong', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3492, 55, 'まげる', '曲げる', 'bẻ, uốn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3493, 55, 'はずれる', '外れる', 'bị rời ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3494, 55, 'はずす', '外す', 'tách ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3495, 55, 'ゆれる', '揺れる', 'bị rung', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3496, 55, 'ゆらす', '揺らす', 'đung đưa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3497, 55, 'ながれる', '流れる', 'chảy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3498, 55, 'ながす', '流す', 'cho chảy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3499, 55, 'ぬれる', '濡れる', 'bị ướt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3500, 55, 'ぬらす', '濡らす', 'làm ướt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3501, 55, 'まよう', '迷う', 'lạc đường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3502, 55, 'なやむ', '悩む', 'băn khoăn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3503, 55, 'あわてる', '慌てる', 'vội vàng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3504, 55, 'さめる', '覚める', 'thức dậy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3505, 55, 'さます', '覚ます', 'mở mắt, tỉnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3506, 55, 'ねむる', '眠る', 'ngủ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3507, 55, 'いのる', '祈る', 'cầu, khấn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3508, 55, 'いわう', '祝う', 'ăn mừng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3509, 55, 'かんじる', '感じる', 'cảm thấy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3510, 55, '', 'クラスメート', 'bạn cùng lớp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3511, 55, '', 'グループ', 'nhóm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3512, 55, '', 'チーム', 'đội', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3513, 55, '', 'プロフェッショナル', 'chuyên nghiệp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3514, 55, '', 'アマチュア', 'nghiệp dư', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3515, 55, '', 'トレーニング', 'đào tạo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3516, 55, '', 'マッサージ', 'mát xa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3517, 55, '', 'アドバイス', 'khuyên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3518, 55, '', 'アイデア・アイディア', 'ý tưởng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3519, 55, '', 'トップ', 'top', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3520, 55, '', 'スピード', 'tốc độ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3521, 55, '', 'ラッシュ', 'đông đúc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3522, 55, '', 'バイク', 'xe máy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3523, 55, '', 'ヘルメット', 'mũ bảo hiểm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3524, 55, '', 'コンタクトレンズ', 'kính áp tròng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3525, 55, '', 'ガラス', 'kính', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3526, 55, '', 'プラスチック', 'nhựa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3527, 55, '', 'ベランダ', 'ban công', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3528, 55, '', 'ペット', 'thú cưng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3529, 55, '', 'ベンチ', 'ghế bành', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3530, 55, '', 'デザイン', 'thiết kế', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3531, 55, '', 'バーゲンセール', 'sale', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3532, 55, '', 'パート', 'làm thêm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3533, 55, '', 'コンビニエンスストア', 'cửa hàng tiện ích', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3534, 55, '', 'レジ', 'máy tính tiền', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3535, 55, '', 'レシート', 'hóa đơn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3536, 55, '', 'インスタント', 'ăn liền', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3537, 55, '', 'ファストフード', 'đồ ăn nhanh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3538, 55, '', 'フルーツ', 'trái cây', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3539, 55, '', 'デザート', 'tráng miệng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3540, 55, '', 'インターネット', 'internet', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3541, 55, '', 'チャイム', 'chuông', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3542, 55, '', 'アナウンス', 'thông báo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3543, 55, '', 'メッセージ', 'tin nhắn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3544, 55, '', 'パンフレット', 'tờ rơi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3545, 55, '', 'カード', 'card', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3546, 55, '', 'インタビュー', 'phỏng vấn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3547, 55, '', 'アンケート', 'tờ câu hỏi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3548, 55, '', 'データ', 'dữ liệu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3549, 55, '', 'パーセント', 'phần trăm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3550, 55, 'こい', '濃い', 'đậm, đặc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3551, 55, 'うすい', '薄い', 'mỏng, nhạt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3552, 55, 'すっぱい', '酸っぱい', 'chua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3553, 55, 'くさい', '臭い', 'thối', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3554, 55, 'おかしい', 'おかしい', 'lạ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3555, 55, 'かっこいい', 'かっこいい', 'bảnh bao', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3556, 55, 'うまい', 'うまい', 'ngon', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3557, 55, 'したしい', '親しい', 'thân thiết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3558, 55, 'くわしい', '詳しい', 'chi tiết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3559, 55, 'こまかい', '細かい', 'tiểu tiết, bé', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3560, 55, 'あさい', '浅い', 'nông', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3561, 55, 'かたい', '固い・硬い', 'cứng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3562, 55, 'ぬるい', 'ぬるい', 'nguội', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3563, 55, 'まぶしい', 'まぶしい', 'chói', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3564, 55, 'むしあつい', '蒸し暑い', 'nóng ẩm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3565, 55, 'せいけつな', '清潔な', 'sạch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3566, 55, 'しんせんな', '新鮮な', 'tươi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3567, 55, 'ゆたかな', '豊かな', 'giàu có', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3568, 55, 'りっぱな', '立派な', 'siêu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3569, 55, 'せいかくな', '正確な', 'chính xác', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3570, 55, 'たしかな', '確かな', 'đích thực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3571, 55, 'じゅうような', '重要な', 'quan trọng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3572, 55, 'ひつような', '必要な', 'cần thiết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3573, 55, 'もったいない', 'もったいない', 'lãng phí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3574, 55, 'すごい', 'すごい', 'ghê, siêu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3575, 55, 'ひどい', 'ひどい', 'tồi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3576, 55, 'はげしい', '激しい', 'mãnh liệt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3577, 55, 'そっくりな', 'そっくりな', 'giống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3578, 55, 'きゅうな', '急な', 'đột nhiên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3579, 55, 'てきとな', '敵とな', 'phù hợp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3580, 55, 'とくべつな', '特別な', 'đặc biệt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3581, 55, 'かんぜんな', '完全な', 'toàn bộ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3582, 55, 'さかんな', '盛んな', 'thịnh vượng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3583, 55, 'さまざまな', '様々な', 'đa đạng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3584, 55, 'かのうな', '可能な', 'khả thi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3585, 55, 'ふかのうな', '不可能な', 'bất khả thi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3586, 55, 'きほんてきな', '基本的な', 'cơ bản', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3587, 55, 'こくさいてきな', '国際的な', 'tính quốc tế', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3588, 55, 'ばらばらな', 'ばらばらな', 'tung tóe, chia rẽ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3589, 55, 'ぼろぼろな', 'ぼろぼろな', 'rách nát, te tua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3590, 55, 'たいへんに', '大変に', 'khủng khiếp, rất nhiều', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3591, 55, 'ほとんど', 'ほとんど', 'gần như hoàn toàn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3592, 55, 'だいたい', '大体', 'phần lớn, trong khoảng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3593, 55, 'かなり', 'かなり', 'khá', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3594, 55, 'ずいぶん', 'ずいぶん', 'đáng kể', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3595, 55, 'けっこう', 'けっこう', 'rất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3596, 55, 'ずいぶん', '大分', 'chủ yếu, khá', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3597, 55, 'もっと', 'もっと', 'hơn, nữa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3598, 55, 'しっかり', 'しっかり', 'toàn bộ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3599, 55, 'いっぱい', 'いっぱい', 'đầy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3600, 56, 'ぎりぎり', 'ぎりぎり', 'gần, sát nút', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3601, 56, 'ぴったり', 'ぴったり', 'vừa vặn, đúng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3602, 56, 'たいてい', 'たいてい', 'đại thể, thường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3603, 56, 'どうじに', '同時に', 'cùng lúc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3604, 56, 'まえもって', '前もって', 'trước', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3605, 56, 'すぐに', 'すぐに', 'ngay lập tức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3606, 56, 'もうすぐ', 'もうすぐ', 'sắp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3607, 56, 'とつぜん', '突然', 'đột nhiên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3608, 56, 'あっというまに', 'あっという間に', 'loáng một cái', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3609, 56, 'いつのまにか', 'いつの間にか', 'lúc nào không biết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3610, 56, 'しばらく', 'しばらく', 'một chút', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3611, 56, 'ずっと', 'ずっと', 'suốt, nhiều', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3612, 56, 'あいかわらず', '相変わらず', 'như mọi khi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3613, 56, 'つぎつぎに', '次々に', 'lần lượt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3614, 56, 'どんどん', 'どんどん', 'dần dần', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3615, 56, 'ますます', 'ますます', 'càng ngày càng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3616, 56, 'やっと', 'やっと', 'cuối cùng, vừa đủ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3617, 56, 'とうとう', 'とうとう', 'sau cùng, cuối cùng, sau tất cả', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3618, 56, 'ついに', 'ついに', 'cuối cùng, sau cùng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3619, 56, 'もちろん', 'もちろん', 'tất nhiên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3620, 56, 'やはり', 'やはり', 'như dự tính', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3621, 56, 'きっと', 'きっと', 'nhất định', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3622, 56, 'ぜひ', 'ぜひ', 'bằng mọi giá, rất (muốn)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3623, 56, 'なるべく', 'なるべく', 'càng nhiều càng tốt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3624, 56, 'あんがい', '案外', 'không ngờ đến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3625, 56, 'もしかすると・もしかしたら・もしかして', 'もしかすると・もしかしたら・もしかして', 'có lẽ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3626, 56, 'まさか', 'まさか', 'không thể ngờ, không', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3627, 56, 'うっかり', 'うっかり', 'ngơ ngác, không để ý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3628, 56, 'つい', 'つい', 'vô ý, buột', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3629, 56, 'おもわず', '思わず', 'không ngờ đến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3630, 56, 'ほっと', 'ほっと', 'yên tâm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3631, 56, 'いらいら', 'いらいら', 'khó chịu, nóng giận', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3632, 56, 'のんびり', 'のんびり', 'tận hưởng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3633, 56, 'じつは', '実は', 'thực tế là', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3634, 56, 'どくしょ', '読書', 'đọc viết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3635, 56, 'えんそう', '演奏', 'biểu diễn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3636, 56, 'げいじゅつ', '芸術', 'nghệ thuật', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3637, 56, 'けんさ', '検査', 'kiểm tra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3638, 56, 'けつえき', '血液', 'máu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3639, 56, 'ちりょう', '治療', 'trị liệu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3640, 56, 'しょうじょう', '症状', 'triệu chứng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3641, 56, 'よぼう', '予防', 'dự phòng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3642, 56, 'えいよう', '栄養', 'dinh dưỡng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3643, 56, 'しゅじゅつ', '手術', 'phẫu thuật', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3644, 56, 'しぼう', '死亡', 'tử vong', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3645, 56, 'いのち', '命', 'sinh mạng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3646, 56, 'いっしょう', '一生', 'suốt đời', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3647, 56, 'ごかい', '誤解', 'hiểu nhầm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3648, 56, 'こうかい', '後悔', 'hối hận', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3649, 56, 'わけ', '訳', 'lý do', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3650, 56, 'たいど', '態度', 'thái độ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3651, 56, 'くせ', '癖', 'thói quen', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3652, 56, 'れいぎ', '礼儀', 'lễ nghĩa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3653, 56, 'もんく', '文句', 'phàn nàn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3654, 56, 'ひょうじょう', '表情', 'biểu lộ, biểu thị', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3655, 56, 'ひょうめん', '鏡面', 'bề mặt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3656, 56, 'きんえん', '禁煙', 'cấm hút thuốc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3657, 56, 'きんし', '禁止', 'cấm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3658, 56, 'かんせい', '完成', 'hoàn thành', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3659, 56, 'かだい', '課題', 'chủ đề', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3660, 56, 'れいがい', '例外', 'ngoại lệ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3661, 56, 'きほん', '基本', 'cơ bản', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3662, 56, 'きろく', '記録', 'ghi âm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3663, 56, 'じょうたい', '状態', 'trạng thái', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3664, 56, 'できごと', '出来事', 'sự kiện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3665, 56, 'ばめん', '場面', 'khung cảnh, tình huống, hiện trường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3666, 56, 'きかい', '機会', 'cơ hội', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3667, 56, 'きょり', '距離', 'khoảng cách', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3668, 56, 'ていあん', '提案', 'đề xuất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3669, 56, 'やりとり', 'やり取り', 'trao đổi, làm việc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3670, 56, 'ちしき', '知識', 'kiến thức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3671, 56, 'じつりょく', '実力', 'thực lực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3672, 56, 'しゅだん', '手段', 'cách thức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3673, 56, 'だいひょう', '代表', 'đại biểu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3674, 56, 'えいきょう', '影響', 'ảnh hưởng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3675, 56, 'こうか', '効果', 'hiệu quả', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3676, 56, 'いんしょう', '印象', 'ấn tượng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3677, 56, 'しるし', '印', 'dấu, dấu hiệu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3678, 56, 'あいず', '合図', 'ám hiệu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3679, 56, 'きょうつう', '共通', 'chung', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3680, 56, 'きょうちょう', '協調', 'nhấn mạnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3681, 56, 'しょうりゃく', '省略', 'lược bớt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3682, 56, 'ちょうせん', '挑戦', 'thử thách', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3683, 56, 'やるき', 'やる気', 'động lực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3684, 56, 'ゆうき', '勇気', 'dũng cảm, dũng khí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3685, 56, 'しかく', '資格', 'bằng cấp, tư cách', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3686, 56, 'しんせい', '申請', 'đăng ký, ứng tuyển', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3687, 56, 'ほんにん', '本人', 'người được nói đến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3688, 56, 'けいやく', '契約', 'hợp đồng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3689, 56, 'しょうめい', '証明', 'chứng minh, bằng chứng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3690, 56, 'へんこう', '変更', 'thay đổi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3691, 56, 'ほぞん', '保存', 'bảo tồn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3692, 56, 'ほご', '保護', 'bảo vệ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3693, 56, 'かんきょう', '環境', 'môi trường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3694, 56, 'しげん', '資源', 'tài nguyên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3695, 56, 'ふそく', '不足', 'thiếu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3696, 56, 'へいきん', '平均', 'trung bình', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3697, 56, 'わりあい', '割合', 'tỷ lệ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3698, 56, 'しょうばい', '商売', 'kinh doanh, buôn bán', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3699, 56, 'しょうひん', '商品', 'sản phẩm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3700, 56, 'しつ', '質', 'chất lượng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3701, 56, 'かた', '型', 'mẫu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3702, 56, 'せいさん', '生産', 'sản xuất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3703, 56, 'しょうひ', '消費', 'tiêu dùng, tiêu thụ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3704, 56, 'ぶっか', '物価', 'giá cả, vật giá', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3705, 56, 'とうさん', '倒産', 'phá sản', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3706, 56, 'けいたい', '携帯', 'mang theo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3707, 56, 'げんだい', '現代', 'hiện tại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3708, 56, 'せいき', '世紀', 'thế kỷ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3709, 56, 'ぶんか', '文化', 'văn hóa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3710, 56, 'とし', '都市', 'thành phố', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3711, 56, 'ちほう', '地方', 'địa phương', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3712, 56, 'せんそう', '戦争', 'chiến tranh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3713, 56, 'へいわ', '平和', 'hòa bình', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3714, 56, 'のぼる', '上る', 'leo lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3715, 56, 'くだる', '下る', 'đi xuống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3716, 56, 'すすむ', '進む', 'tiến lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3717, 56, 'すすめる', '進める', 'làm cho tiến lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3718, 56, 'とおる', '通る', 'thông qua, được chấp nhận, đi qua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3719, 56, 'とおす', '通す', 'xuyên qua, thông qua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3720, 57, 'こえる', '超える・越える', 'vượt qua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3721, 57, 'すぎる', '過ぎる', 'quá, đi qua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3722, 57, 'すごす', '過ごす', 'sử dụng(thời gian)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3723, 57, 'うつる', '移る', 'được chuyển', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3724, 57, 'うつす', '移す', 'chuyển', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3725, 57, 'つれる', '連れる', 'dẫn đi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3726, 57, 'よる', '寄る', 'ghé sát, lại gần', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3727, 57, 'よせる', '寄せる', 'ghé vào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3728, 57, 'あたえる', '与える', 'trao, cung cấp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3729, 57, 'える', '得る', 'đạt được, có được', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3730, 57, 'むく', '向く', 'hướng, đối diện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3731, 57, 'むける', '向ける', 'hướng đến, quay', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3732, 57, 'すすめる', '勧める', 'rủ, mời, gợi ý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3733, 57, 'すすめる', '薦める', 'giới thiệu, gợi ý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3734, 57, 'まかせる', '任せる', 'tin tưởng, để cho ai đó làm gì', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3735, 57, 'まもる', '守る', 'giữ, tuân thủ, bảo vệ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3736, 57, 'あらそう', '争う', 'gây gổ, tranh giành', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3737, 57, 'のぞむ', '臨む', 'ước', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3738, 57, 'しんじる', '信じる', 'tin tưởng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3739, 57, 'つうじる', '通じる', 'hiểu, thông qua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3740, 57, 'あきる', '飽きる', 'chán, ngấy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3741, 57, 'おもいつく', '思いつく', 'nghĩ về', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3742, 57, 'おもいやる', '思いやる', 'quan tâm, thông cảm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3743, 57, 'ねっちゅうする', '熱中する', 'nghiện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3744, 57, 'くらす', '暮らす', 'sống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3745, 57, 'まく', '巻く', 'quấn, quàng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3746, 57, 'むすぶ', '結ぶ', 'buộc, cột, nối', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3747, 57, 'すむ', '済む', 'kết thúc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3748, 57, 'すませる・済ます', '済ませる・済ます', 'hoàn tất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3749, 57, 'できる', '出来る', 'có thể, được xây dựng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3750, 57, 'きれる', '切れる', 'cắt, hết hạn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3751, 57, 'きらす', '切らす', 'hết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3752, 57, 'つたわる', '伝わる', 'được truyền đi, được trải ra, được giới thiệu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3753, 57, 'つたえる', '伝える', 'truyền đi, giới thiệu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3754, 57, 'つづく', '続く', 'tiếp tục, xảy ra, lặp lại, theo sau', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3755, 57, 'つづける', '続ける', 'tiếp tục, xảy ra liên tiếp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3756, 57, 'つながる', 'つながる', 'được kết nối, được mở rộng, thông qua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3757, 57, 'つなぐ', 'つなぐ', 'kết nối, tham gia', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3758, 57, 'つなげる', 'つなげる', 'kết nối, làm chặt thêm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3759, 57, 'のびる', '伸びる', 'lớn lên, tăng thêm, dài ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3760, 57, 'のばす', '伸ばす', 'nuôi dài, căng ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3761, 57, 'のびる', '延びる', 'bị trì hoãn, bị kéo dài', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3762, 57, 'のばす', '延ばす', 'trì hoãn, kéo dài', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3763, 57, 'かさなる', '重なる', 'xung đột, xếp chồng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3764, 57, 'かさねる', '重ねる', 'chồng lên, tích trữ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3765, 57, 'ひろがる', '広がる', 'mở rộng, bùng phát, lan tràn, trải dài', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3766, 57, 'ひろげる', '広げる', 'mở thêm, mở rộng, nới rộng, mở ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3767, 57, 'のる', '載る', 'vừa, được công bố', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3768, 57, 'のせる', '載せる', 'cho vào, cho lên, công bố', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3769, 57, 'そろう', 'そろう', 'thu thập, được thu thập', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3770, 57, 'そろえる', 'そろえる', 'gom lại, chuẩn bị sẵn sàng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3771, 57, 'まとまる', 'まとまる', 'được thống nhất, được tổ chức, được sắp xếp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3772, 57, 'まとめる', 'まとめる', 'tập hợp, sàng lọc, hợp nhất, tổ chức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3773, 57, 'つく', '付く', 'dính, gắn, đạt được, đi cùng với', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3774, 57, 'つける', '付ける', 'gắn, thêm vào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3775, 57, 'たまる', 'たまる', 'được tiết kiệm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3776, 57, 'ためる', 'ためる', 'tiết kiệm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3777, 57, 'まじる', '交じる・混じる', 'giao vào, lẫn vào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3778, 57, 'まざる', '交ざる・混ざる', 'được trộn lẫn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3779, 57, 'まぜる', '交ぜる・混ぜる', 'trộn vào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3780, 57, 'とける', '解ける・溶ける', 'được giải quyết, nóng chảy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3781, 57, 'とく', '解く・溶く', 'giải quyết, nóng chảy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3782, 57, 'ふくむ', '含む', 'chứa, bao gồm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3783, 57, 'ふくめる', '含める', 'bao gồm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3784, 57, 'ぬける', '抜ける', 'tháo, tuột', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3785, 57, 'ぬく', '抜く', 'lấy ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3786, 57, 'あらわれる', '現れる', 'xuất hiện, được thẻ hiện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3787, 57, 'あらわす', '現す', 'xuất hiện, hiện ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3788, 57, 'あらわれる', '表れる', 'biểu hiện (trên mặt)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3789, 57, 'あらわす', '表す', 'biểu thị, biểu lộ, đại diện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3790, 57, 'ちる', '散る', 'bị tàn, rụng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3791, 57, 'ちらす', '散らす', 'tàn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3792, 57, 'あける', '明ける', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3793, 57, 'さす', '差す', '(mặt trời) chiếu sáng, mở (ô), nhỏ (thuốc mắt)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3794, 57, '', 'パートナ', 'đối tác', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3795, 57, '', 'リーダー', 'lãnh đạo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3796, 57, '', 'ボランティア', 'tình nguyện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3797, 57, '', 'コミュニケーション', 'giao tiếp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3798, 57, '', 'ユーモア', 'hài hước, đùa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3799, 57, '', 'ショック', 'shock, choáng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3800, 57, '', 'ストレス', 'căng thẳng, stress', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3801, 57, '', 'バランス', 'cân bằng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3802, 57, '', 'レベル', 'trình độ, level', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3803, 57, '', 'アップ', 'tăng lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3804, 57, '', 'ダウン', 'giảm xuống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3805, 57, '', 'プラス', 'phép cộng, tác động tích cực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3806, 57, '', 'マイナス', 'phép trừ, tác động tiêu cực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3807, 57, '', 'イメージ', 'hình ảnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3808, 57, '', 'コンテスト', 'cuộc thi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3809, 57, '', 'マスコミ', 'thông tin truyền thông', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3810, 57, '', 'プライバシー', 'cá nhân, riêng tư', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3811, 57, '', 'オフィス', 'văn phòng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3812, 57, '', 'ルール', 'luật lệ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3813, 57, '', 'マナー', 'kiểu, thói', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3814, 57, '', 'ミス', 'lỗi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3815, 57, '', 'スケジュール', 'lịch, kế hoạch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3816, 57, '', 'タイトル', 'tiêu đề', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3817, 57, '', 'テーマ', 'chủ đề', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3818, 57, '', 'ストーリー', 'câu chuyện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3819, 57, '', 'ヒット', 'nổi tiếng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3820, 57, '', 'ブランド', 'nhãn hiệu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3821, 57, '', 'レンタル', 'thuê', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3822, 57, '', 'リサイクル', 'tái chế', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3823, 57, '', 'ラベル', 'nhãn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3824, 57, '', 'タイプ', 'loại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3825, 57, '', 'スタイル', 'kiểu dáng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3826, 57, '', 'セット', 'cài đặt, set', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3827, 57, '', 'ウイルス', 'virus', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3828, 57, '', 'ロボット', 'robot', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3829, 57, '', 'エネルギー', 'năng lượng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3830, 57, '', 'デジタル', 'kỹ thuật số', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3831, 57, '', 'マイク', 'microphone, ghi âm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3832, 57, '', 'ブレーキ', 'phanh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3833, 57, '', 'ペンキ', 'sơn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3834, 57, 'たける', '炊ける', 'được nấu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3835, 57, 'たく', '炊く', 'nấu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3836, 57, 'にえる', '煮える', 'được nấu, được ninh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3837, 57, 'にる', '煮る', 'nấu, ninh, luộc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3838, 57, 'いためる', '炒める', 'rán', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3839, 57, 'やける', '焼ける', 'được nấu, được nướng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3840, 58, 'やく', '焼く', 'nướng, nấu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3841, 58, 'ゆでる', 'ゆでる', 'luộc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3842, 58, 'あげる', '揚げる', 'rán ngập', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3843, 58, 'むす', '蒸す', 'hấp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3844, 58, 'ぐっすり', 'ぐっすり', 'say', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3845, 58, 'きちんと', 'きちんと', 'ngay ngắn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3846, 58, 'しっかり', 'しっかり', 'kiên quyết, chắc chắn, đáng tin cậy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3847, 58, 'はっきり', 'はっきり', 'rõ ràng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3848, 58, 'じっと', 'じっと', 'kiên nhẫn, chăm chú, chằm chằm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3849, 58, 'そっと', 'そっと', 'nhẹ nhàng, yên lặng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3850, 58, 'べつべつに', '別々に', 'riêng biệt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3851, 58, 'それぞれ', 'それぞれ', 'lần lượt, tương ứng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3852, 58, 'たがいに', '互いに', 'lẫn nhau', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3853, 58, 'ちょくせつ', '直接', 'trực tiếp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3854, 58, 'ほんとうに', '本当に', 'thật lòng, kỳ thực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3855, 58, 'かならず', '必ず', 'chắc chắn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3856, 58, 'ぜったいに', '絶対に', 'chắc chắn rồi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3857, 58, 'とくに', '特に', 'đặc biệt là', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3858, 58, 'ただ', 'ただ', 'chỉ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3859, 58, 'すくなくとも', '少なくとも', 'ít nhất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3860, 58, 'けっして', '決して', 'không bao giờ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3861, 58, 'すこしも', '少しも', 'một chút', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3862, 58, 'ちっとも', 'ちっとも', '(không) tí gì', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3863, 58, 'まったく', '全く', 'hoàn toàn (không)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3864, 58, 'とても', 'とても', 'rất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3865, 58, 'どんなに', 'どんなに', 'thế nào, bao nhiêu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3866, 58, 'どうしても', 'どうしても', 'kiểu gì cũng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3867, 58, 'まるで', 'まるで', 'như là', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3868, 58, 'いったい', '一体', 'cái quái gì', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3869, 58, 'べつに', '別に', '(không) có gì', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3870, 58, 'たった', 'たった', 'chỉ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3871, 58, 'ほんの', 'ほんの', 'một chút', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3872, 58, 'それで', 'それで', 'thế thì', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3873, 58, 'そこで', 'そこで', 'tiếp theo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3874, 58, 'そのうえ', 'そのうえ', 'hơn nữa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3875, 58, 'また', 'また', 'nữa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3876, 58, 'または', 'または', 'hoặc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3877, 58, 'それとも', 'それとも', 'hoặc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3878, 58, 'つまり', 'つまり', 'nói cách khác', 'None');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20000, 51, '1', 'Nghĩa từ Việt của từ 男性 là:', 'da', 'đàn ông', 'dựng lên', 'được tích tụ', 'đàn ông');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20001, 51, '1', 'Nghĩa từ Việt của từ 女性 là:', 'đóng gói', 'mọc', 'mạnh lên', 'phụ nữ', 'phụ nữ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20002, 51, '1', 'Nghĩa từ Việt của từ 高齢 là:', 'rõ ràng', 'được giao đến', 'cao tuổi', 'con dấu', 'cao tuổi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20003, 51, '1', 'Nghĩa từ Việt của từ 年上 là:', 'hơn tuổi', 'vỗ tay', 'cửa hàng tiện ích', 'suốt, nhiều', 'hơn tuổi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20004, 51, '1', 'Nghĩa từ Việt của từ 目上 là:', 'nhãn', 'thông tin truyền thông', 'xấu bụng', 'bề trên', 'bề trên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20005, 51, '1', 'Nghĩa từ Việt của từ 先輩 là:', 'tiền bối', 'bảnh bao', 'vây quanh', 'con dấu', 'tiền bối');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20006, 51, '1', 'Nghĩa từ Việt của từ 後輩 là:', 'hậu bối', 'nỗ lực', 'phép cộng, tác động tích cực', 'chính xác', 'hậu bối');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20007, 51, '1', 'Nghĩa từ Việt của từ 上司 là:', 'cấp trên', 'kiểu, thói', 'văn hóa', 'giết', 'cấp trên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20008, 51, '1', 'Nghĩa từ Việt của từ 相手 là:', 'tổ chức', 'nướng, nấu', 'người đối diện', 'thế thì', 'người đối diện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20009, 51, '1', 'Nghĩa từ Việt của từ 知り合い là:', 'người quen', 'chỉnh sửa', 'giao đến', 'mất điện', 'người quen');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20010, 51, '1', 'Nghĩa từ Việt của từ 友人 là:', 'đạt được, có được', 'ngại ngần', 'bạn bè', 'cao nhất', 'bạn bè');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20011, 51, '1', 'Nghĩa từ Việt của từ 仲 là:', 'đặc biệt', 'bị đánh', 'thấp nhất', 'mối quan hệ', 'mối quan hệ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20012, 51, '1', 'Nghĩa từ Việt của từ 生年月日 là:', 'ngày tháng năm sinh', 'nổi tiếng', 'nói chuyện riêng', 'mặt trời', 'ngày tháng năm sinh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20013, 51, '1', 'Nghĩa từ Việt của từ 誕生 là:', 'lỗi', 'đường tắt', 'giao đến', 'ra đời', 'ra đời');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20014, 51, '1', 'Nghĩa từ Việt của từ 年 là:', 'giao vào, lẫn vào', 'năm', 'dọn dẹp', 'phép cộng, tác động tích cực', 'năm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20015, 51, '1', 'Nghĩa từ Việt của từ 出身 là:', 'băn khoăn', 'bị nguội', 'so sánh', 'quê quán', 'quê quán');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20016, 51, '1', 'Nghĩa từ Việt của từ 故郷 là:', 'cố hương', 'kết quả', 'người được nói đến', 'đông đúc', 'cố hương');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20017, 51, '1', 'Nghĩa từ Việt của từ 成長 là:', 'trưởng thành', 'bất mãn', 'bị nguội', 'lỗ', 'trưởng thành');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20018, 51, '1', 'Nghĩa từ Việt của từ 成人 là:', 'phép trừ, tác động tiêu cực', 'quê quán', 'hớn hở', 'người trưởng thành', 'người trưởng thành');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20019, 51, '1', 'Nghĩa từ Việt của từ 合格 là:', 'đỗ đại học', 'tội phạm', 'bị thừa', 'đăng ký', 'đỗ đại học');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20020, 51, '1', 'Nghĩa từ Việt của từ 進学 là:', 'kết thúc', 'vào đại học', 'giá cả, vật giá', 'phát triển', 'vào đại học');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20021, 51, '1', 'Nghĩa từ Việt của từ 退学 là:', 'làm khô', 'bỏ học', 'dựng lên', 'lo lắng', 'bỏ học');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20022, 51, '1', 'Nghĩa từ Việt của từ 就職 là:', 'có việc làm', 'tài nguyên', 'mời, rủ', 'cấm', 'có việc làm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20023, 51, '1', 'Nghĩa từ Việt của từ 退職 là:', 'nghỉ việc', 'trạng thái', 'đi làm, học', 'chịu đựng giỏi', 'nghỉ việc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20024, 51, '1', 'Nghĩa từ Việt của từ 失業 là:', 'bị ướt', 'thất nghiệp', 'hòa bình', 'yên tâm', 'thất nghiệp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20025, 51, '1', 'Nghĩa từ Việt của từ 残業 là:', 'thông dịch', 'làm thêm', 'mất', 'thông dịch', 'làm thêm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20026, 51, '1', 'Nghĩa từ Việt của từ 生活 là:', 'cuộc sống', 'lại gần', 'rán ngập', 'trung bình', 'cuộc sống');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20027, 51, '1', 'Nghĩa từ Việt của từ 通勤 là:', 'kịp giờ', 'lật lên', 'đi làm', 'thiết kế', 'đi làm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20028, 51, '1', 'Nghĩa từ Việt của từ 学歴 là:', 'giảm xuống', 'bằng cấp', 'thuê', 'suốt đời', 'bằng cấp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20029, 51, '1', 'Nghĩa từ Việt của từ 給料 là:', 'bị giảm', 'tiền lương', 'yêu', 'về nhà', 'tiền lương');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20030, 51, '1', 'Nghĩa từ Việt của từ 面接 là:', 'phỏng vấn', 'xuất hiện, hiện ra', 'thay đổi', 'quan tâm, thông cảm', 'phỏng vấn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20031, 51, '1', 'Nghĩa từ Việt của từ 休憩 là:', 'nghỉ ngơi', 'cố hương', 'thiếu', 'hớn hở', 'nghỉ ngơi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20032, 51, '1', 'Nghĩa từ Việt của từ 観光 là:', 'tham quan', 'thông qua, được chấp nhận, đi qua', 'thông tin', 'quấn, quàng', 'tham quan');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20033, 51, '1', 'Nghĩa từ Việt của từ 帰国 là:', 'về nước', 'làm bẩn', 'trở về, trả lại', 'đoàn thể', 'về nước');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20034, 51, '1', 'Nghĩa từ Việt của từ 帰省 là:', 'bị ướt', 'về quê', 'loại', 'tăng giá', 'về quê');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20035, 51, '1', 'Nghĩa từ Việt của từ 帰宅 là:', 'tổ chức', 'tiến bộ', 'đánh thức', 'về nhà', 'về nhà');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20036, 51, '1', 'Nghĩa từ Việt của từ 参加 là:', 'ăn liền', 'xé rách', 'tham gia', 'giới thiệu, gợi ý', 'tham gia');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20037, 51, '1', 'Nghĩa từ Việt của từ 出席 là:', 'ghê, siêu', 'có mặt', 'bọc', 'ghê, siêu', 'có mặt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20038, 51, '1', 'Nghĩa từ Việt của từ 欠席 là:', 'rất', 'tai nạn', 'tình nguyện', 'vắng mặt', 'vắng mặt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20039, 51, '1', 'Nghĩa từ Việt của từ 遅刻 là:', 'kiên nhẫn, chăm chú, chằm chằm', 'so sánh', 'thiết kế', 'đến muộn', 'đến muộn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20040, 51, '1', 'Nghĩa từ Việt của từ 化粧 là:', 'tươi', 'sản phẩm', 'dự phòng', 'trang điểm', 'trang điểm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20041, 51, '1', 'Nghĩa từ Việt của từ 計算 là:', 'top', 'tính toán', 'thiết kế', 'tăng lên', 'tính toán');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20042, 51, '1', 'Nghĩa từ Việt của từ 計画 là:', 'suốt đời', 'hiểu nhầm', 'kế hoạch', 'cuối cùng', 'kế hoạch');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20043, 51, '1', 'Nghĩa từ Việt của từ 成功 là:', 'thành công', 'tai nạn', 'thịnh vượng', 'tóm, chộp', 'thành công');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20044, 51, '1', 'Nghĩa từ Việt của từ 失敗 là:', 'trình độ, level', 'sản phẩm', 'thất bại', 'cố hương', 'thất bại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20045, 51, '1', 'Nghĩa từ Việt của từ 準備 là:', 'thực tế là', 'chuẩn bị', 'bị tràn', 'hớn hở', 'chuẩn bị');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20046, 51, '1', 'Nghĩa từ Việt của từ 整理 là:', 'bề trên', 'về nước', 'người trưởng thành', 'chỉnh sửa', 'chỉnh sửa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20047, 51, '1', 'Nghĩa từ Việt của từ 注文 là:', 'mọc', 'cho bay', 'đặt hàng', 'xé rách', 'đặt hàng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20048, 51, '1', 'Nghĩa từ Việt của từ 貯金 là:', 'cao nhất', 'cháy', 'tiết kiệm', 'hiểu nhầm', 'tiết kiệm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20049, 51, '1', 'Nghĩa từ Việt của từ 徹夜 là:', 'thông báo', 'thức xuyên đêm', 'loại', 'trình độ, level', 'thức xuyên đêm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20050, 51, '1', 'Nghĩa từ Việt của từ 引っ越し là:', 'tắc đường', 'vào đại học', 'chuyển nhà', 'nỗ lực', 'chuyển nhà');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20051, 51, '1', 'Nghĩa từ Việt của từ 身長 là:', 'tránh xa', 'shock, choáng', 'cấp trên', 'chiều cao', 'chiều cao');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20052, 51, '1', 'Nghĩa từ Việt của từ 体重 là:', 'cân nặng', 'phát kiến', 'tình nguyện', 'thói quen', 'cân nặng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20053, 51, '1', 'Nghĩa từ Việt của từ けが là:', 'đoàn thể', 'khởi đầu', 'mất', 'vết thương', 'vết thương');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20054, 51, '1', 'Nghĩa từ Việt của từ 会 là:', 'hội, tiệc', 'da', 'nắm chặt', 'con dấu', 'hội, tiệc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20055, 51, '1', 'Nghĩa từ Việt của từ 趣味 là:', 'bị gãy', 'giao đến', 'sở thích', 'kết quả', 'sở thích');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20056, 51, '1', 'Nghĩa từ Việt của từ 興味 là:', 'suốt đời', 'hứng thú', 'nhãn hiệu', 'làm tăng lên', 'hứng thú');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20057, 51, '1', 'Nghĩa từ Việt của từ 思い出 là:', 'nhớ lại', 'chán', 'bị giảm', 'yên tâm', 'nhớ lại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20058, 51, '1', 'Nghĩa từ Việt của từ 冗談 là:', 'kịp giờ', 'bị gãy', 'tiếp tục, xảy ra, lặp lại, theo sau', 'đùa cợt', 'đùa cợt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20059, 51, '1', 'Nghĩa từ Việt của từ 目的 là:', 'gửi', 'giống', 'mục đích', 'kết thúc', 'mục đích');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20060, 51, '1', 'Nghĩa từ Việt của từ 約束 là:', 'tươi', 'lời hứa', 'mạnh, giỏi', 'dựng lên', 'lời hứa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20061, 51, '1', 'Nghĩa từ Việt của từ おしゃべり là:', 'vỗ tay', 'nói chuyện riêng', 'hớn hở', 'đăng ký, ứng tuyển', 'nói chuyện riêng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20062, 51, '1', 'Nghĩa từ Việt của từ 遠慮 là:', 'ngại ngần', 'tôn giáo', 'hớn hở', 'nhiều', 'ngại ngần');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20063, 51, '1', 'Nghĩa từ Việt của từ 我慢 là:', 'nội dung', 'cháy', 'chịu đựng', 'cao nhất', 'chịu đựng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20064, 51, '1', 'Nghĩa từ Việt của từ 目枠 là:', 'sạch', 'quan tâm, thông cảm', 'làm phiền', 'kiểu, thói', 'làm phiền');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20065, 51, '1', 'Nghĩa từ Việt của từ 希望 là:', 'phép cộng, tác động tích cực', 'hi vọng', 'thuê', 'mời, rủ', 'hi vọng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20066, 51, '1', 'Nghĩa từ Việt của từ 夢 là:', 'giấc mơ', 'bầu cử', 'làm vỡ', 'giải quyết', 'giấc mơ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20067, 51, '1', 'Nghĩa từ Việt của từ 賛成 là:', 'đàn ông', 'hòa bình', 'thay đổi', 'đồng ý', 'đồng ý');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20068, 51, '1', 'Nghĩa từ Việt của từ 反対 là:', 'tin tức, thông báo', 'thần bí', 'trạng thái', 'đối lập', 'đối lập');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20069, 51, '1', 'Nghĩa từ Việt của từ 創造 là:', 'tưởng tượng', 'tiến lên', 'được tiết kiệm', 'làm thay đổi', 'tưởng tượng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20070, 51, '1', 'Nghĩa từ Việt của từ 努力 là:', 'giống', 'nỗ lực', 'giá cả, vật giá', 'lặp lại', 'nỗ lực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20071, 51, '1', 'Nghĩa từ Việt của từ 太陽 là:', 'làm tăng lên', 'làm giảm xuống', 'hơn nữa', 'mặt trời', 'mặt trời');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20072, 51, '1', 'Nghĩa từ Việt của từ 地球 là:', 'sống', 'đâm', 'da', 'trái đất', 'trái đất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20073, 51, '1', 'Nghĩa từ Việt của từ 温度 là:', 'nhiệt độ', 'phát kiến', 'thông tin', 'suốt đời', 'nhiệt độ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20074, 51, '1', 'Nghĩa từ Việt của từ 湿度 là:', 'hỏng', 'độ ẩm', 'tham quan', 'mang đến gần', 'độ ẩm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20075, 51, '1', 'Nghĩa từ Việt của từ 湿気 là:', 'được giao đến', 'hơi ẩm', 'kế hoạch', 'yên tâm', 'hơi ẩm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20076, 51, '1', 'Nghĩa từ Việt của từ 梅雨 là:', 'làm phiền', 'đùa cợt', 'mùa mưa', 'cảm thấy', 'mùa mưa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20077, 51, '1', 'Nghĩa từ Việt của từ かび là:', 'được giao đến', 'lãnh đạo', 'nấm mốc', 'xấu bụng', 'nấm mốc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20078, 51, '1', 'Nghĩa từ Việt của từ 暖房 là:', 'cấm', 'ngạc nhiên', 'được quyết định', 'điều hòa ấm', 'điều hòa ấm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20079, 51, '1', 'Nghĩa từ Việt của từ 皮 là:', 'da', 'lo lắng', 'trầm lặng', 'ngủ', 'da');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20080, 51, '1', 'Nghĩa từ Việt của từ 館 là:', 'tắc đường', 'can', 'tiết kiệm', 'tiêu dùng, tiêu thụ', 'can');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20081, 51, '1', 'Nghĩa từ Việt của từ 画面 là:', 'thông tin', 'nhất định', 'nghệ thuật', 'màn hình', 'màn hình');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20082, 51, '1', 'Nghĩa từ Việt của từ 番組 là:', 'được sử dụng', 'trạng thái', 'suy nghĩ, cảm giác', 'chương trình', 'chương trình');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20083, 51, '1', 'Nghĩa từ Việt của từ 記事 là:', 'đủ', 'giao đến', 'ký sự', 'tuyên truyền', 'ký sự');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20084, 51, '1', 'Nghĩa từ Việt của từ 近所 là:', 'đăng ký', 'mũ bảo hiểm', 'có thể, được xây dựng', 'xung quanh', 'xung quanh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20085, 51, '1', 'Nghĩa từ Việt của từ 警察 là:', 'vượt qua', 'cảnh sát', 'lo lắng', 'tráng miệng', 'cảnh sát');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20086, 51, '1', 'Nghĩa từ Việt của từ 犯人 là:', 'giao tiếp', 'tội phạm', 'làm cho tiến lên', 'vỗ tay', 'tội phạm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20087, 51, '1', 'Nghĩa từ Việt của từ 小銭 là:', 'mối quan hệ', 'tiền lẻ', 'biểu thị, biểu lộ, đại diện', 'phương đông', 'tiền lẻ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20088, 51, '1', 'Nghĩa từ Việt của từ ごちそう là:', 'nổi tiếng', 'vô lý', 'bị sai', 'chiêu đãi', 'chiêu đãi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20089, 51, '1', 'Nghĩa từ Việt của từ 作者 là:', 'tràn', 'tai nạn', 'tác giả', 'thay đổi', 'tác giả');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20090, 51, '1', 'Nghĩa từ Việt của từ 作品 là:', 'thông tin truyền thông', 'tác phẩm', 'xuyên qua, thông qua', 'tiết kiệm', 'tác phẩm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20091, 51, '1', 'Nghĩa từ Việt của từ 制服 là:', 'hiểu nhầm', 'lòe loẹt', 'cơ bản', 'đồng phục', 'đồng phục');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20092, 51, '1', 'Nghĩa từ Việt của từ 洗剤 là:', 'kiên quyết, chắc chắn, đáng tin cậy', 'bỏ học', 'sống', 'bột giặt', 'bột giặt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20093, 51, '1', 'Nghĩa từ Việt của từ 底 là:', 'kịp giờ', 'người đối diện', 'bay', 'đáy', 'đáy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20094, 51, '1', 'Nghĩa từ Việt của từ 地下 là:', 'kiểu gì cũng', 'giống', 'ngầm', '(mặt trời) chiếu sáng, mở (ô), nhỏ (thuốc mắt)', 'ngầm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20095, 51, '1', 'Nghĩa từ Việt của từ 寺 là:', 'xuất hiện, được thẻ hiện', 'hậu bối', 'thiếu', 'chùa', 'chùa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20096, 51, '1', 'Nghĩa từ Việt của từ 道路 là:', 'rõ ràng', 'đặc biệt', 'đường', 'trạng thái', 'đường');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20097, 51, '1', 'Nghĩa từ Việt của từ 坂 là:', 'tiền bối', 'dốc', 'đổ', 'lòe loẹt', 'dốc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20098, 51, '1', 'Nghĩa từ Việt của từ 煙 là:', 'tin tức, thông báo', 'khói', 'hết', 'tiết kiệm', 'khói');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20099, 51, '1', 'Nghĩa từ Việt của từ 灰 là:', '(không) tí gì', 'tàn', 'bất an', 'hoạt động', 'tàn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20100, 51, '1', 'Nghĩa từ Việt của từ 判 là:', 'con dấu', 'bắt', 'đường tắt', 'bị gãy', 'con dấu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20101, 51, '1', 'Nghĩa từ Việt của từ 名刺 là:', 'danh thiếp', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'không bao giờ', 'tráng miệng', 'danh thiếp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20102, 51, '1', 'Nghĩa từ Việt của từ 免許 là:', 'giấy phép', 'cao lên', 'trung bình', 'trở nên ấm hơn', 'giấy phép');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20103, 51, '1', 'Nghĩa từ Việt của từ 多く là:', 'thế nào, bao nhiêu', 'loáng một cái', 'thuê', 'nhiều', 'nhiều');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20104, 51, '1', 'Nghĩa từ Việt của từ 前半 là:', 'mang đến gần', 'quốc tịch', 'phần đầu', 'vô lý', 'phần đầu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20105, 51, '1', 'Nghĩa từ Việt của từ 後半 là:', 'thói quen', 'phần cuối', 'tiền bối', 'che giấu', 'phần cuối');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20106, 51, '1', 'Nghĩa từ Việt của từ 最高 là:', 'cao nhất', 'rất', 'nổi tiếng', 'bên trong', 'cao nhất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20107, 51, '1', 'Nghĩa từ Việt của từ 最低 là:', 'nhãn', 'làm khô', 'thấp nhất', 'kiên nhẫn, chăm chú, chằm chằm', 'thấp nhất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20108, 51, '1', 'Nghĩa từ Việt của từ 最初 là:', 'hiểu, thông qua', 'giảm xuống', 'đầu tiên', 'làm bẩn', 'đầu tiên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20109, 51, '1', 'Nghĩa từ Việt của từ 最後 là:', 'cuối cùng', 'hớn hở', 'được sử dụng', 'gặp', 'cuối cùng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20110, 51, '1', 'Nghĩa từ Việt của từ 自動 là:', 'tự động', 'đùa cợt', 'thiết kế', 'vừa vặn, đúng', 'tự động');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20111, 51, '1', 'Nghĩa từ Việt của từ 種類 là:', 'loại', 'xung quanh', 'ẩn náu, trốn', 'ẩn náu, trốn', 'loại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20112, 51, '1', 'Nghĩa từ Việt của từ 性格 là:', 'nhiều', 'bị thừa', 'tươi', 'tính cách', 'tính cách');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20113, 51, '1', 'Nghĩa từ Việt của từ 性質 là:', 'thiếu', 'tính chất', 'xung quanh, vòng quanh', 'dũng cảm, dũng khí', 'tính chất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20114, 51, '1', 'Nghĩa từ Việt của từ 順番 là:', 'thứ tự', 'truyền đi, giới thiệu', 'tăng giá', 'về quê', 'thứ tự');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20115, 51, '1', 'Nghĩa từ Việt của từ 番 là:', 'thói quen', 'lượt', 'trưởng thành', 'trái đất', 'lượt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20116, 51, '1', 'Nghĩa từ Việt của từ 方法 là:', 'không bao giờ', 'phương pháp', 'xấu bụng', 'tiền bối', 'phương pháp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20117, 51, '1', 'Nghĩa từ Việt của từ 製品 là:', 'cầu, khấn', 'đóng gói', 'sản phẩm', 'hiện tại', 'sản phẩm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20118, 51, '1', 'Nghĩa từ Việt của từ 値上がり là:', 'tăng giá', 'lễ nghĩa', 'ngại ngần', 'chiêu đãi', 'tăng giá');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20119, 51, '1', 'Nghĩa từ Việt của từ 生 là:', 'tách ra', 'xấu bụng', 'sự kiện', 'tươi', 'tươi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20120, 52, '1', 'Nghĩa từ Việt của từ 渇く là:', 'hối hận', 'có lẽ', 'khát', 'dđóng', 'khát');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20121, 52, '1', 'Nghĩa từ Việt của từ 嗅ぐ là:', 'ngửi', 'trung bình', 'kết quả', 'đạt được, có được', 'ngửi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20122, 52, '1', 'Nghĩa từ Việt của từ 叩く là:', 'giao tiếp', 'đánh, vỗ', 'tiền bối', 'giá cả, vật giá', 'đánh, vỗ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20123, 52, '1', 'Nghĩa từ Việt của từ 殴る là:', 'cầu, khấn', 'kiểu, thói', 'bên trong', 'đấm', 'đấm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20124, 52, '1', 'Nghĩa từ Việt của từ ける là:', 'yêu cầu', 'hiểu nhầm', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'đá', 'đá');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20125, 52, '1', 'Nghĩa từ Việt của từ 抱く là:', 'hiểu, thông qua', 'nổi tiếng', 'gián đoạn', 'ôm', 'ôm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20126, 52, '1', 'Nghĩa từ Việt của từ 倒れる là:', 'đổ', 'rõ ràng', 'hồi phục', 'vừa, được công bố', 'đổ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20127, 52, '1', 'Nghĩa từ Việt của từ 倒す là:', 'làm đổ', 'thuê', 'bắt tay', 'quen', 'làm đổ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20128, 52, '1', 'Nghĩa từ Việt của từ 起きる là:', 'đại thể, thường', 'thức dậy', 'kiểu, thói', 'đánh thức', 'thức dậy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20129, 52, '1', 'Nghĩa từ Việt của từ 起こす là:', 'đánh thức', 'được bao phủ', 'về quê', 'nổi tiếng', 'đánh thức');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20130, 52, '1', 'Nghĩa từ Việt của từ 尋ねる là:', 'tiến lên', 'tóm, chộp', 'đổ', 'hỏi', 'hỏi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20131, 52, '1', 'Nghĩa từ Việt của từ 呼ぶ là:', 'gọi', 'tắc đường', 'yếu đi', 'chỉnh sửa', 'gọi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20132, 52, '1', 'Nghĩa từ Việt của từ 叫ぶ là:', 'bị ướt', 'gào to', 'không bao giờ', 'đông đúc', 'gào to');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20133, 52, '1', 'Nghĩa từ Việt của từ 黙る là:', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'im lặng', 'thực hành', 'tôn giáo', 'im lặng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20134, 52, '1', 'Nghĩa từ Việt của từ 飼う là:', 'nổi tiếng', 'nuôi', 'kết thúc', 'cố hương', 'nuôi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20135, 52, '1', 'Nghĩa từ Việt của từ 数える là:', 'đếm', 'tiêu dùng, tiêu thụ', 'cháy', 'sản phẩm', 'đếm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20136, 52, '1', 'Nghĩa từ Việt của từ 乾く là:', 'lo lắng', 'khô', 'đăng ký', 'phương đông', 'khô');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20137, 52, '1', 'Nghĩa từ Việt của từ 乾かす là:', 'được chia ra', 'làm khô', 'thói quen', 'bị thừa', 'làm khô');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20138, 52, '1', 'Nghĩa từ Việt của từ 畳む là:', 'giữ', 'mang đến gần', 'gấp', 'gọi', 'gấp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20139, 52, '1', 'Nghĩa từ Việt của từ 誘う là:', 'mời, rủ', 'cấm', 'xấu bụng', 'nhóm', 'mời, rủ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20140, 52, '1', 'Nghĩa từ Việt của từ おごる là:', 'chiêu đãi', 'làm yếu đi', 'bảo vệ', 'loại', 'chiêu đãi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20141, 52, '1', 'Nghĩa từ Việt của từ 預かる là:', 'trưởng thành', 'cần thiết', 'hậu bối', 'chăm sóc', 'chăm sóc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20142, 52, '1', 'Nghĩa từ Việt của từ 預ける là:', 'điều hòa ấm', 'mất', 'sôi', 'gửi', 'gửi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20143, 52, '1', 'Nghĩa từ Việt của từ 決まる là:', 'có hiệu quả', 'được quyết định', 'có lẽ', 'chủ yếu, khá', 'được quyết định');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20144, 52, '1', 'Nghĩa từ Việt của từ 決める là:', 'bỏ học', 'quyết định', 'không bao giờ', 'hiểu, thông qua', 'quyết định');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20145, 52, '1', 'Nghĩa từ Việt của từ 写る là:', 'luật lệ', 'vừa, được công bố', 'chụp được', 'tiết kiệm', 'chụp được');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20146, 52, '1', 'Nghĩa từ Việt của từ 写す là:', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'chụp', 'danh thiếp', 'không bao giờ', 'chụp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20147, 52, '1', 'Nghĩa từ Việt của từ 思い出す là:', 'vượt, lướt', 'nhớ lại', 'vô lý', 'lừa', 'nhớ lại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20148, 52, '1', 'Nghĩa từ Việt của từ 教わる là:', 'loại', 'được dạy', 'nhớ lại', 'hiểu, thông qua', 'được dạy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20149, 52, '1', 'Nghĩa từ Việt của từ 申し込む là:', 'ngủ', 'tai nạn', 'lừa', 'đăng ký', 'đăng ký');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20150, 52, '1', 'Nghĩa từ Việt của từ 断る là:', 'thế thì', 'từ chối', 'quan hệ', 'được bao phủ', 'từ chối');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20151, 52, '1', 'Nghĩa từ Việt của từ 見つかる là:', 'rõ ràng', 'ngạc nhiên', 'tránh xa', 'được tìm thấy', 'được tìm thấy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20152, 52, '1', 'Nghĩa từ Việt của từ 見つける là:', 'tìm thấy', 'cửa hàng tiện ích', 'làm tăng lên', 'ngoại lệ', 'tìm thấy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20153, 52, '1', 'Nghĩa từ Việt của từ 捕まる là:', 'sung sướng', 'bị bắt', 'loại', 'nướng, nấu', 'bị bắt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20154, 52, '1', 'Nghĩa từ Việt của từ 捕まえる là:', 'kiểu gì cũng', 'bắt', 'tiếp tục, xảy ra, lặp lại, theo sau', 'đề xuất', 'bắt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20155, 52, '1', 'Nghĩa từ Việt của từ 乗る là:', 'nhất định', 'nhảy', 'cảm thấy', 'leo lên', 'leo lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20156, 52, '1', 'Nghĩa từ Việt của từ 乗せる là:', 'vừa, được công bố', 'yêu cầu', 'cho lên', 'quốc tịch', 'cho lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20157, 52, '1', 'Nghĩa từ Việt của từ 降りる là:', 'kinh doanh, buôn bán', 'xuống', 'phương đông', 'mạnh lên', 'xuống');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20158, 52, '1', 'Nghĩa từ Việt của từ 降ろす là:', 'cho xuống', 'khát', 'đồng phục', 'phát minh', 'cho xuống');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20159, 52, '1', 'Nghĩa từ Việt của từ 直る là:', 'đăng ký, ứng tuyển', 'da', 'được sửa', 'bao gồm', 'được sửa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20160, 52, '1', 'Nghĩa từ Việt của từ 直す là:', 'tốt, đủ', 'sửa', 'top', 'gián đoạn', 'sửa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20161, 52, '1', 'Nghĩa từ Việt của từ 治る là:', 'top', 'suy nghĩ, cảm giác', 'hồi phục', 'quê quán', 'hồi phục');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20162, 52, '1', 'Nghĩa từ Việt của từ 治す là:', 'microphone, ghi âm', 'cứu chữa', 'giá cả, vật giá', 'bầu cử', 'cứu chữa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20163, 52, '1', 'Nghĩa từ Việt của từ 亡くなる là:', 'hàng', 'sôi', 'chết', 'giá cả, vật giá', 'chết');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20164, 52, '1', 'Nghĩa từ Việt của từ 亡くす là:', 'tự tin', 'giảm', 'thế nào, bao nhiêu', 'mất', 'mất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20165, 52, '1', 'Nghĩa từ Việt của từ 生まれる là:', 'tuyên truyền', 'trình độ, level', 'toàn bộ', 'được sinh ra', 'được sinh ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20166, 52, '1', 'Nghĩa từ Việt của từ 生む là:', 'sinh', 'được nấu, được nướng', 'so sánh', 'làm khô', 'sinh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20167, 52, '1', 'Nghĩa từ Việt của từ 出会う là:', 'gặp (ngẫu nhiên)', 'được xây', 'tôn giáo', 'thịnh vượng', 'gặp (ngẫu nhiên)');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20168, 52, '1', 'Nghĩa từ Việt của từ 訪ねる là:', 'bỏ học', 'thăm', 'ngủ', 'thói quen', 'thăm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20169, 52, '1', 'Nghĩa từ Việt của từ 付き合う là:', 'mọc', 'cảm động', 'hẹn hò, giao tiếp', 'tự động', 'hẹn hò, giao tiếp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20170, 52, '1', 'Nghĩa từ Việt của từ 効く là:', 'tốt lên', 'vỗ tay', 'thông tin', 'có hiệu quả', 'có hiệu quả');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20171, 52, '1', 'Nghĩa từ Việt của từ はやる là:', 'phổ biến', 'sạch', 'bắt', 'quê quán', 'phổ biến');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20172, 52, '1', 'Nghĩa từ Việt của từ 経つ là:', 'qua', 'làm vỡ', 'bất an', 'chủ đề', 'qua');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20173, 52, '1', 'Nghĩa từ Việt của từ 間に合う là:', 'đàn ông', 'cay cú', 'phỏng vấn', 'làm cho kịp giờ', 'làm cho kịp giờ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20174, 52, '1', 'Nghĩa từ Việt của từ 間に合わせる là:', 'bảo vệ', 'khẩn cấp, vội', 'kịp giờ', 'nghỉ việc', 'kịp giờ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20175, 52, '1', 'Nghĩa từ Việt của từ 通う là:', 'cho vào, cho lên, công bố', 'bị chôn', 'đi làm, học', 'trình độ, level', 'đi làm, học');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20176, 52, '1', 'Nghĩa từ Việt của từ 込む là:', 'đông', 'bị giảm', 'bị thừa', 'nuôi(râu)', 'đông');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20177, 52, '1', 'Nghĩa từ Việt của từ すれ違う là:', 'tai nạn', 'giàu có', 'truyền đi, giới thiệu', 'vượt, lướt', 'vượt, lướt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20178, 52, '1', 'Nghĩa từ Việt của từ 掛かる là:', 'thiết kế', 'được bao phủ', 'đường tắt', 'nhóm', 'được bao phủ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20179, 52, '1', 'Nghĩa từ Việt của từ 掛ける là:', 'bao phủ', 'hơi ẩm', 'đàn ông', 'nhãn', 'bao phủ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20180, 52, '1', 'Nghĩa từ Việt của từ 動く là:', 'văn hóa', 'đủ', 'hoạt động', 'đầy', 'hoạt động');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20181, 52, '1', 'Nghĩa từ Việt của từ 動かす là:', 'di chuyển', 'thiệt hại', 'say', 'giới thiệu, gợi ý', 'di chuyển');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20182, 52, '1', 'Nghĩa từ Việt của từ 離れる là:', 'dựng lên', 'tăng giá', 'tuyên truyền', 'tránh xa', 'tránh xa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20183, 52, '1', 'Nghĩa từ Việt của từ 離す là:', 'quấn, quàng', 'da', 'đại thể, thường', 'tách ra', 'tách ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20184, 52, '1', 'Nghĩa từ Việt của từ ぶつかる là:', 'thực hành', 'bị đâm', 'ghê, siêu', 'nữa', 'bị đâm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20185, 52, '1', 'Nghĩa từ Việt của từ ぶつける là:', 'cửa hàng tiện ích', 'tiết kiệm', 'đâm', 'sự kiện', 'đâm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20186, 52, '1', 'Nghĩa từ Việt của từ こぼれる là:', 'mượn', 'vào đại học', 'bị tràn', 'tăng giá', 'bị tràn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20187, 52, '1', 'Nghĩa từ Việt của từ こぼす là:', 'tràn', 'ngại ngần', 'hoàn thành', 'quen', 'tràn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20188, 52, '1', 'Nghĩa từ Việt của từ ふく là:', 'về nhà', 'lau', 'khẩn cấp, vội', 'thịnh vượng', 'lau');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20189, 52, '1', 'Nghĩa từ Việt của từ 片付く là:', 'truyền đi, giới thiệu', 'tránh xa', 'nuôi(râu)', 'được dọn dẹp', 'được dọn dẹp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20190, 52, '1', 'Nghĩa từ Việt của từ 片付ける là:', 'cho xuống', 'truyền đi, giới thiệu', 'dọn dẹp', 'kiên nhẫn, chăm chú, chằm chằm', 'dọn dẹp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20191, 52, '1', 'Nghĩa từ Việt của từ 包む là:', 'nghỉ việc', 'lần lượt, tương ứng', 'bọc', 'bị đâm', 'bọc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20192, 52, '1', 'Nghĩa từ Việt của từ 張る là:', 'dán', 'giàu có', 'thiệt hại', 'che giấu', 'dán');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20193, 52, '1', 'Nghĩa từ Việt của từ 無くなる là:', 'bị đâm', 'bị mất', 'giúp đỡ', 'nghỉ việc', 'bị mất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20194, 52, '1', 'Nghĩa từ Việt của từ 無くす là:', 'nhãn', 'quê quán', 'sau cùng, cuối cùng, sau tất cả', 'mất', 'mất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20195, 52, '1', 'Nghĩa từ Việt của từ 足りる là:', 'được trả lại', 'về nhà', 'đủ', 'làm giảm xuống', 'đủ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20196, 52, '1', 'Nghĩa từ Việt của từ 残る là:', 'dũng cảm, dũng khí', 'bị thừa', 'nổi tiếng', 'giúp đỡ', 'bị thừa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20197, 52, '1', 'Nghĩa từ Việt của từ 残す là:', 'thừa', 'cao lên', 'tình nguyện', 'đùa cợt', 'thừa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20198, 52, '1', 'Nghĩa từ Việt của từ 腐る là:', 'đại thể, thường', 'tính chất', 'tự tin', 'thối', 'thối');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20199, 52, '1', 'Nghĩa từ Việt của từ むける là:', 'bị lột', 'tờ rơi', 'bầu cử', 'tự tin', 'bị lột');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20200, 52, '1', 'Nghĩa từ Việt của từ むく là:', 'vết thương', 'tự kiểm tra', 'lột', 'nỗ lực', 'lột');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20201, 52, '1', 'Nghĩa từ Việt của từ 滑る là:', 'trượt', 'mở rộng, bùng phát, lan tràn, trải dài', 'thực hành', 'sự kiện', 'trượt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20202, 52, '1', 'Nghĩa từ Việt của từ 積もる là:', 'được tích tụ', 'đông đúc', 'điều tra', 'tin đồn', 'được tích tụ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20203, 52, '1', 'Nghĩa từ Việt của từ 積む là:', 'bầu cử', 'bị trì hoãn, bị kéo dài', 'luật lệ', 'tích tụ, chất lại', 'tích tụ, chất lại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20204, 52, '1', 'Nghĩa từ Việt của từ 空く là:', 'nhảy', 'ngơ ngác, không để ý', 'bị thủng', 'được giao đến', 'bị thủng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20205, 52, '1', 'Nghĩa từ Việt của từ 空ける là:', 'thủng', 'được tìm thấy', 'gào to', 'giao vào, lẫn vào', 'thủng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20206, 52, '1', 'Nghĩa từ Việt của từ 下がる là:', 'cầu, khấn', 'bị giảm', 'nhất định', 'giao vào, lẫn vào', 'bị giảm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20207, 52, '1', 'Nghĩa từ Việt của từ 下げる là:', 'đối lập', 'giảm', 'chỉnh sửa', 'làm thêm', 'giảm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20208, 52, '1', 'Nghĩa từ Việt của từ 冷える là:', 'bị lạnh', 'nhớ lại', 'nội dung', 'tiết kiệm', 'bị lạnh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20209, 52, '1', 'Nghĩa từ Việt của từ 冷やす là:', 'làm lạnh', 'lo lắng', 'trình độ, level', 'thăm', 'làm lạnh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20210, 52, '1', 'Nghĩa từ Việt của từ 冷める là:', 'cho mượn', 'bị nguội', 'rủ, mời, gợi ý', 'hòa bình', 'bị nguội');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20211, 52, '1', 'Nghĩa từ Việt của từ 冷ます là:', 'thành phố', 'điều hòa ấm', 'làm nguội', 'giá cả, vật giá', 'làm nguội');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20212, 52, '1', 'Nghĩa từ Việt của từ 燃える là:', 'cháy', 'hạnh phúc', 'danh thiếp', 'điều hòa ấm', 'cháy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20213, 52, '1', 'Nghĩa từ Việt của từ 燃やす là:', 'tính chất', 'đốt', 'biểu hiện (trên mặt)', 'trưởng thành', 'đốt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20214, 52, '1', 'Nghĩa từ Việt của từ 沸く là:', 'bị chôn', 'sôi', 'thoải mái', 'khởi đầu', 'sôi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20215, 52, '1', 'Nghĩa từ Việt của từ 沸かす là:', 'danh thiếp', 'thế kỷ', 'đun sôi', 'tóm, chộp', 'đun sôi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20216, 52, '1', 'Nghĩa từ Việt của từ 鳴る là:', 'thành công', 'kêu', 'hiểu, thông qua', 'tiền bối', 'kêu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20217, 52, '1', 'Nghĩa từ Việt của từ 鳴らす là:', 'làm kêu', 'sản phẩm', 'làm hỏng', 'hớn hở', 'làm kêu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20218, 52, '1', 'Nghĩa từ Việt của từ 役立つ là:', 'gửi', 'mỏng, nhạt', 'giá cả, vật giá', 'hữu ích', 'hữu ích');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20219, 52, '1', 'Nghĩa từ Việt của từ 役立てる là:', 'thông tin truyền thông', 'điều hòa ấm', 'được sử dụng', 'chết', 'được sử dụng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20220, 52, '1', 'Nghĩa từ Việt của từ 飾り là:', 'người được nói đến', 'đối lập', 'trang trí', 'cảm thấy', 'trang trí');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20221, 52, '1', 'Nghĩa từ Việt của từ 遊び là:', 'loại', 'cao nhất', 'che giấu', 'chơi', 'chơi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20222, 52, '1', 'Nghĩa từ Việt của từ 集まり là:', 'giao tiếp', 'tập hợp', 'thất nghiệp', 'tài nguyên', 'tập hợp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20223, 52, '1', 'Nghĩa từ Việt của từ 教え là:', 'kiểu, thói', 'dạy', 'tìm thấy', 'suốt đời', 'dạy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20224, 52, '1', 'Nghĩa từ Việt của từ 踊り là:', 'tưởng tượng', 'da', 'nhảy', 'trình độ, level', 'nhảy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20225, 52, '1', 'Nghĩa từ Việt của từ 思い là:', 'làm bẩn', 'suy nghĩ, cảm giác', 'sửa', 'thông tin truyền thông', 'suy nghĩ, cảm giác');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20226, 52, '1', 'Nghĩa từ Việt của từ 考え là:', 'so sánh', 'nghĩ, ý tưởng', 'thông tin truyền thông', 'qua', 'nghĩ, ý tưởng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20227, 52, '1', 'Nghĩa từ Việt của từ 片づけ là:', 'bắt tay', 'trái cây', 'ngăn nắp', 'khủng khiếp, rất nhiều', 'ngăn nắp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20228, 52, '1', 'Nghĩa từ Việt của từ 手伝い là:', 'yêu cầu', 'giúp đỡ', 'nhất định', 'ghi lại', 'giúp đỡ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20229, 52, '1', 'Nghĩa từ Việt của từ 働き là:', 'hoạt động', 'da', 'tồi', 'làm vỡ', 'hoạt động');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20230, 52, '1', 'Nghĩa từ Việt của từ 決まり là:', 'làm nguội', 'luật lệ', 'truyền đi, giới thiệu', 'mất điện', 'luật lệ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20231, 52, '1', 'Nghĩa từ Việt của từ 騒ぎ là:', 'ồn ào, om xòm', 'yên tâm', 'nghỉ việc', 'kiểu, thói', 'ồn ào, om xòm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20232, 52, '1', 'Nghĩa từ Việt của từ 知らせ là:', 'tin tức, thông báo', 'bất an', 'đáy', 'đột nhiên', 'tin tức, thông báo');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20233, 52, '1', 'Nghĩa từ Việt của từ 頼み là:', 'hiểu nhầm', 'thịnh vượng', 'yêu cầu', 'bảnh bao', 'yêu cầu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20234, 52, '1', 'Nghĩa từ Việt của từ 疲れ là:', 'thành công', 'tráng miệng', 'hồi phục', 'vất vả, mệt mỏi', 'vất vả, mệt mỏi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20235, 52, '1', 'Nghĩa từ Việt của từ 違い là:', 'chiêu đãi', 'bị thủng', 'bị giảm', 'khác biệt', 'khác biệt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20236, 52, '1', 'Nghĩa từ Việt của từ 始め là:', 'bị giảm', 'khởi đầu', 'về nhà', 'tự tin', 'khởi đầu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20237, 52, '1', 'Nghĩa từ Việt của từ 続き là:', 'bất an', 'mất điện', 'rất', 'tiếp tục', 'tiếp tục');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20238, 52, '1', 'Nghĩa từ Việt của từ 暮れ là:', 'cuối năm', 'sâu hơn', 'bị giảm', 'cao lên', 'cuối năm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20239, 52, '1', 'Nghĩa từ Việt của từ 行き là:', 'lạ', 'rung, vẫy', 'sự kiện', 'đi', 'đi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20240, 53, '1', 'Nghĩa từ Việt của từ 帰り là:', 'gián đoạn', 'thành công', 'trở về', 'tham dự', 'trở về');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20241, 53, '1', 'Nghĩa từ Việt của từ 急ぎ là:', 'chủ yếu, khá', 'làm hỏng', 'khẩn cấp, vội', 'ghé vào', 'khẩn cấp, vội');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20242, 53, '1', 'Nghĩa từ Việt của từ 遅れ là:', 'quốc tế', 'gián đoạn', 'sự kiện', 'da', 'gián đoạn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20243, 53, '1', 'Nghĩa từ Việt của từ 貸し là:', 'trung bình', 'cho mượn', 'buồn bã', 'chịu đựng giỏi', 'cho mượn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20244, 53, '1', 'Nghĩa từ Việt của từ 借り là:', 'mượn', 'thông tin truyền thông', 'thông tin truyền thông', 'dựng lên', 'mượn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20245, 53, '1', 'Nghĩa từ Việt của từ 勝ち là:', 'thắng', 'tươi', 'điều hòa ấm', 'làm khô', 'thắng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20246, 53, '1', 'Nghĩa từ Việt của từ 負け là:', 'hớn hở', 'lột', 'thua', 'tiến bộ', 'thua');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20247, 53, '1', 'Nghĩa từ Việt của từ 迎え là:', 'lo lắng', 'thiết kế', 'địa phương', 'đón', 'đón');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20248, 53, '1', 'Nghĩa từ Việt của từ 始まり là:', 'bắt đầu', 'tồi', 'bề trên', 'mọc', 'bắt đầu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20249, 53, '1', 'Nghĩa từ Việt của từ 終わり là:', 'khởi động', 'kết thúc', 'vết thương', 'hớn hở', 'kết thúc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20250, 53, '1', 'Nghĩa từ Việt của từ 戻り là:', 'nhãn', 'vây quanh', 'bầu cử', 'trở về, trả lại', 'trở về, trả lại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20251, 53, '1', 'Nghĩa từ Việt của từ 別れ là:', 'chia ly', 'người quen', 'bất mãn', 'bị bẩn', 'chia ly');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20252, 53, '1', 'Nghĩa từ Việt của từ 喜び là:', 'hớn hở', 'rán ngập', 'thông tin', 'thực tế là', 'hớn hở');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20253, 53, '1', 'Nghĩa từ Việt của từ 楽しみ là:', 'được dạy', 'dốc', 'đại biểu', 'sung sướng', 'sung sướng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20254, 53, '1', 'Nghĩa từ Việt của từ 笑い là:', 'con dấu', 'tăng lên', 'cười', 'đăng ký', 'cười');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20255, 53, '1', 'Nghĩa từ Việt của từ 驚き là:', 'ghê, siêu', 'đếm', 'mở rộng, bùng phát, lan tràn, trải dài', 'ngạc nhiên', 'ngạc nhiên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20256, 53, '1', 'Nghĩa từ Việt của từ 怒り là:', 'đội', 'giận dữ', 'ăn liền', 'kịp giờ', 'giận dữ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20257, 53, '1', 'Nghĩa từ Việt của từ 悲しみ là:', 'chịu đựng giỏi', 'hậu bối', 'chiêu đãi', 'buồn bã', 'buồn bã');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20258, 53, '1', 'Nghĩa từ Việt của từ 幸せな là:', 'hạnh phúc', 'truyền đi, giới thiệu', 'không bao giờ', 'giết', 'hạnh phúc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20259, 53, '1', 'Nghĩa từ Việt của từ 得意な là:', 'trình độ, level', 'mạnh, giỏi', 'làm phiền', 'hiểu nhầm', 'mạnh, giỏi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20260, 53, '1', 'Nghĩa từ Việt của từ 苦手な là:', 'lật lên', 'người được nói đến', 'yếu, kém', 'xung quanh, vòng quanh', 'yếu, kém');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20261, 53, '1', 'Nghĩa từ Việt của từ 熱心な là:', 'chăm chỉ', 'cổ vũ', 'làm khô', 'rủ, mời, gợi ý', 'chăm chỉ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20262, 53, '1', 'Nghĩa từ Việt của từ 夢中な là:', 'thức dậy', 'chú tâm', 'hỏng', 'lừa', 'chú tâm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20263, 53, '1', 'Nghĩa từ Việt của từ 退屈な là:', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'thông tin', 'chán', 'tính chất', 'chán');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20264, 53, '1', 'Nghĩa từ Việt của từ 健康な là:', 'bầu cử', 'mất', 'phát triển', 'khỏe khoắn', 'khỏe khoắn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20265, 53, '1', 'Nghĩa từ Việt của từ 苦しい là:', 'đóng gói', 'thông qua, được chấp nhận, đi qua', 'chắc chắn', 'cực khổ', 'cực khổ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20266, 53, '1', 'Nghĩa từ Việt của từ 平気な là:', 'bình thản', 'tắc đường', 'mỏng, nhạt', 'đường tắt', 'bình thản');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20267, 53, '1', 'Nghĩa từ Việt của từ 悔しい là:', 'tự động', 'cay cú', 'nhãn hiệu', 'giả', 'cay cú');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20268, 53, '1', 'Nghĩa từ Việt của từ うらやましい là:', 'mạnh lên', 'quốc tịch', 'ghen tỵ', 'kiên nhẫn, chăm chú, chằm chằm', 'ghen tỵ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20269, 53, '1', 'Nghĩa từ Việt của từ かゆい là:', 'trạng thái', 'ngứa', 'sơn', 'trang trí', 'ngứa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20270, 53, '1', 'Nghĩa từ Việt của từ おとなしい là:', 'trầm lặng', 'tiếp tục, xảy ra liên tiếp', 'xé rách', 'dựng lên', 'trầm lặng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20271, 53, '1', 'Nghĩa từ Việt của từ 我慢強い là:', 'giải quyết', 'cháy', 'được sinh ra', 'chịu đựng giỏi', 'chịu đựng giỏi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20272, 53, '1', 'Nghĩa từ Việt của từ 正直な là:', 'ám hiệu', 'thành công', 'kịp giờ', 'trung thực', 'trung thực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20273, 53, '1', 'Nghĩa từ Việt của từ けちな là:', 'đổi', 'kẹt xỉ', 'làm bẩn', 'phát kiến', 'kẹt xỉ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20274, 53, '1', 'Nghĩa từ Việt của từ 我儘な là:', 'đàn ông', 'chiều rộng', 'ích kỷ', 'trình độ, level', 'ích kỷ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20275, 53, '1', 'Nghĩa từ Việt của từ 積極的な là:', 'tránh xa', 'giới thiệu, gợi ý', 'tích cực', 'thông dịch', 'tích cực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20276, 53, '1', 'Nghĩa từ Việt của từ 消極的な là:', 'làm mạnh lên', 'người được nói đến', 'gọi', 'tiêu cực', 'tiêu cực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20277, 53, '1', 'Nghĩa từ Việt của từ 満足な là:', 'người được nói đến', 'giao vào, lẫn vào', 'thỏa mãn', 'mất điện', 'thỏa mãn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20278, 53, '1', 'Nghĩa từ Việt của từ 不満な là:', 'thực lực', 'bất mãn', 'thay đổi', 'lo lắng', 'bất mãn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20279, 53, '1', 'Nghĩa từ Việt của từ 不安な là:', 'bất an', 'tăng lên', 'hàng', 'nhất định', 'bất an');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20280, 53, '1', 'Nghĩa từ Việt của từ 大変な là:', 'bị sai', 'có lẽ', 'riêng biệt', 'tồi tệ', 'tồi tệ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20281, 53, '1', 'Nghĩa từ Việt của từ 無理な là:', 'da', 'không ngờ đến', 'vô lý', 'chiêu đãi', 'vô lý');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20282, 53, '1', 'Nghĩa từ Việt của từ 不注意な là:', 'nghiện', 'nổi tiếng', 'không chú ý', 'lớn lên, tăng thêm, dài ra', 'không chú ý');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20283, 53, '1', 'Nghĩa từ Việt của từ 楽な là:', 'cảm động', 'thoải mái', 'hoàn thành', 'nội dung', 'thoải mái');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20284, 53, '1', 'Nghĩa từ Việt của từ 面倒な là:', 'được bao phủ', 'tính chất', 'phiền phức', 'chủ yếu, khá', 'phiền phức');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20285, 53, '1', 'Nghĩa từ Việt của từ 失礼な là:', 'chính xác', 'thất lễ', 'cầu, khấn', 'sau cùng, cuối cùng, sau tất cả', 'thất lễ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20286, 53, '1', 'Nghĩa từ Việt của từ 当然な là:', 'vừa vặn, đúng', 'da', 'đương nhiên', 'tiếp tục, xảy ra, lặp lại, theo sau', 'đương nhiên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20287, 53, '1', 'Nghĩa từ Việt của từ 意外な là:', 'đối lập', 'người trưởng thành', 'ăn liền', 'không ngờ đến', 'không ngờ đến');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20288, 53, '1', 'Nghĩa từ Việt của từ 結構な là:', 'tốt, đủ', 'nhất định', 'giết', 'giống', 'tốt, đủ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20289, 53, '1', 'Nghĩa từ Việt của từ 派手な là:', 'lòe loẹt', 'cố hương', 'giống', 'mối quan hệ', 'lòe loẹt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20290, 53, '1', 'Nghĩa từ Việt của từ 地味な là:', 'phép trừ, tác động tiêu cực', 'giản dị', 'nuôi(râu)', 'người được nói đến', 'giản dị');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20291, 53, '1', 'Nghĩa từ Việt của từ おしゃれな là:', 'đáy', 'ẩn náu, trốn', 'quấn, quàng', 'thời trang, mốt', 'thời trang, mốt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20292, 53, '1', 'Nghĩa từ Việt của từ 変な là:', 'dựng lên', 'lạ', 'về nhà', 'bắt tay', 'lạ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20293, 53, '1', 'Nghĩa từ Việt của từ 不思議な là:', 'thần bí', 'ngoại lệ', 'tờ rơi', 'hiểu nhầm', 'thần bí');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20294, 53, '1', 'Nghĩa từ Việt của từ ましな là:', 'tốt lên', 'bị đâm', 'ghé vào', 'dính, gắn, đạt được, đi cùng với', 'tốt lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20295, 53, '1', 'Nghĩa từ Việt của từ むだな là:', 'tiền lẻ', 'chung', 'quốc tế', 'lãng phí', 'lãng phí');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20296, 53, '1', 'Nghĩa từ Việt của từ 自由な là:', 'kết thúc', 'gắn, thêm vào', 'tự do', 'bị đâm', 'tự do');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20297, 53, '1', 'Nghĩa từ Việt của từ 不自由な là:', 'cúi chào', 'trái đất', 'tàn tật, không tự do', 'tài nguyên', 'tàn tật, không tự do');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20298, 53, '1', 'Nghĩa từ Việt của từ 温まる là:', 'tờ rơi', 'phát minh', 'thần bí', 'trở nên ấm hơn', 'trở nên ấm hơn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20299, 53, '1', 'Nghĩa từ Việt của từ 温める là:', 'cấp trên', 'lẫn nhau', 'bị bẩn', 'ấm, nóng', 'ấm, nóng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20300, 53, '1', 'Nghĩa từ Việt của từ 高まる là:', 'cao lên', 'không ngờ đến', 'bị thủng', 'hiểu nhầm', 'cao lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20301, 53, '1', 'Nghĩa từ Việt của từ 高める là:', 'tôn giáo', 'làm cao lên', 'tin đồn', 'trở về, trả lại', 'làm cao lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20302, 53, '1', 'Nghĩa từ Việt của từ 強まる là:', 'nông', 'thay đổi, biến hóa', 'tiết kiệm', 'mạnh lên', 'mạnh lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20303, 53, '1', 'Nghĩa từ Việt của từ 強める là:', 'tiết kiệm', 'làm mạnh lên', 'thừa', 'giao đến', 'làm mạnh lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20304, 53, '1', 'Nghĩa từ Việt của từ 弱まる là:', 'yêu cầu', 'yếu đi', 'giá cả, vật giá', 'giao tiếp', 'yếu đi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20305, 53, '1', 'Nghĩa từ Việt của từ 弱める là:', 'chủ đề', 'tiêu đề', 'làm yếu đi', 'xây', 'làm yếu đi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20306, 53, '1', 'Nghĩa từ Việt của từ 広まる là:', 'rộng ra', 'tưởng tượng', 'trước', 'hòa bình', 'rộng ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20307, 53, '1', 'Nghĩa từ Việt của từ 広める là:', 'nướng, nấu', 'quốc tế', 'làm rộng ra', 'trái đất', 'làm rộng ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20308, 53, '1', 'Nghĩa từ Việt của từ 深まる là:', 'chồng lên, tích trữ', 'sâu hơn', 'đông đúc', 'đồng ý', 'sâu hơn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20309, 53, '1', 'Nghĩa từ Việt của từ 深める là:', 'bề trên', 'điều hòa ấm', 'làm sâu thêm', 'bị thừa', 'làm sâu thêm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20310, 53, '1', 'Nghĩa từ Việt của từ 世話 là:', 'làm cho kịp giờ', 'đi làm', 'nghĩ, ý tưởng', 'chăm sóc', 'chăm sóc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20311, 53, '1', 'Nghĩa từ Việt của từ 家庭 là:', 'sản phẩm', 'làm hỏng', 'cuối cùng', 'gia đình', 'gia đình');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20312, 53, '1', 'Nghĩa từ Việt của từ 協力 là:', 'sản phẩm', 'hiệp lực', 'ghi lại', 'thông dịch', 'hiệp lực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20313, 53, '1', 'Nghĩa từ Việt của từ 感謝 là:', 'phát triển', 'cảm tạ', 'lòe loẹt', 'đi làm, học', 'cảm tạ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20314, 53, '1', 'Nghĩa từ Việt của từ お礼 là:', 'đáp lễ', 'tắc đường', 'tiêu cực', 'so sánh', 'đáp lễ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20315, 53, '1', 'Nghĩa từ Việt của từ お詫び là:', 'xin lỗi', 'cay cú', 'phép cộng, tác động tích cực', 'luật lệ', 'xin lỗi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20316, 53, '1', 'Nghĩa từ Việt của từ おじぎ là:', 'tiền bối', 'nuôi(râu)', 'đường tắt', 'cúi chào', 'cúi chào');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20317, 53, '1', 'Nghĩa từ Việt của từ 握手 là:', 'phỏng vấn', 'phương đông', 'bắt tay', 'quê quán', 'bắt tay');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20318, 53, '1', 'Nghĩa từ Việt của từ いじわる là:', 'thối', 'xấu bụng', 'xuất hiện, được thẻ hiện', 'thuê', 'xấu bụng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20319, 53, '1', 'Nghĩa từ Việt của từ いたずら là:', 'nghịch ngợm', 'kiên quyết, chắc chắn, đáng tin cậy', 'phát minh', 'khởi động', 'nghịch ngợm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20320, 53, '1', 'Nghĩa từ Việt của từ 節約 là:', 'phỏng vấn', 'tiết kiệm', 'tiết kiệm', 'đăng ký', 'tiết kiệm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20321, 53, '1', 'Nghĩa từ Việt của từ 経営 là:', 'quản lý', 'máu', 'quê quán', 'kinh doanh, buôn bán', 'quản lý');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20322, 53, '1', 'Nghĩa từ Việt của từ 反省 là:', 'người trưởng thành', 'tự kiểm tra', 'cao nhất', 'thú cưng', 'tự kiểm tra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20323, 53, '1', 'Nghĩa từ Việt của từ 実行 là:', 'thói quen', 'thực hành', 'đối lập', 'mời, rủ', 'thực hành');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20324, 53, '1', 'Nghĩa từ Việt của từ 進歩 là:', 'tiến bộ', 'quốc tế', 'hơn, nữa', 'ôm', 'tiến bộ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20325, 53, '1', 'Nghĩa từ Việt của từ 変化 là:', 'quan hệ', 'thay đổi, biến hóa', 'luật lệ', 'dũng cảm, dũng khí', 'thay đổi, biến hóa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20326, 53, '1', 'Nghĩa từ Việt của từ 発達 là:', 'chịu đựng', 'làm tăng lên', 'phát triển', 'bầu cử', 'phát triển');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20327, 53, '1', 'Nghĩa từ Việt của từ 体力 là:', 'thể lực', 'tin đồn', 'tăng giá', 'sự kiện', 'thể lực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20328, 53, '1', 'Nghĩa từ Việt của từ 出場 là:', 'đại thể, thường', 'bị ướt', 'tham dự', 'bầu cử', 'tham dự');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20329, 53, '1', 'Nghĩa từ Việt của từ 活躍 là:', 'giết', 'hoạt động', 'dạy', 'gián đoạn', 'hoạt động');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20330, 53, '1', 'Nghĩa từ Việt của từ 競争 là:', 'lạ', 'khát', 'bao gồm', 'cạnh tranh', 'cạnh tranh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20331, 53, '1', 'Nghĩa từ Việt của từ 応援 là:', 'cổ vũ', 'bị tràn', 'vô lý', 'nguyên nhân', 'cổ vũ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20332, 53, '1', 'Nghĩa từ Việt của từ 拍手 là:', 'yêu', 'vỗ tay', 'đối lập', 'cổ vũ', 'vỗ tay');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20333, 53, '1', 'Nghĩa từ Việt của từ 人気 là:', 'vỗ tay', 'nổi tiếng', 'bị đánh', 'bị đánh', 'nổi tiếng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20334, 53, '1', 'Nghĩa từ Việt của từ うわさ là:', 'vỗ tay', 'loại', 'lỗ', 'tin đồn', 'tin đồn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20335, 53, '1', 'Nghĩa từ Việt của từ 情報 là:', 'thông tin', 'mọc', 'bắt', 'tình cờ thấy', 'thông tin');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20336, 53, '1', 'Nghĩa từ Việt của từ 交換 là:', 'trao đổi', 'thuê', 'đại biểu', 'được quyết định', 'trao đổi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20337, 53, '1', 'Nghĩa từ Việt của từ 流行 là:', 'cho xuống', 'thông dịch', 'máy tính tiền', 'trào lưu', 'trào lưu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20338, 53, '1', 'Nghĩa từ Việt của từ 宣伝 là:', 'đun sôi', 'tuyên truyền', 'bắt', 'kết nối, làm chặt thêm', 'tuyên truyền');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20339, 53, '1', 'Nghĩa từ Việt của từ 広告 là:', 'chôn', 'trung bình', 'người đối diện', 'quảng cáo', 'quảng cáo');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20340, 53, '1', 'Nghĩa từ Việt của từ 注目 là:', 'đường tắt', 'bị gãy', 'chú trọng', 'kết quả', 'chú trọng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20341, 53, '1', 'Nghĩa từ Việt của từ 通訳 là:', 'nữa', 'thông dịch', 'xé rách', 'thông dịch', 'thông dịch');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20342, 53, '1', 'Nghĩa từ Việt của từ 翻訳 là:', 'trao đổi, làm việc', 'biên dịch', 'cuối cùng, vừa đủ', 'không bao giờ', 'biên dịch');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20343, 53, '1', 'Nghĩa từ Việt của từ 伝言 là:', 'bị thừa', 'tràn', 'tai nạn', 'tin nhắn thoại', 'tin nhắn thoại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20344, 53, '1', 'Nghĩa từ Việt của từ 報告 là:', 'báo cáo', 'nấm mốc', 'mọc', 'nấm mốc', 'báo cáo');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20345, 53, '1', 'Nghĩa từ Việt của từ 録画 là:', 'tiền bối', 'bị đánh', 'ghi lại', 'chăm sóc', 'ghi lại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20346, 53, '1', 'Nghĩa từ Việt của từ 混雑 là:', 'bắt nạt', 'giới thiệu, gợi ý', 'hỗn tạp', 'khác', 'hỗn tạp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20347, 53, '1', 'Nghĩa từ Việt của từ 渋滞 là:', 'thế kỷ', 'chiều cao', 'tắc đường', 'cao nhất', 'tắc đường');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20348, 53, '1', 'Nghĩa từ Việt của từ 衝突 là:', 'mượn', 'gần như hoàn toàn', 'chôn', 'xung đột', 'xung đột');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20349, 53, '1', 'Nghĩa từ Việt của từ 被害 là:', 'lừa', 'cơ bản', 'thiệt hại', 'được giao đến', 'thiệt hại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20350, 53, '1', 'Nghĩa từ Việt của từ 事故 là:', 'tai nạn', 'tiến bộ', 'đổ', 'nhảy', 'tai nạn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20351, 53, '1', 'Nghĩa từ Việt của từ 事件 là:', 'dự phòng', 'vây quanh', 'tiến lên', 'sự kiện', 'sự kiện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20352, 53, '1', 'Nghĩa từ Việt của từ 故障 là:', 'nguyên nhân', 'hỏng', 'bị đánh', 'cao nhất', 'hỏng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20353, 53, '1', 'Nghĩa từ Việt của từ 修理 là:', 'báo cáo', 'phát kiến', 'sửa chữa', 'nguyên nhân', 'sửa chữa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20354, 53, '1', 'Nghĩa từ Việt của từ 停電 là:', 'qua', 'xây', 'mất điện', 'suốt, nhiều', 'mất điện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20355, 53, '1', 'Nghĩa từ Việt của từ 調子 là:', 'làm tăng lên', 'suy nghĩ, cảm giác', 'hoàn thành', 'trạng thái', 'trạng thái');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20356, 53, '1', 'Nghĩa từ Việt của từ 緊張 là:', 'nhớ lại', 'lo lắng', 'quen', 'sửa', 'lo lắng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20357, 53, '1', 'Nghĩa từ Việt của từ 自身 là:', 'tự tin', 'người trưởng thành', 'mở thêm, mở rộng, nới rộng, mở ra', 'đăng ký', 'tự tin');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20358, 53, '1', 'Nghĩa từ Việt của từ 自慢 là:', 'tốt, đủ', 'tự mãn', 'giới thiệu, gợi ý', 'bất an', 'tự mãn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20359, 53, '1', 'Nghĩa từ Việt của từ 感心 là:', 'phát minh', 'quan tâm', 'làm cho kịp giờ', 'rất', 'quan tâm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20360, 54, '1', 'Nghĩa từ Việt của từ 感動 là:', 'cảm động', 'phát triển', 'giết', 'chồng lên, tích trữ', 'cảm động');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20361, 54, '1', 'Nghĩa từ Việt của từ 興奮 là:', 'được chia ra', 'hưng phấn', 'tách ra', 'chôn', 'hưng phấn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20362, 54, '1', 'Nghĩa từ Việt của từ 感想 là:', 'rất', 'cảm tưởng', 'tiến lên', 'hàng', 'cảm tưởng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20363, 54, '1', 'Nghĩa từ Việt của từ 予想 là:', 'truyền đi, giới thiệu', 'người được nói đến', 'dự đoán', 'so sánh', 'dự đoán');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20364, 54, '1', 'Nghĩa từ Việt của từ 専門 là:', 'chuyên môn', 'làm mạnh lên', 'lừa', 'ghê, siêu', 'chuyên môn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20365, 54, '1', 'Nghĩa từ Việt của từ 研究 là:', 'dính, gắn, đạt được, đi cùng với', 'được sử dụng', 'khởi đầu', 'nghiên cứu', 'nghiên cứu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20366, 54, '1', 'Nghĩa từ Việt của từ 調査 là:', 'quan tâm, thông cảm', 'điều tra', 'tiến bộ', 'mất', 'điều tra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20367, 54, '1', 'Nghĩa từ Việt của từ 原因 là:', 'sau cùng, cuối cùng, sau tất cả', 'buồn bã', 'nguyên nhân', 'trượt', 'nguyên nhân');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20368, 54, '1', 'Nghĩa từ Việt của từ 結果 là:', 'kết quả', 'top', 'yêu cầu', 'vô ý, buột', 'kết quả');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20369, 54, '1', 'Nghĩa từ Việt của từ 解決 là:', 'giải quyết', 'robot', 'thiết kế', 'giao tiếp', 'giải quyết');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20370, 54, '1', 'Nghĩa từ Việt của từ 確認 là:', 'khát', 'cháy', 'xác nhận', 'tôn giáo', 'xác nhận');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20371, 54, '1', 'Nghĩa từ Việt của từ 利用 là:', 'có lẽ', 'tránh xa', 'sử dụng', 'nghĩ, ý tưởng', 'sử dụng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20372, 54, '1', 'Nghĩa từ Việt của từ 理解 là:', 'chính xác', 'khác', 'dựng lên', 'lý giải', 'lý giải');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20373, 54, '1', 'Nghĩa từ Việt của từ 発見 là:', 'bị bẩn', 'phát kiến', 'bất mãn', 'chỉnh sửa', 'phát kiến');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20374, 54, '1', 'Nghĩa từ Việt của từ 発明 là:', 'chiều rộng', 'phát minh', 'tính cách', 'thực hành', 'phát minh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20375, 54, '1', 'Nghĩa từ Việt của từ 関係 là:', 'quan hệ', 'tình nguyện', 'kinh doanh, buôn bán', 'thức xuyên đêm', 'quan hệ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20376, 54, '1', 'Nghĩa từ Việt của từ 団体 là:', 'đoàn thể', 'báo cáo', 'trước', 'hớn hở', 'đoàn thể');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20377, 54, '1', 'Nghĩa từ Việt của từ 選挙 là:', 'tổ chức', 'bầu cử', 'trình độ, level', 'thể lực', 'bầu cử');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20378, 54, '1', 'Nghĩa từ Việt của từ 税金 là:', 'bị giảm', 'giải quyết, nóng chảy', 'thuế', 'làm tăng lên', 'thuế');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20379, 54, '1', 'Nghĩa từ Việt của từ 責任 là:', 'trách nhiệm', 'lễ nghĩa', 'bề trên', 'thế kỷ', 'trách nhiệm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20380, 54, '1', 'Nghĩa từ Việt của từ 書類 là:', 'cố hương', 'thăm', 'đáy', 'tài liệu', 'tài liệu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20381, 54, '1', 'Nghĩa từ Việt của từ 題名 là:', 'tiêu đề', 'ngủ', 'tồi', 'giết', 'tiêu đề');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20382, 54, '1', 'Nghĩa từ Việt của từ 条件 là:', 'nỗ lực', 'danh thiếp', 'điều kiện', 'ngủ', 'điều kiện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20383, 54, '1', 'Nghĩa từ Việt của từ 締め切り là:', 'hạn cuối', 'thức dậy', 'đông đúc', 'thế kỷ', 'hạn cuối');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20384, 54, '1', 'Nghĩa từ Việt của từ 期間 là:', 'thuê', 'thời gian, thời kỳ', 'tai nạn', 'bị gãy', 'thời gian, thời kỳ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20385, 54, '1', 'Nghĩa từ Việt của từ 倍 là:', 'tổ chức', 'yên tâm', 'yên tâm', 'lần', 'lần');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20386, 54, '1', 'Nghĩa từ Việt của từ くじ là:', 'thất nghiệp', 'xổ số, rút thăm', 'yên tâm', 'làm vỡ', 'xổ số, rút thăm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20387, 54, '1', 'Nghĩa từ Việt của từ 近道 là:', 'so sánh', 'ghê, siêu', 'đại biểu', 'đường tắt', 'đường tắt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20388, 54, '1', 'Nghĩa từ Việt của từ 中心 là:', 'rất', 'trung tâm', 'nhẹ nhàng, yên lặng', 'được quyết định', 'trung tâm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20389, 54, '1', 'Nghĩa từ Việt của từ 辺り là:', 'gần, lân cận', 'đi làm, học', 'quan hệ', 'ngạc nhiên', 'gần, lân cận');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20390, 54, '1', 'Nghĩa từ Việt của từ 周り là:', 'xung quanh, vòng quanh', 'được xây', 'cao nhất', 'biểu hiện (trên mặt)', 'xung quanh, vòng quanh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20391, 54, '1', 'Nghĩa từ Việt của từ 穴 là:', 'ngủ', 'hớn hở', 'tiền bối', 'lỗ', 'lỗ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20392, 54, '1', 'Nghĩa từ Việt của từ 列 là:', 'thấp nhất', 'suốt, nhiều', 'hàng', 'nghỉ việc', 'hàng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20393, 54, '1', 'Nghĩa từ Việt của từ 幅 là:', 'thiệt hại', 'đổ', 'chiều rộng', 'trao, cung cấp', 'chiều rộng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20394, 54, '1', 'Nghĩa từ Việt của từ 範囲 là:', 'nông', 'phạm vi', 'chua', 'loại', 'phạm vi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20395, 54, '1', 'Nghĩa từ Việt của từ 内容 là:', 'suốt đời', 'nhớ lại', 'vất vả, mệt mỏi', 'nội dung', 'nội dung');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20396, 54, '1', 'Nghĩa từ Việt của từ 中身 là:', 'trái đất', 'robot', 'bên trong', 'cảm thấy', 'bên trong');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20397, 54, '1', 'Nghĩa từ Việt của từ 特徴 là:', 'đông đúc', 'có thể, được xây dựng', 'đặc trưng', 'lặp lại', 'đặc trưng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20398, 54, '1', 'Nghĩa từ Việt của từ 普通 là:', 'đun sôi', 'bình thường', 'nắm chặt', 'cảm thấy', 'bình thường');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20399, 54, '1', 'Nghĩa từ Việt của từ 当たり前 là:', 'hiểu nhầm', 'có lẽ', 'đương nhiên', 'ảnh hưởng', 'đương nhiên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20400, 54, '1', 'Nghĩa từ Việt của từ 偽 là:', 'hội, tiệc', 'giả', 'đích thực', 'suốt đời', 'giả');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20401, 54, '1', 'Nghĩa từ Việt của từ 別 là:', 'gián đoạn', 'dựng lên', 'khác', 'chán', 'khác');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20402, 54, '1', 'Nghĩa từ Việt của từ 国籍 là:', '(không) có gì', 'lãnh đạo', 'quốc tịch', 'sự kiện', 'quốc tịch');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20403, 54, '1', 'Nghĩa từ Việt của từ 東洋 là:', 'phương đông', 'thông tin truyền thông', 'yêu cầu', 'nuôi(râu)', 'phương đông');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20404, 54, '1', 'Nghĩa từ Việt của từ 西洋 là:', 'sản phẩm', 'lấy cắp', 'phương tây', 'sau cùng, cuối cùng, sau tất cả', 'phương tây');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20405, 54, '1', 'Nghĩa từ Việt của từ 国際 là:', 'quen', 'đón', 'quốc tế', 'có hiệu quả', 'quốc tế');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20406, 54, '1', 'Nghĩa từ Việt của từ 自然 là:', 'giả', 'tự nhiên', 'tiến bộ', 'điều hòa ấm', 'tự nhiên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20407, 54, '1', 'Nghĩa từ Việt của từ 景色 là:', 'phong cảnh', 'thông tin truyền thông', 'thử', 'làm bẩn', 'phong cảnh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20408, 54, '1', 'Nghĩa từ Việt của từ 宗教 là:', 'ngủ', 'hướng đến, quay', 'tôn giáo', 'hội, tiệc', 'tôn giáo');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20409, 54, '1', 'Nghĩa từ Việt của từ 愛 là:', 'lấy cắp', 'mang đến gần', 'yêu', 'làm bẩn', 'yêu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20410, 54, '1', 'Nghĩa từ Việt của từ 届く là:', 'được giao đến', 'nghiện', 'hóa đơn', 'nắm chặt', 'được giao đến');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20411, 54, '1', 'Nghĩa từ Việt của từ 届ける là:', 'thăm', 'xuất hiện, được thẻ hiện', 'say', 'giao đến', 'giao đến');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20412, 54, '1', 'Nghĩa từ Việt của từ かく là:', 'quốc tế', 'gãi', 'cháy', 'trạng thái', 'gãi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20413, 54, '1', 'Nghĩa từ Việt của từ つかむ là:', 'trở về, trả lại', 'tóm, chộp', 'đun sôi', 'khác', 'tóm, chộp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20414, 54, '1', 'Nghĩa từ Việt của từ 握る là:', 'bị gãy', 'thử thách', 'sửa chữa', 'nắm chặt', 'nắm chặt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20415, 54, '1', 'Nghĩa từ Việt của từ 抑える là:', 'da', 'sôi', 'loáng một cái', 'giữ', 'giữ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20416, 54, '1', 'Nghĩa từ Việt của từ 近づく là:', 'ngoại lệ', 'lại gần', 'hỏng', 'phát minh', 'lại gần');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20417, 54, '1', 'Nghĩa từ Việt của từ 近づける là:', 'kiến thức', 'so sánh', 'thịnh vượng', 'mang đến gần', 'mang đến gần');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20418, 54, '1', 'Nghĩa từ Việt của từ 合う là:', 'sạch', 'động lực', 'gặp', 'tiến lên', 'gặp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20419, 54, '1', 'Nghĩa từ Việt của từ 合わせる là:', 'tin tức, thông báo', 'nhiệt độ', 'thế kỷ', 'tập hợp, hiệp lực', 'tập hợp, hiệp lực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20420, 54, '1', 'Nghĩa từ Việt của từ 当たる là:', 'bị sai', 'con dấu', 'bị đánh', 'đường tắt', 'bị đánh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20421, 54, '1', 'Nghĩa từ Việt của từ 当てる là:', 'bị chôn', 'đánh', 'hữu ích', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'đánh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20422, 54, '1', 'Nghĩa từ Việt của từ 比べる là:', 'thu thập, được thu thập', 'thông dịch', 'so sánh', 'được tích tụ', 'so sánh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20423, 54, '1', 'Nghĩa từ Việt của từ 似合う là:', 'hợp', 'làm mạnh lên', 'bao gồm', 'bảo vệ', 'hợp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20424, 54, '1', 'Nghĩa từ Việt của từ 似る là:', 'thịnh vượng', 'lừa', 'giống', 'top', 'giống');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20425, 54, '1', 'Nghĩa từ Việt của từ 似せる là:', 'cấp trên', 'chăm sóc', 'ngoại lệ', 'bắt chước', 'bắt chước');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20426, 54, '1', 'Nghĩa từ Việt của từ 分かれる là:', 'tự do', 'tách ra', 'phát kiến', 'được chia ra', 'được chia ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20427, 54, '1', 'Nghĩa từ Việt của từ 分ける là:', 'giao đến', 'ghê, siêu', 'chia', 'trình độ, level', 'chia');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20428, 54, '1', 'Nghĩa từ Việt của từ 足す là:', 'cộng, thêm vào', 'dán', 'nấm mốc', 'người trưởng thành', 'cộng, thêm vào');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20429, 54, '1', 'Nghĩa từ Việt của từ 引く là:', 'xung quanh, vòng quanh', 'kéo, trừ', 'làm hỏng', 'xấu bụng', 'kéo, trừ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20430, 54, '1', 'Nghĩa từ Việt của từ 増える là:', 'bị gãy', 'tăng lên', 'tiến lên', 'so sánh', 'tăng lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20431, 54, '1', 'Nghĩa từ Việt của từ 増やす là:', 'ghé vào', 'cuối cùng, vừa đủ', 'làm tăng lên', 'trình độ, level', 'làm tăng lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20432, 54, '1', 'Nghĩa từ Việt của từ 減る là:', 'tàn tật, không tự do', 'ngạc nhiên', 'giảm xuống', 'vất vả, mệt mỏi', 'giảm xuống');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20433, 54, '1', 'Nghĩa từ Việt của từ 減らす là:', 'thăm', 'cố hương', 'làm giảm xuống', 'cao nhất', 'làm giảm xuống');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20434, 54, '1', 'Nghĩa từ Việt của từ 変わる là:', 'ngầm', 'thay đổi', 'giúp đỡ', 'bị ướt', 'thay đổi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20435, 54, '1', 'Nghĩa từ Việt của từ 変える là:', 'làm thay đổi', 'bảo vệ', 'xấu bụng', 'làm yếu đi', 'làm thay đổi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20436, 54, '1', 'Nghĩa từ Việt của từ 代わる・替わる・換わる là:', 'cay cú', 'thay', 'giết', 'dựng lên', 'thay');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20437, 54, '1', 'Nghĩa từ Việt của từ 代える・替える・換える là:', 'được quyết định', 'đổi', 'phương đông', 'mặt trời', 'đổi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20438, 54, '1', 'Nghĩa từ Việt của từ 返る là:', 'được trả lại', 'được nấu', 'luật lệ', 'hơi ẩm', 'được trả lại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20439, 54, '1', 'Nghĩa từ Việt của từ 返す là:', 'cho bay', 'nghĩ về', 'trả lại', 'thiết kế', 'trả lại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20440, 54, '1', 'Nghĩa từ Việt của từ 譲る là:', 'chôn', 'nhường', 'làm khô', 'bầu cử', 'nhường');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20441, 54, '1', 'Nghĩa từ Việt của từ 助かる là:', 'được giúp', 'tràn', 'nghỉ việc', 'tự tin', 'được giúp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20442, 54, '1', 'Nghĩa từ Việt của từ 助ける là:', 'suốt đời', 'giúp', 'tự động', 'vỗ tay', 'giúp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20443, 54, '1', 'Nghĩa từ Việt của từ いじめる là:', 'bắt nạt', 'đồng ý', 'xuất hiện, được thẻ hiện', 'người được nói đến', 'bắt nạt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20444, 54, '1', 'Nghĩa từ Việt của từ だまる là:', 'lừa', 'say', 'mối quan hệ', 'bị giảm', 'lừa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20445, 54, '1', 'Nghĩa từ Việt của từ 盗む là:', 'trái cây', 'trình độ, level', 'cảm thấy', 'lấy cắp', 'lấy cắp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20446, 54, '1', 'Nghĩa từ Việt của từ 刺さる là:', 'kiểu, thói', 'thói quen', 'được bao phủ', 'bị đâm', 'bị đâm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20447, 54, '1', 'Nghĩa từ Việt của từ 刺す là:', 'đâm', 'tắc đường', 'đi làm, học', 'bầu cử', 'đâm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20448, 54, '1', 'Nghĩa từ Việt của từ 殺す là:', 'toàn bộ', 'tự động', 'rõ ràng', 'giết', 'giết');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20449, 54, '1', 'Nghĩa từ Việt của từ 隠れる là:', 'giết', 'ẩn náu, trốn', 'xung quanh, vòng quanh', 'quốc tịch', 'ẩn náu, trốn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20450, 54, '1', 'Nghĩa từ Việt của từ 隠す là:', 'che giấu', 'phương đông', 'ghi lại', 'trở về, trả lại', 'che giấu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20451, 54, '1', 'Nghĩa từ Việt của từ 埋まる là:', 'kết nối, làm chặt thêm', 'suốt, nhiều', 'khác', 'bị chôn', 'bị chôn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20452, 54, '1', 'Nghĩa từ Việt của từ 埋める là:', 'truyền đi, giới thiệu', 'dựng lên', 'chôn', 'thông báo', 'chôn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20453, 54, '1', 'Nghĩa từ Việt của từ 囲む là:', 'bị thừa', 'đáy', 'vây quanh', 'nuôi(râu)', 'vây quanh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20454, 54, '1', 'Nghĩa từ Việt của từ 詰まる là:', 'được chia ra', 'đăng ký, ứng tuyển', 'đầy, chặt', 'buồn bã', 'đầy, chặt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20455, 54, '1', 'Nghĩa từ Việt của từ 詰める là:', 'trưởng thành', 'thành phố', 'đóng gói', 'làm bẩn', 'đóng gói');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20456, 54, '1', 'Nghĩa từ Việt của từ 開く là:', 'ghê, siêu', 'thất lễ', 'mở', 'rán ngập', 'mở');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20457, 54, '1', 'Nghĩa từ Việt của từ 閉じる là:', 'chi tiết', 'dđóng', 'nhựa', 'thuê', 'dđóng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20458, 54, '1', 'Nghĩa từ Việt của từ 飛ぶ là:', 'bay', 'truyền đi, giới thiệu', 'bắt nạt', 'thế kỷ', 'bay');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20459, 54, '1', 'Nghĩa từ Việt của từ 飛ばす là:', 'cho bay', 'trang trí', 'quê quán', 'nữa', 'cho bay');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20460, 54, '1', 'Nghĩa từ Việt của từ 振る là:', 'rung, vẫy', 'lỗ', '(không) tí gì', 'người được nói đến', 'rung, vẫy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20461, 54, '1', 'Nghĩa từ Việt của từ めくる là:', 'tiền lẻ', 'lật lên', 'card', 'nhựa', 'lật lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20462, 54, '1', 'Nghĩa từ Việt của từ 見かける là:', 'trình độ, level', 'làm mạnh lên', 'hình ảnh', 'tình cờ thấy', 'tình cờ thấy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20463, 54, '1', 'Nghĩa từ Việt của từ 確かめる là:', 'chôn', 'kiểm tra lại', 'thấp nhất', 'thông tin', 'kiểm tra lại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20464, 54, '1', 'Nghĩa từ Việt của từ 試す là:', 'thua', 'thực hành', 'được bao phủ', 'thử', 'thử');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20465, 54, '1', 'Nghĩa từ Việt của từ 繰り返す là:', 'giúp đỡ', 'vượt qua', 'lặp lại', 'chắc chắn', 'lặp lại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20466, 54, '1', 'Nghĩa từ Việt của từ 訳す là:', 'ngủ', 'thuê', 'kết quả', 'dịch', 'dịch');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20467, 54, '1', 'Nghĩa từ Việt của từ 行う là:', 'ảnh hưởng', 'tổ chức', 'thông dịch', 'giới thiệu, gợi ý', 'tổ chức');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20468, 54, '1', 'Nghĩa từ Việt của từ 間違う là:', 'da', 'danh thiếp', 'dọn dẹp', 'bị sai', 'bị sai');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20469, 54, '1', 'Nghĩa từ Việt của từ 間違える là:', 'sự kiện', 'yên tâm', 'làm sai', 'đăng ký', 'làm sai');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20470, 54, '1', 'Nghĩa từ Việt của từ 許す là:', 'bị ướt', 'tha thứ, cho phép', 'qua', 'thăm', 'tha thứ, cho phép');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20471, 54, '1', 'Nghĩa từ Việt của từ 慣れる là:', 'quen', 'cảm động', 'hàng', 'đổ', 'quen');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20472, 54, '1', 'Nghĩa từ Việt của từ 慣らす là:', 'khởi động', 'cao nhất', 'phát kiến', 'đại thể, thường', 'khởi động');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20473, 54, '1', 'Nghĩa từ Việt của từ 立つ là:', 'ngủ', 'người được nói đến', 'da', 'đứng', 'đứng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20474, 54, '1', 'Nghĩa từ Việt của từ 立てる là:', 'bảnh bao', 'đánh thức', 'thiệt hại', 'dựng lên', 'dựng lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20475, 54, '1', 'Nghĩa từ Việt của từ 建つ là:', 'trào lưu', 'được xây', 'điều kiện', 'vượt qua', 'được xây');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20476, 54, '1', 'Nghĩa từ Việt của từ 建てる là:', 'bao phủ', 'xây', 'được sinh ra', 'khởi đầu', 'xây');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20477, 54, '1', 'Nghĩa từ Việt của từ 育つ là:', 'vừa, được công bố', 'được giúp', 'xuất hiện, hiện ra', 'được nuôi dạy', 'được nuôi dạy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20478, 54, '1', 'Nghĩa từ Việt của từ 育てる là:', 'nuôi, dạy', 'được sinh ra', 'lý do', 'tiền bối', 'nuôi, dạy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20479, 54, '1', 'Nghĩa từ Việt của từ 生える là:', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'thói quen', 'thú cưng', 'mọc', 'mọc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20480, 55, '1', 'Nghĩa từ Việt của từ 生やす là:', 'nuôi(râu)', 'đặt hàng', 'được sửa', 'tiến bộ', 'nuôi(râu)');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20481, 55, '1', 'Nghĩa từ Việt của từ 汚れる là:', 'bị bẩn', 'vượt, lướt', 'nghĩ về', 'giao tiếp', 'bị bẩn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20482, 55, '1', 'Nghĩa từ Việt của từ 汚す là:', 'vây quanh', 'làm bẩn', 'cháy', 'thực tế là', 'làm bẩn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20483, 55, '1', 'Nghĩa từ Việt của từ 壊れる là:', 'ghi lại', 'danh thiếp', 'sơn', 'bị hỏng', 'bị hỏng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20484, 55, '1', 'Nghĩa từ Việt của từ 壊す là:', 'làm hỏng', 'bị chôn', 'bị tràn', 'tiết kiệm', 'làm hỏng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20485, 55, '1', 'Nghĩa từ Việt của từ 割れる là:', 'kết quả', 'tiết kiệm', 'bị vỡ', 'rõ ràng', 'bị vỡ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20486, 55, '1', 'Nghĩa từ Việt của từ 割る là:', 'tiền bối', 'phát triển', 'làm vỡ', 'thiết kế', 'làm vỡ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20487, 55, '1', 'Nghĩa từ Việt của từ 折れる là:', '(mặt trời) chiếu sáng, mở (ô), nhỏ (thuốc mắt)', 'bị gãy', 'trình độ, level', 'cơ bản', 'bị gãy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20488, 55, '1', 'Nghĩa từ Việt của từ 折る là:', 'làm gãy', 'tin đồn', 'hòa bình', 'chủ đề', 'làm gãy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20489, 55, '1', 'Nghĩa từ Việt của từ 破れる là:', 'nhựa', 'bị rách', 'thông tin', 'thịnh vượng', 'bị rách');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20490, 55, '1', 'Nghĩa từ Việt của từ 破る là:', 'xung quanh, vòng quanh', 'lần', 'gọi', 'xé rách', 'xé rách');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20491, 55, '1', 'Nghĩa từ Việt của từ 曲がる là:', 'gập, cong', 'sôi', 'làm cho kịp giờ', 'thấp nhất', 'gập, cong');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20492, 55, '1', 'Nghĩa từ Việt của từ 曲げる là:', 'trạng thái', 'hối hận', 'hiểu nhầm', 'bẻ, uốn', 'bẻ, uốn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20493, 55, '1', 'Nghĩa từ Việt của từ 外れる là:', 'bị rời ra', 'tai nạn', 'làm thay đổi', 'ngủ', 'bị rời ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20494, 55, '1', 'Nghĩa từ Việt của từ 外す là:', 'hòa bình', 'giúp', 'dựng lên', 'tách ra', 'tách ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20495, 55, '1', 'Nghĩa từ Việt của từ 揺れる là:', 'cố hương', 'làm thêm', 'bị rung', 'về nước', 'bị rung');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20496, 55, '1', 'Nghĩa từ Việt của từ 揺らす là:', 'đung đưa', 'bắt', 'đại thể, thường', 'sản phẩm', 'đung đưa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20497, 55, '1', 'Nghĩa từ Việt của từ 流れる là:', 'bị chôn', 'giới thiệu, gợi ý', 'chảy', 'máy tính tiền', 'chảy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20498, 55, '1', 'Nghĩa từ Việt của từ 流す là:', 'khói', 'cho chảy', 'tráng miệng', 'da', 'cho chảy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20499, 55, '1', 'Nghĩa từ Việt của từ 濡れる là:', 'chói', 'tính chất', 'được bao phủ', 'bị ướt', 'bị ướt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20500, 55, '1', 'Nghĩa từ Việt của từ 濡らす là:', 'làm ướt', 'nghĩ, ý tưởng', 'thật lòng, kỳ thực', 'bất an', 'làm ướt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20501, 55, '1', 'Nghĩa từ Việt của từ 迷う là:', 'lạc đường', 'thuê', 'kinh doanh, buôn bán', 'tự động', 'lạc đường');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20502, 55, '1', 'Nghĩa từ Việt của từ 悩む là:', 'thuê', 'chán', 'mời, rủ', 'băn khoăn', 'băn khoăn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20503, 55, '1', 'Nghĩa từ Việt của từ 慌てる là:', 'rõ ràng', 'người được nói đến', 'vội vàng', 'thực hành', 'vội vàng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20504, 55, '1', 'Nghĩa từ Việt của từ 覚める là:', 'thức dậy', 'tờ rơi', 'nói chuyện riêng', 'vội vàng', 'thức dậy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20505, 55, '1', 'Nghĩa từ Việt của từ 覚ます là:', 'mở mắt, tỉnh', 'khẩn cấp, vội', 'chứa, bao gồm', 'con dấu', 'mở mắt, tỉnh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20506, 55, '1', 'Nghĩa từ Việt của từ 眠る là:', 'ngủ', 'báo cáo', 'phép trừ, tác động tiêu cực', 'danh thiếp', 'ngủ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20507, 55, '1', 'Nghĩa từ Việt của từ 祈る là:', 'cửa hàng tiện ích', 'cầu, khấn', 'tình cờ thấy', 'giận dữ', 'cầu, khấn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20508, 55, '1', 'Nghĩa từ Việt của từ 祝う là:', 'được sử dụng', 'băn khoăn', 'sau cùng, cuối cùng, sau tất cả', 'ăn mừng', 'ăn mừng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20509, 55, '1', 'Nghĩa từ Việt của từ 感じる là:', 'cảm thấy', 'được chuyển', 'chiều rộng', 'nhãn', 'cảm thấy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20510, 55, '1', 'Nghĩa từ Việt của từ クラスメート là:', 'hỏng', 'bạn cùng lớp', 'nhãn', 'hiểu, thông qua', 'bạn cùng lớp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20511, 55, '1', 'Nghĩa từ Việt của từ グループ là:', 'truyền đi, giới thiệu', 'nhóm', 'tốt, đủ', 'người được nói đến', 'nhóm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20512, 55, '1', 'Nghĩa từ Việt của từ チーム là:', 'quốc tịch', 'tổ chức', 'đội', 'trình độ, level', 'đội');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20513, 55, '1', 'Nghĩa từ Việt của từ プロフェッショナル là:', 'làm bẩn', 'làm phiền', 'chuyên nghiệp', 'làm mạnh lên', 'chuyên nghiệp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20514, 55, '1', 'Nghĩa từ Việt của từ アマチュア là:', 'nghiệp dư', 'giữ', 'suy nghĩ, cảm giác', 'trình độ, level', 'nghiệp dư');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20515, 55, '1', 'Nghĩa từ Việt của từ トレーニング là:', 'cao nhất', 'chính xác', 'đào tạo', 'nấm mốc', 'đào tạo');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20516, 55, '1', 'Nghĩa từ Việt của từ マッサージ là:', 'nhóm', 'bị chôn', 'lo lắng', 'mát xa', 'mát xa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20517, 55, '1', 'Nghĩa từ Việt của từ アドバイス là:', 'khuyên', 'hơn nữa', 'trình độ, level', 'ra đời', 'khuyên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20518, 55, '1', 'Nghĩa từ Việt của từ アイデア・アイディア là:', 'giúp đỡ', 'làm hỏng', 'ý tưởng', 'thiệt hại', 'ý tưởng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20519, 55, '1', 'Nghĩa từ Việt của từ トップ là:', 'mời, rủ', 'top', 'phát triển', 'chiêu đãi', 'top');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20520, 55, '1', 'Nghĩa từ Việt của từ スピード là:', 'chủ đề', 'sắp', 'tình nguyện', 'tốc độ', 'tốc độ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20521, 55, '1', 'Nghĩa từ Việt của từ ラッシュ là:', 'ảnh hưởng', 'ăn liền', 'thông dịch', 'đông đúc', 'đông đúc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20522, 55, '1', 'Nghĩa từ Việt của từ バイク là:', 'xe máy', 'người được nói đến', 'trạng thái', 'mở thêm, mở rộng, nới rộng, mở ra', 'xe máy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20523, 55, '1', 'Nghĩa từ Việt của từ ヘルメット là:', 'tai nạn', 'thử thách', 'khá', 'mũ bảo hiểm', 'mũ bảo hiểm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20524, 55, '1', 'Nghĩa từ Việt của từ コンタクトレンズ là:', 'card', 'tránh xa', 'kính áp tròng', 'phát minh', 'kính áp tròng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20525, 55, '1', 'Nghĩa từ Việt của từ ガラス là:', 'kính', 'chiêu đãi', 'mời, rủ', 'thiệt hại', 'kính');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20526, 55, '1', 'Nghĩa từ Việt của từ プラスチック là:', 'sống', 'cảm động', 'nhựa', 'rán ngập', 'nhựa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20527, 55, '1', 'Nghĩa từ Việt của từ ベランダ là:', 'ban công', 'ngon', 'thuê', 'ăn liền', 'ban công');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20528, 55, '1', 'Nghĩa từ Việt của từ ペット là:', 'đào tạo', 'mở thêm, mở rộng, nới rộng, mở ra', 'thú cưng', 'tóm, chộp', 'thú cưng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20529, 55, '1', 'Nghĩa từ Việt của từ ベンチ là:', 'tự động', 'bị bẩn', 'ghế bành', 'không thể ngờ, không', 'ghế bành');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20530, 55, '1', 'Nghĩa từ Việt của từ デザイン là:', 'tốt, đủ', 'lần', 'rán ngập', 'thiết kế', 'thiết kế');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20531, 55, '1', 'Nghĩa từ Việt của từ バーゲンセール là:', 'suy nghĩ, cảm giác', 'xung quanh, vòng quanh', 'bằng cấp, tư cách', 'sale', 'sale');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20532, 55, '1', 'Nghĩa từ Việt của từ パート là:', 'làm thêm', 'chăm sóc', 'bị đâm', 'ghi lại', 'làm thêm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20533, 55, '1', 'Nghĩa từ Việt của từ コンビニエンスストア là:', 'xấu bụng', 'cửa hàng tiện ích', 'nông', 'điều hòa ấm', 'cửa hàng tiện ích');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20534, 55, '1', 'Nghĩa từ Việt của từ レジ là:', 'tráng miệng', 'được kết nối, được mở rộng, thông qua', 'trình độ, level', 'máy tính tiền', 'máy tính tiền');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20535, 55, '1', 'Nghĩa từ Việt của từ レシート là:', 'được sử dụng', 'hóa đơn', 'gào to', 'phanh', 'hóa đơn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20536, 55, '1', 'Nghĩa từ Việt của từ インスタント là:', 'giảm', 'ăn liền', 'tắc đường', 'mọc', 'ăn liền');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20537, 55, '1', 'Nghĩa từ Việt của từ ファストフード là:', 'phát minh', 'nhất định', 'đồ ăn nhanh', 'chuyên nghiệp', 'đồ ăn nhanh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20538, 55, '1', 'Nghĩa từ Việt của từ フルーツ là:', 'đào tạo', 'trái cây', 'dựng lên', 'tóm, chộp', 'trái cây');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20539, 55, '1', 'Nghĩa từ Việt của từ デザート là:', 'bị giảm', 'thói quen', 'tội phạm', 'tráng miệng', 'tráng miệng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20540, 55, '1', 'Nghĩa từ Việt của từ インターネット là:', 'khởi đầu', 'tự tin', 'được quyết định', 'internet', 'internet');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20541, 55, '1', 'Nghĩa từ Việt của từ チャイム là:', 'tắc đường', 'chuông', 'thay đổi', 'tươi', 'chuông');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20542, 55, '1', 'Nghĩa từ Việt của từ アナウンス là:', 'quen', 'chịu đựng giỏi', 'cổ vũ', 'thông báo', 'thông báo');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20543, 55, '1', 'Nghĩa từ Việt của từ メッセージ là:', 'tin nhắn', 'giết', 'tự kiểm tra', 'có thể, được xây dựng', 'tin nhắn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20544, 55, '1', 'Nghĩa từ Việt của từ パンフレット là:', 'hớn hở', 'làm hỏng', 'tờ rơi', 'khác', 'tờ rơi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20545, 55, '1', 'Nghĩa từ Việt của từ カード là:', 'thịnh vượng', 'card', 'xung quanh', 'chỉ', 'card');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20546, 55, '1', 'Nghĩa từ Việt của từ インタビュー là:', 'phỏng vấn', 'thực tế là', 'kiểu, thói', 'thần bí', 'phỏng vấn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20547, 55, '1', 'Nghĩa từ Việt của từ アンケート là:', 'phát triển', 'tờ câu hỏi', 'xuất hiện, được thẻ hiện', 'giới thiệu, gợi ý', 'tờ câu hỏi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20548, 55, '1', 'Nghĩa từ Việt của từ データ là:', 'giảm', 'dữ liệu', 'nhóm', 'tốt lên', 'dữ liệu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20549, 55, '1', 'Nghĩa từ Việt của từ パーセント là:', 'gần, sát nút', 'thấp nhất', 'đại thể, thường', 'phần trăm', 'phần trăm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20550, 55, '1', 'Nghĩa từ Việt của từ 濃い là:', 'làm vỡ', 'quan tâm, thông cảm', 'đậm, đặc', 'chiều cao', 'đậm, đặc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20551, 55, '1', 'Nghĩa từ Việt của từ 薄い là:', 'thân thiết', 'điều tra', 'mỏng, nhạt', 'cháy', 'mỏng, nhạt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20552, 55, '1', 'Nghĩa từ Việt của từ 酸っぱい là:', 'ăn liền', 'chua', 'vượt, lướt', 'rõ ràng', 'chua');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20553, 55, '1', 'Nghĩa từ Việt của từ 臭い là:', 'thông tin', 'bị giảm', 'thối', 'ngủ', 'thối');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20554, 55, '1', 'Nghĩa từ Việt của từ おかしい là:', 'xổ số, rút thăm', 'trình độ, level', 'lạ', 'cháy', 'lạ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20555, 55, '1', 'Nghĩa từ Việt của từ かっこいい là:', 'bảnh bao', 'nắm chặt', 'người trưởng thành', 'tốt lên', 'bảnh bao');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20556, 55, '1', 'Nghĩa từ Việt của từ うまい là:', 'đánh thức', '(không) tí gì', 'ngon', 'tốt, đủ', 'ngon');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20557, 55, '1', 'Nghĩa từ Việt của từ 親しい là:', 'truyền đi, giới thiệu', 'cảm thấy', 'chuyển', 'thân thiết', 'thân thiết');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20558, 55, '1', 'Nghĩa từ Việt của từ 詳しい là:', 'thiết kế', 'đi làm', 'đồng phục', 'chi tiết', 'chi tiết');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20559, 55, '1', 'Nghĩa từ Việt của từ 細かい là:', 'tiết kiệm', 'tiểu tiết, bé', 'suốt đời', 'mang đến gần', 'tiểu tiết, bé');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20560, 55, '1', 'Nghĩa từ Việt của từ 浅い là:', 'đặc trưng', 'nông', 'điều tra', 'quốc tế', 'nông');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20561, 55, '1', 'Nghĩa từ Việt của từ 固い・硬い là:', 'hoàn thành', 'dần dần', 'cứng', 'chôn', 'cứng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20562, 55, '1', 'Nghĩa từ Việt của từ ぬるい là:', 'nguội', 'nhãn hiệu', 'nhóm', 'tránh xa', 'nguội');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20563, 55, '1', 'Nghĩa từ Việt của từ まぶしい là:', 'sống', 'chói', 'mọc', 'trung bình', 'chói');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20564, 55, '1', 'Nghĩa từ Việt của từ 蒸し暑い là:', 'da', 'thức dậy', 'đồng ý', 'nóng ẩm', 'nóng ẩm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20565, 55, '1', 'Nghĩa từ Việt của từ 清潔な là:', 'bỏ học', 'hơn nữa', 'sạch', 'tiêu đề', 'sạch');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20566, 55, '1', 'Nghĩa từ Việt của từ 新鮮な là:', 'tươi', 'xuất hiện, được thẻ hiện', 'hồi phục', 'tận hưởng', 'tươi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20567, 55, '1', 'Nghĩa từ Việt của từ 豊かな là:', 'buồn bã', 'lạ', 'giàu có', 'đồng phục', 'giàu có');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20568, 55, '1', 'Nghĩa từ Việt của từ 立派な là:', 'cảm thấy', 'dũng cảm, dũng khí', 'siêu', 'yêu', 'siêu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20569, 55, '1', 'Nghĩa từ Việt của từ 正確な là:', 'chính xác', 'vô ý, buột', 'hậu bối', 'bị gãy', 'chính xác');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20570, 55, '1', 'Nghĩa từ Việt của từ 確かな là:', 'giải quyết, nóng chảy', 'đích thực', 'suốt đời', 'đồng ý', 'đích thực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20571, 55, '1', 'Nghĩa từ Việt của từ 重要な là:', 'quan trọng', 'bị đánh', 'có lẽ', 'thứ tự', 'quan trọng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20572, 55, '1', 'Nghĩa từ Việt của từ 必要な là:', 'được giao đến', 'cần thiết', 'quê quán', 'dịch', 'cần thiết');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20573, 55, '1', 'Nghĩa từ Việt của từ もったいない là:', 'khát', 'lãng phí', 'tính cách', 'hoạt động', 'lãng phí');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20574, 55, '1', 'Nghĩa từ Việt của từ すごい là:', 'kết nối, làm chặt thêm', 'ghê, siêu', 'về nhà', 'đặt hàng', 'ghê, siêu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20575, 55, '1', 'Nghĩa từ Việt của từ ひどい là:', 'nuôi(râu)', 'tồi', 'hạnh phúc', 'loại', 'tồi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20576, 55, '1', 'Nghĩa từ Việt của từ 激しい là:', 'mở thêm, mở rộng, nới rộng, mở ra', 'mãnh liệt', 'biểu thị, biểu lộ, đại diện', 'yêu cầu', 'mãnh liệt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20577, 55, '1', 'Nghĩa từ Việt của từ そっくりな là:', 'giống', 'phỏng vấn', 'được sửa', 'quấn, quàng', 'giống');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20578, 55, '1', 'Nghĩa từ Việt của từ 急な là:', 'quê quán', 'tôn giáo', 'đột nhiên', 'đạt được, có được', 'đột nhiên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20579, 55, '1', 'Nghĩa từ Việt của từ 敵とな là:', 'cháy', 'phù hợp', 'vừa vặn, đúng', 'thông dịch', 'phù hợp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20580, 55, '1', 'Nghĩa từ Việt của từ 特別な là:', 'tươi', 'sống', 'đặc biệt', 'sau cùng, cuối cùng, sau tất cả', 'đặc biệt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20581, 55, '1', 'Nghĩa từ Việt của từ 完全な là:', 'toàn bộ', 'thực tế là', 'che giấu', 'biểu thị, biểu lộ, đại diện', 'toàn bộ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20582, 55, '1', 'Nghĩa từ Việt của từ 盛んな là:', 'thịnh vượng', 'lặp lại', 'được tích tụ', 'cao lên', 'thịnh vượng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20583, 55, '1', 'Nghĩa từ Việt của từ 様々な là:', 'lãnh đạo', 'tóm, chộp', 'đa đạng', 'giết', 'đa đạng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20584, 55, '1', 'Nghĩa từ Việt của từ 可能な là:', 'dựng lên', 'khả thi', 'nói chuyện riêng', 'điều kiện', 'khả thi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20585, 55, '1', 'Nghĩa từ Việt của từ 不可能な là:', 'toàn bộ', 'bất khả thi', 'nhãn', 'được sinh ra', 'bất khả thi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20586, 55, '1', 'Nghĩa từ Việt của từ 基本的な là:', 'leo lên', 'cơ bản', 'xấu bụng', 'lo lắng', 'cơ bản');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20587, 55, '1', 'Nghĩa từ Việt của từ 国際的な là:', 'tình nguyện', 'nghĩ về', 'tiến lên', 'tính quốc tế', 'tính quốc tế');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20588, 55, '1', 'Nghĩa từ Việt của từ ばらばらな là:', 'tung tóe, chia rẽ', 'máy tính tiền', 'làm tăng lên', 'sự kiện', 'tung tóe, chia rẽ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20589, 55, '1', 'Nghĩa từ Việt của từ ぼろぼろな là:', 'rách nát, te tua', 'được chuyển', 'đi làm, học', 'gián đoạn', 'rách nát, te tua');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20590, 55, '1', 'Nghĩa từ Việt của từ 大変に là:', 'tham gia', 'giảm', 'khủng khiếp, rất nhiều', 'tráng miệng', 'khủng khiếp, rất nhiều');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20591, 55, '1', 'Nghĩa từ Việt của từ ほとんど là:', 'người được nói đến', 'gần như hoàn toàn', 'loại', 'làm mạnh lên', 'gần như hoàn toàn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20592, 55, '1', 'Nghĩa từ Việt của từ 大体 là:', 'cầu, khấn', 'tình nguyện', 'bảo vệ', 'phần lớn, trong khoảng', 'phần lớn, trong khoảng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20593, 55, '1', 'Nghĩa từ Việt của từ かなり là:', 'bạn bè', 'khá', 'được quyết định', 'thực tế là', 'khá');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20594, 55, '1', 'Nghĩa từ Việt của từ ずいぶん là:', 'khẩn cấp, vội', 'đáng kể', 'cho vào, cho lên, công bố', 'tiền bối', 'đáng kể');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20595, 55, '1', 'Nghĩa từ Việt của từ けっこう là:', 'trung thực', 'băn khoăn', 'rất', 'tiền bối', 'rất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20596, 55, '1', 'Nghĩa từ Việt của từ 大分 là:', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'chủ yếu, khá', 'đại thể, thường', 'tồi', 'chủ yếu, khá');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20597, 55, '1', 'Nghĩa từ Việt của từ もっと là:', 'giá cả, vật giá', 'hơn, nữa', 'gửi', 'bầu cử', 'hơn, nữa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20598, 55, '1', 'Nghĩa từ Việt của từ しっかり là:', 'giả', 'chính xác', 'thành phố', 'toàn bộ', 'toàn bộ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20599, 55, '1', 'Nghĩa từ Việt của từ いっぱい là:', 'đầy', 'lẫn nhau', 'vào đại học', 'mẫu', 'đầy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20600, 56, '1', 'Nghĩa từ Việt của từ ぎりぎり là:', 'hiện tại', 'gần, sát nút', 'tiền bối', 'không ngờ đến', 'gần, sát nút');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20601, 56, '1', 'Nghĩa từ Việt của từ ぴったり là:', 'mang đến gần', 'yêu cầu', 'vừa vặn, đúng', 'truyền đi, giới thiệu', 'vừa vặn, đúng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20602, 56, '1', 'Nghĩa từ Việt của từ たいてい là:', 'kinh doanh, buôn bán', 'đại thể, thường', 'hoàn thành', 'trạng thái', 'đại thể, thường');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20603, 56, '1', 'Nghĩa từ Việt của từ 同時に là:', 'cùng lúc', 'khởi đầu', 'phỏng vấn', 'đồng phục', 'cùng lúc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20604, 56, '1', 'Nghĩa từ Việt của từ 前もって là:', 'giới thiệu, gợi ý', 'bên trong', 'trước', 'tập hợp, sàng lọc, hợp nhất, tổ chức', 'trước');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20605, 56, '1', 'Nghĩa từ Việt của từ すぐに là:', 'bị chôn', 'cháy', 'lừa', 'ngay lập tức', 'ngay lập tức');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20606, 56, '1', 'Nghĩa từ Việt của từ もうすぐ là:', 'nổi tiếng', 'làm cho tiến lên', 'sắp', 'giống', 'sắp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20607, 56, '1', 'Nghĩa từ Việt của từ 突然 là:', 'trước', 'chiến tranh', 'chính xác', 'đột nhiên', 'đột nhiên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20608, 56, '1', 'Nghĩa từ Việt của từ あっという間に là:', 'sau cùng, cuối cùng, sau tất cả', 'loáng một cái', 'điều tra', 'bảo vệ', 'loáng một cái');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20609, 56, '1', 'Nghĩa từ Việt của từ いつの間にか là:', 'lúc nào không biết', 'đông đúc', 'lo lắng', 'người trưởng thành', 'lúc nào không biết');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20610, 56, '1', 'Nghĩa từ Việt của từ しばらく là:', 'thiệt hại', 'một chút', 'hiện tại', 'tự kiểm tra', 'một chút');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20611, 56, '1', 'Nghĩa từ Việt của từ ずっと là:', 'suốt, nhiều', 'bầu cử', 'lãnh đạo', 'thử thách', 'suốt, nhiều');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20612, 56, '1', 'Nghĩa từ Việt của từ 相変わらず là:', 'làm thêm', 'mọc', 'không bao giờ', 'như mọi khi', 'như mọi khi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20613, 56, '1', 'Nghĩa từ Việt của từ 次々に là:', 'nổi tiếng', 'bị ướt', 'lần lượt', 'quen', 'lần lượt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20614, 56, '1', 'Nghĩa từ Việt của từ どんどん là:', 'cố hương', 'tự tin', 'dần dần', 'cao nhất', 'dần dần');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20615, 56, '1', 'Nghĩa từ Việt của từ ますます là:', 'càng ngày càng', 'truyền đi, giới thiệu', 'thăm', 'xung quanh, vòng quanh', 'càng ngày càng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20616, 56, '1', 'Nghĩa từ Việt của từ やっと là:', 'cấm', 'tiết kiệm', 'bầu cử', 'cuối cùng, vừa đủ', 'cuối cùng, vừa đủ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20617, 56, '1', 'Nghĩa từ Việt của từ とうとう là:', 'sau cùng, cuối cùng, sau tất cả', 'khát', 'xung quanh, vòng quanh', 'mang đến gần', 'sau cùng, cuối cùng, sau tất cả');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20618, 56, '1', 'Nghĩa từ Việt của từ ついに là:', 'thất nghiệp', 'tổ chức', 'sở thích', 'cuối cùng, sau cùng', 'cuối cùng, sau cùng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20619, 56, '1', 'Nghĩa từ Việt của từ もちろん là:', 'tất nhiên', 'thành công', 'luật lệ', 'kịp giờ', 'tất nhiên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20620, 56, '1', 'Nghĩa từ Việt của từ やはり là:', 'gào to', 'như dự tính', 'chán', 'đại thể, thường', 'như dự tính');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20621, 56, '1', 'Nghĩa từ Việt của từ きっと là:', 'về quê', 'suốt đời', 'thông tin', 'nhất định', 'nhất định');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20622, 56, '1', 'Nghĩa từ Việt của từ ぜひ là:', 'bằng mọi giá, rất (muốn)', 'chán', 'nghĩ, ý tưởng', 'hớn hở', 'bằng mọi giá, rất (muốn)');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20623, 56, '1', 'Nghĩa từ Việt của từ なるべく là:', 'càng nhiều càng tốt', 'cảm động', 'tiền lẻ', 'về nhà', 'càng nhiều càng tốt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20624, 56, '1', 'Nghĩa từ Việt của từ 案外 là:', 'mất', 'nhựa', 'không ngờ đến', 'tiết kiệm', 'không ngờ đến');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20625, 56, '1', 'Nghĩa từ Việt của từ もしかすると・もしかしたら・もしかして là:', 'có lẽ', 'rán ngập', 'chán', 'quan tâm, thông cảm', 'có lẽ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20626, 56, '1', 'Nghĩa từ Việt của từ まさか là:', 'hỏng', 'không thể ngờ, không', 'băn khoăn', 'truyền đi, giới thiệu', 'không thể ngờ, không');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20627, 56, '1', 'Nghĩa từ Việt của từ うっかり là:', 'trưởng thành', 'ngơ ngác, không để ý', 'phanh', 'mãnh liệt', 'ngơ ngác, không để ý');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20628, 56, '1', 'Nghĩa từ Việt của từ つい là:', 'phát triển', 'vô ý, buột', 'bị tàn, rụng', 'kết thúc', 'vô ý, buột');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20629, 56, '1', 'Nghĩa từ Việt của từ 思わず là:', 'tiếp tục, xảy ra, lặp lại, theo sau', 'không ngờ đến', 'thông tin', 'thử thách', 'không ngờ đến');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20630, 56, '1', 'Nghĩa từ Việt của từ ほっと là:', 'chiều cao', 'yên tâm', 'chăm sóc', 'phương đông', 'yên tâm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20631, 56, '1', 'Nghĩa từ Việt của từ いらいら là:', 'đăng ký', 'tiền bối', 'khó chịu, nóng giận', 'kết nối, làm chặt thêm', 'khó chịu, nóng giận');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20632, 56, '1', 'Nghĩa từ Việt của từ のんびり là:', 'nổi tiếng', 'đường tắt', 'thực tế là', 'tận hưởng', 'tận hưởng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20633, 56, '1', 'Nghĩa từ Việt của từ 実は là:', 'được kết nối, được mở rộng, thông qua', 'thực tế là', 'được xây', 'lẫn nhau', 'thực tế là');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20634, 56, '1', 'Nghĩa từ Việt của từ 読書 là:', 'đọc viết', 'trái cây', 'đạt được, có được', 'xung quanh, vòng quanh', 'đọc viết');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20635, 56, '1', 'Nghĩa từ Việt của từ 演奏 là:', 'biểu diễn', 'lấy cắp', 'tắc đường', 'tình nguyện', 'biểu diễn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20636, 56, '1', 'Nghĩa từ Việt của từ 芸術 là:', 'nghệ thuật', 'nuôi(râu)', 'chịu đựng giỏi', 'đun sôi', 'nghệ thuật');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20637, 56, '1', 'Nghĩa từ Việt của từ 検査 là:', 'kiểm tra', 'thông tin', 'đùa cợt', 'làm cho tiến lên', 'kiểm tra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20638, 56, '1', 'Nghĩa từ Việt của từ 血液 là:', 'chăm sóc', 'nuôi(râu)', 'máu', 'cho xuống', 'máu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20639, 56, '1', 'Nghĩa từ Việt của từ 治療 là:', 'lỗ', 'nuôi(râu)', 'bị thừa', 'trị liệu', 'trị liệu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20640, 56, '1', 'Nghĩa từ Việt của từ 症状 là:', 'cảm thấy', 'người được nói đến', 'triệu chứng', 'hớn hở', 'triệu chứng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20641, 56, '1', 'Nghĩa từ Việt của từ 予防 là:', 'dán', 'thăm', 'dự phòng', 'dũng cảm, dũng khí', 'dự phòng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20642, 56, '1', 'Nghĩa từ Việt của từ 栄養 là:', 'đăng ký', 'cảm tưởng', 'dinh dưỡng', 'nuôi(râu)', 'dinh dưỡng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20643, 56, '1', 'Nghĩa từ Việt của từ 手術 là:', 'phẫu thuật', 'lừa', 'thay đổi, biến hóa', 'thay đổi', 'phẫu thuật');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20644, 56, '1', 'Nghĩa từ Việt của từ 死亡 là:', 'bị bẩn', 'tóm, chộp', 'làm tăng lên', 'tử vong', 'tử vong');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20645, 56, '1', 'Nghĩa từ Việt của từ 命 là:', 'khởi đầu', 'sở thích', 'sinh mạng', 'rất', 'sinh mạng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20646, 56, '1', 'Nghĩa từ Việt của từ 一生 là:', '(không) tí gì', 'suốt đời', 'lo lắng', 'sống', 'suốt đời');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20647, 56, '1', 'Nghĩa từ Việt của từ 誤解 là:', 'dựng lên', 'hiểu nhầm', 'tiết kiệm', 'chung', 'hiểu nhầm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20648, 56, '1', 'Nghĩa từ Việt của từ 後悔 là:', 'hối hận', 'đánh thức', 'vừa, được công bố', 'cấm hút thuốc', 'hối hận');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20649, 56, '1', 'Nghĩa từ Việt của từ 訳 là:', 'thức xuyên đêm', 'lý do', 'băn khoăn', 'giữ', 'lý do');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20650, 56, '1', 'Nghĩa từ Việt của từ 態度 là:', 'khởi đầu', 'da', 'thái độ', 'vô lý', 'thái độ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20651, 56, '1', 'Nghĩa từ Việt của từ 癖 là:', 'hớn hở', 'tôn giáo', 'giao đến', 'thói quen', 'thói quen');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20652, 56, '1', 'Nghĩa từ Việt của từ 礼儀 là:', 'bao gồm', 'yêu cầu', 'kết thúc', 'lễ nghĩa', 'lễ nghĩa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20653, 56, '1', 'Nghĩa từ Việt của từ 文句 là:', 'cấm', '(không) tí gì', 'bầu cử', 'phàn nàn', 'phàn nàn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20654, 56, '1', 'Nghĩa từ Việt của từ 表情 là:', 'biểu lộ, biểu thị', 'xung quanh', 'được trả lại', 'thiết kế', 'biểu lộ, biểu thị');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20655, 56, '1', 'Nghĩa từ Việt của từ 鏡面 là:', 'thiếu', 'tính cách', 'đối lập', 'bề mặt', 'bề mặt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20656, 56, '1', 'Nghĩa từ Việt của từ 禁煙 là:', 'dọn dẹp', 'cháy', 'cấm hút thuốc', 'chán', 'cấm hút thuốc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20657, 56, '1', 'Nghĩa từ Việt của từ 禁止 là:', 'điều hòa ấm', 'tờ rơi', 'ngay ngắn', 'cấm', 'cấm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20658, 56, '1', 'Nghĩa từ Việt của từ 完成 là:', 'luật lệ', 'phương tây', 'ăn liền', 'hoàn thành', 'hoàn thành');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20659, 56, '1', 'Nghĩa từ Việt của từ 課題 là:', 'lo lắng', 'bị gãy', 'cắt, hết hạn', 'chủ đề', 'chủ đề');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20660, 56, '1', 'Nghĩa từ Việt của từ 例外 là:', 'ngoại lệ', 'bị gãy', 'bất an', 'chủ yếu, khá', 'ngoại lệ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20661, 56, '1', 'Nghĩa từ Việt của từ 基本 là:', 'đoàn thể', 'cơ bản', 'tính chất', 'hội, tiệc', 'cơ bản');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20662, 56, '1', 'Nghĩa từ Việt của từ 記録 là:', 'xung quanh, vòng quanh', 'ghi âm', 'đóng gói', 'quan hệ', 'ghi âm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20663, 56, '1', 'Nghĩa từ Việt của từ 状態 là:', 'trạng thái', 'thử', 'bầu cử', 'làm cho tiến lên', 'trạng thái');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20664, 56, '1', 'Nghĩa từ Việt của từ 出来事 là:', 'chụp', 'so sánh', 'sự kiện', 'hớn hở', 'sự kiện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20665, 56, '1', 'Nghĩa từ Việt của từ 場面 là:', 'tội phạm', 'kết nối, làm chặt thêm', 'khung cảnh, tình huống, hiện trường', 'đại thể, thường', 'khung cảnh, tình huống, hiện trường');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20666, 56, '1', 'Nghĩa từ Việt của từ 機会 là:', 'nhảy', 'top', 'hoàn tất', 'cơ hội', 'cơ hội');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20667, 56, '1', 'Nghĩa từ Việt của từ 距離 là:', 'phụ nữ', 'lẫn nhau', 'khởi động', 'khoảng cách', 'khoảng cách');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20668, 56, '1', 'Nghĩa từ Việt của từ 提案 là:', 'nhảy', 'đề xuất', 'kiến thức', 'có hiệu quả', 'đề xuất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20669, 56, '1', 'Nghĩa từ Việt của từ やり取り là:', 'gần như hoàn toàn', 'bị giảm', 'trao đổi, làm việc', 'đại thể, thường', 'trao đổi, làm việc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20670, 56, '1', 'Nghĩa từ Việt của từ 知識 là:', 'giúp đỡ', 'nhãn', 'kinh doanh, buôn bán', 'kiến thức', 'kiến thức');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20671, 56, '1', 'Nghĩa từ Việt của từ 実力 là:', 'thực lực', 'dựng lên', 'xung quanh, vòng quanh', 'sống', 'thực lực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20672, 56, '1', 'Nghĩa từ Việt của từ 手段 là:', 'được sử dụng', 'cách thức', 'tin tức, thông báo', 'thế nào, bao nhiêu', 'cách thức');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20673, 56, '1', 'Nghĩa từ Việt của từ 代表 là:', 'giá cả, vật giá', 'giao đến', 'xuất hiện, hiện ra', 'đại biểu', 'đại biểu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20674, 56, '1', 'Nghĩa từ Việt của từ 影響 là:', 'sâu hơn', 'mất', 'ảnh hưởng', 'mở thêm, mở rộng, nới rộng, mở ra', 'ảnh hưởng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20675, 56, '1', 'Nghĩa từ Việt của từ 効果 là:', 'đường tắt', 'trực tiếp', 'hiệu quả', 'làm yếu đi', 'hiệu quả');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20676, 56, '1', 'Nghĩa từ Việt của từ 印象 là:', 'hòa bình', 'ấn tượng', 'vô lý', 'gào to', 'ấn tượng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20677, 56, '1', 'Nghĩa từ Việt của từ 印 là:', 'dấu, dấu hiệu', 'thấp nhất', 'sống', 'tiêu đề', 'dấu, dấu hiệu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20678, 56, '1', 'Nghĩa từ Việt của từ 合図 là:', 'tốt lên', 'bị lạnh', 'ám hiệu', 'ngủ', 'ám hiệu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20679, 56, '1', 'Nghĩa từ Việt của từ 共通 là:', 'nhóm', 'tội phạm', 'tự kiểm tra', 'chung', 'chung');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20680, 56, '1', 'Nghĩa từ Việt của từ 協調 là:', 'hoàn thành', 'nhấn mạnh', 'điều hòa ấm', 'thực hành', 'nhấn mạnh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20681, 56, '1', 'Nghĩa từ Việt của từ 省略 là:', 'đoàn thể', 'giải quyết', 'cổ vũ', 'lược bớt', 'lược bớt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20682, 56, '1', 'Nghĩa từ Việt của từ 挑戦 là:', 'sâu hơn', 'đồng phục', 'đùa cợt', 'thử thách', 'thử thách');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20683, 56, '1', 'Nghĩa từ Việt của từ やる気 là:', 'đồng phục', 'bị tràn', 'điều hòa ấm', 'động lực', 'động lực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20684, 56, '1', 'Nghĩa từ Việt của từ 勇気 là:', 'lãng phí', 'người trưởng thành', 'dũng cảm, dũng khí', 'kết quả', 'dũng cảm, dũng khí');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20685, 56, '1', 'Nghĩa từ Việt của từ 資格 là:', 'quan trọng', 'trao, cung cấp', 'bị chôn', 'bằng cấp, tư cách', 'bằng cấp, tư cách');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20686, 56, '1', 'Nghĩa từ Việt của từ 申請 là:', 'trạng thái', 'hiểu, thông qua', 'bị bẩn', 'đăng ký, ứng tuyển', 'đăng ký, ứng tuyển');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20687, 56, '1', 'Nghĩa từ Việt của từ 本人 là:', 'giảm', 'người được nói đến', 'bọc', 'cười', 'người được nói đến');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20688, 56, '1', 'Nghĩa từ Việt của từ 契約 là:', 'đón', 'bị giảm', 'hợp đồng', 'dọn dẹp', 'hợp đồng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20689, 56, '1', 'Nghĩa từ Việt của từ 証明 là:', 'chứng minh, bằng chứng', 'tôn giáo', 'tiến lên', 'tràn', 'chứng minh, bằng chứng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20690, 56, '1', 'Nghĩa từ Việt của từ 変更 là:', 'mối quan hệ', 'tha thứ, cho phép', 'phát minh', 'thay đổi', 'thay đổi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20691, 56, '1', 'Nghĩa từ Việt của từ 保存 là:', 'bảo tồn', 'bị đâm', 'thông tin truyền thông', 'thân thiết', 'bảo tồn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20692, 56, '1', 'Nghĩa từ Việt của từ 保護 là:', 'tăng lên', 'phát kiến', 'giá cả, vật giá', 'bảo vệ', 'bảo vệ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20693, 56, '1', 'Nghĩa từ Việt của từ 環境 là:', 'môi trường', 'quen', 'cuộc sống', 'cầu, khấn', 'môi trường');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20694, 56, '1', 'Nghĩa từ Việt của từ 資源 là:', 'bao gồm', 'kiểu gì cũng', 'kẹt xỉ', 'tài nguyên', 'tài nguyên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20695, 56, '1', 'Nghĩa từ Việt của từ 不足 là:', 'nuôi(râu)', 'thiếu', 'ghê, siêu', 'sôi', 'thiếu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20696, 56, '1', 'Nghĩa từ Việt của từ 平均 là:', 'nổi tiếng', 'phụ nữ', 'cảm thấy', 'trung bình', 'trung bình');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20697, 56, '1', 'Nghĩa từ Việt của từ 割合 là:', 'tỷ lệ', 'đổ', 'tăng lên', 'phép cộng, tác động tích cực', 'tỷ lệ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20698, 56, '1', 'Nghĩa từ Việt của từ 商売 là:', 'chia', 'làm hỏng', 'dũng cảm, dũng khí', 'kinh doanh, buôn bán', 'kinh doanh, buôn bán');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20699, 56, '1', 'Nghĩa từ Việt của từ 商品 là:', 'nhãn', 'người được nói đến', 'sản phẩm', 'làm tăng lên', 'sản phẩm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20700, 56, '1', 'Nghĩa từ Việt của từ 質 là:', 'quan tâm, thông cảm', 'lịch, kế hoạch', 'cảm thấy', 'chất lượng', 'chất lượng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20701, 56, '1', 'Nghĩa từ Việt của từ 型 là:', 'lần lượt', 'thiết kế', 'hỏng', 'mẫu', 'mẫu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20702, 56, '1', 'Nghĩa từ Việt của từ 生産 là:', 'sản xuất', 'giữ', 'tài nguyên', 'nhớ lại', 'sản xuất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20703, 56, '1', 'Nghĩa từ Việt của từ 消費 là:', 'tiêu dùng, tiêu thụ', 'tách ra', 'làm giảm xuống', 'vừa, được công bố', 'tiêu dùng, tiêu thụ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20704, 56, '1', 'Nghĩa từ Việt của từ 物価 là:', 'kết quả', 'chính xác', 'kết thúc', 'giá cả, vật giá', 'giá cả, vật giá');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20705, 56, '1', 'Nghĩa từ Việt của từ 倒産 là:', 'lớn lên, tăng thêm, dài ra', 'phá sản', 'đón', 'da', 'phá sản');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20706, 56, '1', 'Nghĩa từ Việt của từ 携帯 là:', 'cắt, hết hạn', 'tiến lên', 'đại thể, thường', 'mang theo', 'mang theo');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20707, 56, '1', 'Nghĩa từ Việt của từ 現代 là:', 'hiện tại', 'qua', 'nấu', 'tội phạm', 'hiện tại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20708, 56, '1', 'Nghĩa từ Việt của từ 世紀 là:', 'như mọi khi', 'trung bình', 'thế kỷ', 'được bao phủ', 'thế kỷ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20709, 56, '1', 'Nghĩa từ Việt của từ 文化 là:', 'tờ rơi', 'văn hóa', 'top', 'trình độ, level', 'văn hóa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20710, 56, '1', 'Nghĩa từ Việt của từ 都市 là:', 'giải quyết', 'thành phố', 'tờ rơi', 'văn hóa', 'thành phố');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20711, 56, '1', 'Nghĩa từ Việt của từ 地方 là:', 'xung quanh', 'quảng cáo', 'địa phương', 'tổ chức', 'địa phương');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20712, 56, '1', 'Nghĩa từ Việt của từ 戦争 là:', 'đối lập', 'nói chuyện riêng', 'mất', 'chiến tranh', 'chiến tranh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20713, 56, '1', 'Nghĩa từ Việt của từ 平和 là:', 'xung quanh', 'bị lột', 'dọn dẹp', 'hòa bình', 'hòa bình');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20714, 56, '1', 'Nghĩa từ Việt của từ 上る là:', 'đặc biệt là', 'leo lên', 'bầu cử', 'đàn ông', 'leo lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20715, 56, '1', 'Nghĩa từ Việt của từ 下る là:', 'hoàn thành', 'ngại ngần', 'đi xuống', 'robot', 'đi xuống');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20716, 56, '1', 'Nghĩa từ Việt của từ 進む là:', 'tiến lên', 'sắp', '(mặt trời) chiếu sáng, mở (ô), nhỏ (thuốc mắt)', 'tóm, chộp', 'tiến lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20717, 56, '1', 'Nghĩa từ Việt của từ 進める là:', 'xuất hiện, được thẻ hiện', 'bị sai', 'mặt trời', 'làm cho tiến lên', 'làm cho tiến lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20718, 56, '1', 'Nghĩa từ Việt của từ 通る là:', 'đăng ký', 'nữa', 'thông qua, được chấp nhận, đi qua', 'bầu cử', 'thông qua, được chấp nhận, đi qua');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20719, 56, '1', 'Nghĩa từ Việt của từ 通す là:', 'xuyên qua, thông qua', 'nhãn', 'cần thiết', 'trạng thái', 'xuyên qua, thông qua');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20720, 57, '1', 'Nghĩa từ Việt của từ 超える・越える là:', 'thuê', 'tự động', 'vượt qua', 'thoải mái', 'vượt qua');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20721, 57, '1', 'Nghĩa từ Việt của từ 過ぎる là:', 'quá, đi qua', 'cúi chào', 'đăng ký', 'bắt', 'quá, đi qua');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20722, 57, '1', 'Nghĩa từ Việt của từ 過ごす là:', 'kiến thức', 'sử dụng(thời gian)', 'yên tâm', 'ngủ', 'sử dụng(thời gian)');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20723, 57, '1', 'Nghĩa từ Việt của từ 移る là:', 'được chuyển', 'điều hòa ấm', 'nhảy', 'phát kiến', 'được chuyển');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20724, 57, '1', 'Nghĩa từ Việt của từ 移す là:', 'rán ngập', 'đại thể, thường', 'chuyển', 'nguyên nhân', 'chuyển');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20725, 57, '1', 'Nghĩa từ Việt của từ 連れる là:', 'khỏe khoắn', 'dẫn đi', 'tình nguyện', 'tính chất', 'dẫn đi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20726, 57, '1', 'Nghĩa từ Việt của từ 寄る là:', 'phát kiến', 'lần lượt, tương ứng', 'đùa cợt', 'ghé sát, lại gần', 'ghé sát, lại gần');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20727, 57, '1', 'Nghĩa từ Việt của từ 寄せる là:', 'ngại ngần', 'ghé vào', 'tính cách', 'hàng', 'ghé vào');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20728, 57, '1', 'Nghĩa từ Việt của từ 与える là:', 'xung quanh, vòng quanh', 'chủ yếu, khá', 'trao, cung cấp', 'được dạy', 'trao, cung cấp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20729, 57, '1', 'Nghĩa từ Việt của từ 得る là:', 'vượt, lướt', 'đạt được, có được', 'dđóng', 'tăng giá', 'đạt được, có được');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20730, 57, '1', 'Nghĩa từ Việt của từ 向く là:', 'hướng, đối diện', 'trạng thái', 'xấu bụng', 'tội phạm', 'hướng, đối diện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20731, 57, '1', 'Nghĩa từ Việt của từ 向ける là:', 'hướng đến, quay', 'nuôi(râu)', 'bị giảm', 'được thống nhất, được tổ chức, được sắp xếp', 'hướng đến, quay');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20732, 57, '1', 'Nghĩa từ Việt của từ 勧める là:', 'rủ, mời, gợi ý', 'cuộc sống', 'tự động', 'nhãn hiệu', 'rủ, mời, gợi ý');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20733, 57, '1', 'Nghĩa từ Việt của từ 薦める là:', 'được bao phủ', 'nghỉ việc', 'giới thiệu, gợi ý', 'bầu cử', 'giới thiệu, gợi ý');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20734, 57, '1', 'Nghĩa từ Việt của từ 任せる là:', 'giảm xuống', 'tin tưởng, để cho ai đó làm gì', 'làm cho tiến lên', 'làm bẩn', 'tin tưởng, để cho ai đó làm gì');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20735, 57, '1', 'Nghĩa từ Việt của từ 守る là:', 'sâu hơn', 'giữ, tuân thủ, bảo vệ', 'phát minh', 'tình nguyện', 'giữ, tuân thủ, bảo vệ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20736, 57, '1', 'Nghĩa từ Việt của từ 争う là:', 'trái đất', 'gây gổ, tranh giành', 'đóng gói', 'cúi chào', 'gây gổ, tranh giành');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20737, 57, '1', 'Nghĩa từ Việt của từ 臨む là:', 'thuê', 'ước', 'buồn bã', 'kiên quyết, chắc chắn, đáng tin cậy', 'ước');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20738, 57, '1', 'Nghĩa từ Việt của từ 信じる là:', 'quan tâm, thông cảm', 'khác', 'xuất hiện, được thẻ hiện', 'tin tưởng', 'tin tưởng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20739, 57, '1', 'Nghĩa từ Việt của từ 通じる là:', 'nhóm', 'buồn bã', 'làm rộng ra', 'hiểu, thông qua', 'hiểu, thông qua');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20740, 57, '1', 'Nghĩa từ Việt của từ 飽きる là:', 'thịnh vượng', 'chán, ngấy', 'hòa bình', 'bị giảm', 'chán, ngấy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20741, 57, '1', 'Nghĩa từ Việt của từ 思いつく là:', 'điều hòa ấm', 'chính xác', 'điều hòa ấm', 'nghĩ về', 'nghĩ về');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20742, 57, '1', 'Nghĩa từ Việt của từ 思いやる là:', 'khác', 'giao vào, lẫn vào', 'thân thiết', 'quan tâm, thông cảm', 'quan tâm, thông cảm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20743, 57, '1', 'Nghĩa từ Việt của từ 熱中する là:', 'nghiện', 'giải quyết', 'văn hóa', 'chi tiết', 'nghiện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20744, 57, '1', 'Nghĩa từ Việt của từ 暮らす là:', 'đánh thức', 'tiết kiệm', 'sống', 'sản phẩm', 'sống');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20745, 57, '1', 'Nghĩa từ Việt của từ 巻く là:', 'tính chất', 'cắt, hết hạn', 'cho chảy', 'quấn, quàng', 'quấn, quàng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20746, 57, '1', 'Nghĩa từ Việt của từ 結ぶ là:', 'buộc, cột, nối', 'cấm', 'điều hòa ấm', 'trái đất', 'buộc, cột, nối');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20747, 57, '1', 'Nghĩa từ Việt của từ 済む là:', 'kết thúc', 'hóa đơn', 'ngại ngần', 'cuộc sống', 'kết thúc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20748, 57, '1', 'Nghĩa từ Việt của từ 済ませる・済ます là:', 'hoàn tất', 'giả', 'dần dần', 'ghê, siêu', 'hoàn tất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20749, 57, '1', 'Nghĩa từ Việt của từ 出来る là:', 'mời, rủ', 'có thể, được xây dựng', 'làm lạnh', 'hòa bình', 'có thể, được xây dựng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20750, 57, '1', 'Nghĩa từ Việt của từ 切れる là:', 'bị giảm', 'không thể ngờ, không', 'cắt, hết hạn', 'làm cho tiến lên', 'cắt, hết hạn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20751, 57, '1', 'Nghĩa từ Việt của từ 切らす là:', 'hết', 'làm rộng ra', 'lượt', 'làm tăng lên', 'hết');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20752, 57, '1', 'Nghĩa từ Việt của từ 伝わる là:', 'được truyền đi, được trải ra, được giới thiệu', 'thoải mái', 'hỏng', 'đông đúc', 'được truyền đi, được trải ra, được giới thiệu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20753, 57, '1', 'Nghĩa từ Việt của từ 伝える là:', 'truyền đi, giới thiệu', 'kiểu, thói', 'đoàn thể', 'đặc biệt là', 'truyền đi, giới thiệu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20754, 57, '1', 'Nghĩa từ Việt của từ 続く là:', 'tiếp tục, xảy ra, lặp lại, theo sau', 'khẩn cấp, vội', 'kiến thức', 'hớn hở', 'tiếp tục, xảy ra, lặp lại, theo sau');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20755, 57, '1', 'Nghĩa từ Việt của từ 続ける là:', 'quê quán', 'nuôi(râu)', 'tiếp tục, xảy ra liên tiếp', 'bên trong', 'tiếp tục, xảy ra liên tiếp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20756, 57, '1', 'Nghĩa từ Việt của từ つながる là:', 'bề trên', 'máu', 'được kết nối, được mở rộng, thông qua', 'kiên quyết, chắc chắn, đáng tin cậy', 'được kết nối, được mở rộng, thông qua');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20757, 57, '1', 'Nghĩa từ Việt của từ つなぐ là:', 'tập hợp, sàng lọc, hợp nhất, tổ chức', 'thế thì', 'tràn', 'kết nối, tham gia', 'kết nối, tham gia');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20758, 57, '1', 'Nghĩa từ Việt của từ つなげる là:', 'tham quan', 'khát', 'kết nối, làm chặt thêm', 'nghiện', 'kết nối, làm chặt thêm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20759, 57, '1', 'Nghĩa từ Việt của từ 伸びる là:', 'cài đặt, set', 'được dạy', 'lớn lên, tăng thêm, dài ra', 'nhóm', 'lớn lên, tăng thêm, dài ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20760, 57, '1', 'Nghĩa từ Việt của từ 伸ばす là:', 'tươi', 'nghỉ việc', 'cầu, khấn', 'nuôi dài, căng ra', 'nuôi dài, căng ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20761, 57, '1', 'Nghĩa từ Việt của từ 延びる là:', 'khởi động', 'bị trì hoãn, bị kéo dài', 'rán ngập', 'thoải mái', 'bị trì hoãn, bị kéo dài');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20762, 57, '1', 'Nghĩa từ Việt của từ 延ばす là:', 'cháy', 'yêu cầu', 'trì hoãn, kéo dài', 'cháy', 'trì hoãn, kéo dài');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20763, 57, '1', 'Nghĩa từ Việt của từ 重なる là:', 'tiết kiệm', 'bao gồm', 'đào tạo', 'xung đột, xếp chồng', 'xung đột, xếp chồng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20764, 57, '1', 'Nghĩa từ Việt của từ 重ねる là:', 'top', 'chồng lên, tích trữ', 'thể lực', 'thời gian, thời kỳ', 'chồng lên, tích trữ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20765, 57, '1', 'Nghĩa từ Việt của từ 広がる là:', 'mở rộng, bùng phát, lan tràn, trải dài', 'sở thích', 'nổi tiếng', 'năng lượng', 'mở rộng, bùng phát, lan tràn, trải dài');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20766, 57, '1', 'Nghĩa từ Việt của từ 広げる là:', 'ghê, siêu', 'truyền đi, giới thiệu', 'mở thêm, mở rộng, nới rộng, mở ra', 'quê quán', 'mở thêm, mở rộng, nới rộng, mở ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20767, 57, '1', 'Nghĩa từ Việt của từ 載る là:', 'đáy', 'vừa, được công bố', 'danh thiếp', 'bị lạnh', 'vừa, được công bố');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20768, 57, '1', 'Nghĩa từ Việt của từ 載せる là:', 'cho vào, cho lên, công bố', 'trị liệu', 'bọc', 'người trưởng thành', 'cho vào, cho lên, công bố');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20769, 57, '1', 'Nghĩa từ Việt của từ そろう là:', 'phát kiến', 'làm yếu đi', 'hòa bình', 'thu thập, được thu thập', 'thu thập, được thu thập');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20770, 57, '1', 'Nghĩa từ Việt của từ そろえる là:', 'bao gồm', 'chịu đựng giỏi', 'mũ bảo hiểm', 'gom lại, chuẩn bị sẵn sàng', 'gom lại, chuẩn bị sẵn sàng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20771, 57, '1', 'Nghĩa từ Việt của từ まとまる là:', 'quê quán', 'lấy cắp', 'có lẽ', 'được thống nhất, được tổ chức, được sắp xếp', 'được thống nhất, được tổ chức, được sắp xếp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20772, 57, '1', 'Nghĩa từ Việt của từ まとめる là:', 'chiều cao', 'được giao đến', 'tập hợp, sàng lọc, hợp nhất, tổ chức', 'gần như hoàn toàn', 'tập hợp, sàng lọc, hợp nhất, tổ chức');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20773, 57, '1', 'Nghĩa từ Việt của từ 付く là:', 'quê quán', 'làm gãy', 'dính, gắn, đạt được, đi cùng với', 'chán', 'dính, gắn, đạt được, đi cùng với');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20774, 57, '1', 'Nghĩa từ Việt của từ 付ける là:', 'gắn, thêm vào', 'thoải mái', 'ôm', 'yêu cầu', 'gắn, thêm vào');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20775, 57, '1', 'Nghĩa từ Việt của từ たまる là:', 'giúp đỡ', 'hòa bình', 'cảm tưởng', 'được tiết kiệm', 'được tiết kiệm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20776, 57, '1', 'Nghĩa từ Việt của từ ためる là:', 'thất nghiệp', 'đối tác', 'bị thừa', 'tiết kiệm', 'tiết kiệm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20777, 57, '1', 'Nghĩa từ Việt của từ 交じる・混じる là:', 'vào đại học', 'quan trọng', 'giao vào, lẫn vào', 'đông đúc', 'giao vào, lẫn vào');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20778, 57, '1', 'Nghĩa từ Việt của từ 交ざる・混ざる là:', 'phép cộng, tác động tích cực', 'được trộn lẫn', 'tiền lẻ', 'vừa vặn, đúng', 'được trộn lẫn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20779, 57, '1', 'Nghĩa từ Việt của từ 交ぜる・混ぜる là:', 'con dấu', 'không ngờ đến', 'lừa', 'trộn vào', 'trộn vào');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20780, 57, '1', 'Nghĩa từ Việt của từ 解ける・溶ける là:', 'được giải quyết, nóng chảy', 'tham quan', 'tham quan', 'làm cho kịp giờ', 'được giải quyết, nóng chảy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20781, 57, '1', 'Nghĩa từ Việt của từ 解く・溶く là:', 'che giấu', 'giải quyết, nóng chảy', 'thăm', 'mượn', 'giải quyết, nóng chảy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20782, 57, '1', 'Nghĩa từ Việt của từ 含む là:', 'chứa, bao gồm', 'yêu cầu', 'được bao phủ', 'thiết kế', 'chứa, bao gồm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20783, 57, '1', 'Nghĩa từ Việt của từ 含める là:', 'dựng lên', 'bao gồm', 'loại', 'nướng, nấu', 'bao gồm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20784, 57, '1', 'Nghĩa từ Việt của từ 抜ける là:', 'cấp trên', 'đào tạo', 'mặt trời', 'tháo, tuột', 'tháo, tuột');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20785, 57, '1', 'Nghĩa từ Việt của từ 抜く là:', 'văn hóa', 'được giao đến', 'lấy ra', 'nghỉ việc', 'lấy ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20786, 57, '1', 'Nghĩa từ Việt của từ 現れる là:', 'cấm', 'xuất hiện, được thẻ hiện', 'tiết kiệm', 'sở thích', 'xuất hiện, được thẻ hiện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20787, 57, '1', 'Nghĩa từ Việt của từ 現す là:', 'dựng lên', 'xuất hiện, hiện ra', 'trang trí', 'bị chôn', 'xuất hiện, hiện ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20788, 57, '1', 'Nghĩa từ Việt của từ 表れる là:', 'biểu hiện (trên mặt)', 'tách ra', 'hóa đơn', 'da', 'biểu hiện (trên mặt)');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20789, 57, '1', 'Nghĩa từ Việt của từ 表す là:', 'biểu thị, biểu lộ, đại diện', 'bao gồm', 'cháy', 'cổ vũ', 'biểu thị, biểu lộ, đại diện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20790, 57, '1', 'Nghĩa từ Việt của từ 散る là:', 'khác', 'bị tàn, rụng', 'thuê', 'tham quan', 'bị tàn, rụng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20791, 57, '1', 'Nghĩa từ Việt của từ 散らす là:', 'tàn', 'hỗn tạp', 'được xây', 'mọc', 'tàn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20792, 57, '1', 'Nghĩa từ Việt của từ 明ける là:', 'trào lưu', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'giảm', 'thông tin', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20793, 57, '1', 'Nghĩa từ Việt của từ 差す là:', 'sau cùng, cuối cùng, sau tất cả', 'phát minh', 'tiến lên', '(mặt trời) chiếu sáng, mở (ô), nhỏ (thuốc mắt)', '(mặt trời) chiếu sáng, mở (ô), nhỏ (thuốc mắt)');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20794, 57, '1', 'Nghĩa từ Việt của từ パートナ là:', 'được nấu', 'đối tác', 'khởi đầu', 'giận dữ', 'đối tác');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20795, 57, '1', 'Nghĩa từ Việt của từ リーダー là:', 'tự do', 'lãnh đạo', 'giao đến', 'xung quanh, vòng quanh', 'lãnh đạo');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20796, 57, '1', 'Nghĩa từ Việt của từ ボランティア là:', 'trung bình', 'giảm xuống', 'bất mãn', 'tình nguyện', 'tình nguyện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20797, 57, '1', 'Nghĩa từ Việt của từ コミュニケーション là:', 'nhóm', 'giao tiếp', 'suốt, nhiều', 'mời, rủ', 'giao tiếp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20798, 57, '1', 'Nghĩa từ Việt của từ ユーモア là:', 'mất', 'cổ vũ', 'hài hước, đùa', 'giết', 'hài hước, đùa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20799, 57, '1', 'Nghĩa từ Việt của từ ショック là:', 'hòa bình', 'shock, choáng', 'điều hòa ấm', 'sơn', 'shock, choáng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20800, 57, '1', 'Nghĩa từ Việt của từ ストレス là:', 'phát triển', 'nuôi(râu)', 'căng thẳng, stress', 'phát kiến', 'căng thẳng, stress');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20801, 57, '1', 'Nghĩa từ Việt của từ バランス là:', 'làm rộng ra', '(mặt trời) chiếu sáng, mở (ô), nhỏ (thuốc mắt)', 'cân bằng', 'văn hóa', 'cân bằng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20802, 57, '1', 'Nghĩa từ Việt của từ レベル là:', 'nhựa', 'trình độ, level', 'dũng cảm, dũng khí', 'phát minh', 'trình độ, level');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20803, 57, '1', 'Nghĩa từ Việt của từ アップ là:', 'thế nào, bao nhiêu', 'truyền đi, giới thiệu', 'tăng lên', 'phạm vi', 'tăng lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20804, 57, '1', 'Nghĩa từ Việt của từ ダウン là:', 'giảm xuống', 'cảm động', 'không bao giờ', 'được xây', 'giảm xuống');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20805, 57, '1', 'Nghĩa từ Việt của từ プラス là:', 'đại thể, thường', 'phát triển', 'phép cộng, tác động tích cực', 'ghé vào', 'phép cộng, tác động tích cực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20806, 57, '1', 'Nghĩa từ Việt của từ マイナス là:', 'tình nguyện', 'phép trừ, tác động tiêu cực', 'thất nghiệp', 'trao, cung cấp', 'phép trừ, tác động tiêu cực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20807, 57, '1', 'Nghĩa từ Việt của từ イメージ là:', 'hình ảnh', 'tháo, tuột', 'dựng lên', 'về quê', 'hình ảnh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20808, 57, '1', 'Nghĩa từ Việt của từ コンテスト là:', 'quan trọng', 'cố hương', 'cảm thấy', 'cuộc thi', 'cuộc thi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20809, 57, '1', 'Nghĩa từ Việt của từ マスコミ là:', 'lẫn nhau', 'có thể, được xây dựng', 'thông tin truyền thông', 'kết nối, làm chặt thêm', 'thông tin truyền thông');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20810, 57, '1', 'Nghĩa từ Việt của từ プライバシー là:', 'sản phẩm', 'cá nhân, riêng tư', 'loại', 'chính xác', 'cá nhân, riêng tư');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20811, 57, '1', 'Nghĩa từ Việt của từ オフィス là:', 'cài đặt, set', 'loáng một cái', 'người trưởng thành', 'văn phòng', 'văn phòng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20812, 57, '1', 'Nghĩa từ Việt của từ ルール là:', 'luật lệ', 'kẹt xỉ', 'lỗ', 'sau cùng, cuối cùng, sau tất cả', 'luật lệ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20813, 57, '1', 'Nghĩa từ Việt của từ マナー là:', 'kiểu, thói', 'cao nhất', 'say', 'bất an', 'kiểu, thói');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20814, 57, '1', 'Nghĩa từ Việt của từ ミス là:', 'phát minh', 'lo lắng', 'lỗi', 'mất', 'lỗi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20815, 57, '1', 'Nghĩa từ Việt của từ スケジュール là:', 'hỏng', 'giả', 'lịch, kế hoạch', 'xuất hiện, được thẻ hiện', 'lịch, kế hoạch');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20816, 57, '1', 'Nghĩa từ Việt của từ タイトル là:', 'bị ướt', 'thăm', 'tiêu đề', 'mũ bảo hiểm', 'tiêu đề');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20817, 57, '1', 'Nghĩa từ Việt của từ テーマ là:', 'chủ đề', 'tiền bối', 'đăng ký', 'nhất định', 'chủ đề');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20818, 57, '1', 'Nghĩa từ Việt của từ ストーリー là:', 'toàn bộ', 'dựng lên', 'câu chuyện', 'trình độ, level', 'câu chuyện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20819, 57, '1', 'Nghĩa từ Việt của từ ヒット là:', 'thông tin', 'xung quanh', 'vất vả, mệt mỏi', 'nổi tiếng', 'nổi tiếng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20820, 57, '1', 'Nghĩa từ Việt của từ ブランド là:', 'nướng, nấu', 'nhãn hiệu', 'lặp lại', 'da', 'nhãn hiệu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20821, 57, '1', 'Nghĩa từ Việt của từ レンタル là:', 'giảm', 'thuê', 'che giấu', 'đăng ký', 'thuê');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20822, 57, '1', 'Nghĩa từ Việt của từ リサイクル là:', 'bằng cấp, tư cách', 'tái chế', 'trái đất', 'tính chất', 'tái chế');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20823, 57, '1', 'Nghĩa từ Việt của từ ラベル là:', 'nhãn', 'thiệt hại', 'đạt được, có được', 'kiến thức', 'nhãn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20824, 57, '1', 'Nghĩa từ Việt của từ タイプ là:', 'loại', 'thức dậy', 'bề trên', 'ôm', 'loại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20825, 57, '1', 'Nghĩa từ Việt của từ スタイル là:', 'có lẽ', 'giết', 'kiểu dáng', 'kịp giờ', 'kiểu dáng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20826, 57, '1', 'Nghĩa từ Việt của từ セット là:', 'cài đặt, set', 'quan tâm, thông cảm', 'chụp', 'trái đất', 'cài đặt, set');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20827, 57, '1', 'Nghĩa từ Việt của từ ウイルス là:', 'virus', 'gửi', 'thế thì', 'giúp đỡ', 'virus');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20828, 57, '1', 'Nghĩa từ Việt của từ ロボット là:', 'mạnh lên', 'về quê', 'thực hành', 'robot', 'robot');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20829, 57, '1', 'Nghĩa từ Việt của từ エネルギー là:', 'bằng mọi giá, rất (muốn)', 'năng lượng', 'toàn bộ', 'tiến bộ', 'năng lượng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20830, 57, '1', 'Nghĩa từ Việt của từ デジタル là:', 'bị giảm', 'kỹ thuật số', 'lần lượt, tương ứng', 'năng lượng', 'kỹ thuật số');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20831, 57, '1', 'Nghĩa từ Việt của từ マイク là:', 'hiểu, thông qua', 'bầu cử', 'microphone, ghi âm', 'mở rộng, bùng phát, lan tràn, trải dài', 'microphone, ghi âm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20832, 57, '1', 'Nghĩa từ Việt của từ ブレーキ là:', 'lừa', 'phanh', 'bị chôn', 'đàn ông', 'phanh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20833, 57, '1', 'Nghĩa từ Việt của từ ペンキ là:', 'nghiện', 'cay cú', 'sơn', 'so sánh', 'sơn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20834, 57, '1', 'Nghĩa từ Việt của từ 炊ける là:', 'tiến lên', 'kiểu, thói', 'được nấu', 'giải quyết', 'được nấu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20835, 57, '1', 'Nghĩa từ Việt của từ 炊く là:', 'suy nghĩ, cảm giác', 'vô ý, buột', 'tiến lên', 'nấu', 'nấu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20836, 57, '1', 'Nghĩa từ Việt của từ 煮える là:', 'xây', 'được nấu, được ninh', 'thu thập, được thu thập', 'giá cả, vật giá', 'được nấu, được ninh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20837, 57, '1', 'Nghĩa từ Việt của từ 煮る là:', 'nấu, ninh, luộc', 'suốt đời', 'rung, vẫy', 'nhãn hiệu', 'nấu, ninh, luộc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20838, 57, '1', 'Nghĩa từ Việt của từ 炒める là:', 'mang đến gần', 'rán', 'đánh', 'ghi lại', 'rán');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20839, 57, '1', 'Nghĩa từ Việt của từ 焼ける là:', 'được nấu, được nướng', 'da', 'làm nguội', 'quốc tịch', 'được nấu, được nướng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20840, 58, '1', 'Nghĩa từ Việt của từ 焼く là:', 'hỏng', 'bọc', 'nướng, nấu', 'hướng đến, quay', 'nướng, nấu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20841, 58, '1', 'Nghĩa từ Việt của từ ゆでる là:', 'luộc', 'vỗ tay', 'giống', 'da', 'luộc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20842, 58, '1', 'Nghĩa từ Việt của từ 揚げる là:', 'phát triển', 'rán ngập', 'bị chôn', 'điều hòa ấm', 'rán ngập');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20843, 58, '1', 'Nghĩa từ Việt của từ 蒸す là:', 'thức dậy', 'ghé sát, lại gần', 'hấp', 'bất an', 'hấp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20844, 58, '1', 'Nghĩa từ Việt của từ ぐっすり là:', 'khác', 'suốt đời', 'say', 'shock, choáng', 'say');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20845, 58, '1', 'Nghĩa từ Việt của từ きちんと là:', 'bị thừa', 'thuê', 'cảm thấy', 'ngay ngắn', 'ngay ngắn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20846, 58, '1', 'Nghĩa từ Việt của từ しっかり là:', 'kiên quyết, chắc chắn, đáng tin cậy', 'hối hận', 'hồi phục', 'sau cùng, cuối cùng, sau tất cả', 'kiên quyết, chắc chắn, đáng tin cậy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20847, 58, '1', 'Nghĩa từ Việt của từ はっきり là:', 'rõ ràng', 'tiến lên', 'tách ra', 'bị gãy', 'rõ ràng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20848, 58, '1', 'Nghĩa từ Việt của từ じっと là:', 'con dấu', 'kiên nhẫn, chăm chú, chằm chằm', 'đặc trưng', 'vất vả, mệt mỏi', 'kiên nhẫn, chăm chú, chằm chằm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20849, 58, '1', 'Nghĩa từ Việt của từ そっと là:', 'tự kiểm tra', 'nhẹ nhàng, yên lặng', 'cháy', 'thịnh vượng', 'nhẹ nhàng, yên lặng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20850, 58, '1', 'Nghĩa từ Việt của từ 別々に là:', 'tiền bối', 'riêng biệt', 'giảm', 'phương đông', 'riêng biệt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20851, 58, '1', 'Nghĩa từ Việt của từ それぞれ là:', 'chịu đựng giỏi', 'lần lượt, tương ứng', 'văn hóa', 'ngon', 'lần lượt, tương ứng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20852, 58, '1', 'Nghĩa từ Việt của từ 互いに là:', 'đủ', 'bị giảm', 'lẫn nhau', 'gián đoạn', 'lẫn nhau');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20853, 58, '1', 'Nghĩa từ Việt của từ 直接 là:', 'trực tiếp', 'chiêu đãi', 'làm bẩn', 'da', 'trực tiếp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20854, 58, '1', 'Nghĩa từ Việt của từ 本当に là:', 'thật lòng, kỳ thực', 'về quê', 'ghé vào', 'ghi lại', 'thật lòng, kỳ thực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20855, 58, '1', 'Nghĩa từ Việt của từ 必ず là:', 'kiến thức', 'quan trọng', 'chắc chắn', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'chắc chắn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20856, 58, '1', 'Nghĩa từ Việt của từ 絶対に là:', 'tính chất', 'tốt, đủ', 'đóng gói', 'chắc chắn rồi', 'chắc chắn rồi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20857, 58, '1', 'Nghĩa từ Việt của từ 特に là:', 'bảnh bao', 'đặc biệt là', 'nhất định', 'tiết kiệm', 'đặc biệt là');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20858, 58, '1', 'Nghĩa từ Việt của từ ただ là:', 'đông đúc', 'chỉ', 'bị đánh', 'chuyển nhà', 'chỉ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20859, 58, '1', 'Nghĩa từ Việt của từ 少なくとも là:', 'ghé vào', 'vô lý', 'ít nhất', 'bị gãy', 'ít nhất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20860, 58, '1', 'Nghĩa từ Việt của từ 決して là:', 'quấn, quàng', 'tắc đường', 'dựng lên', 'không bao giờ', 'không bao giờ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20861, 58, '1', 'Nghĩa từ Việt của từ 少しも là:', 'hội, tiệc', 'thấp nhất', 'một chút', 'mọc', 'một chút');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20862, 58, '1', 'Nghĩa từ Việt của từ ちっとも là:', 'dán', 'nấm mốc', '(không) tí gì', 'bình thường', '(không) tí gì');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20863, 58, '1', 'Nghĩa từ Việt của từ 全く là:', 'hoạt động', 'hoàn toàn (không)', 'giận dữ', 'mời, rủ', 'hoàn toàn (không)');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20864, 58, '1', 'Nghĩa từ Việt của từ とても là:', 'thông dịch', 'rất', 'rung, vẫy', 'vết thương', 'rất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20865, 58, '1', 'Nghĩa từ Việt của từ どんなに là:', 'tiền lẻ', 'rất', 'thế nào, bao nhiêu', 'tài nguyên', 'thế nào, bao nhiêu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20866, 58, '1', 'Nghĩa từ Việt của từ どうしても là:', 'bầu cử', 'kiểu gì cũng', 'cao nhất', 'như mọi khi', 'kiểu gì cũng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20867, 58, '1', 'Nghĩa từ Việt của từ まるで là:', 'như là', 'ký sự', 'sống', 'lớn lên, tăng thêm, dài ra', 'như là');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20868, 58, '1', 'Nghĩa từ Việt của từ 一体 là:', 'cái quái gì', 'tươi', 'suốt đời', 'đủ', 'cái quái gì');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20869, 58, '1', 'Nghĩa từ Việt của từ 別に là:', 'chăm sóc', '(không) có gì', 'mũ bảo hiểm', 'lý giải', '(không) có gì');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20870, 58, '1', 'Nghĩa từ Việt của từ たった là:', 'đăng ký', 'quan hệ', 'bị ướt', 'chỉ', 'chỉ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20871, 58, '1', 'Nghĩa từ Việt của từ ほんの là:', 'lý giải', 'tuyên truyền', 'một chút', 'giống', 'một chút');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20872, 58, '1', 'Nghĩa từ Việt của từ それで là:', 'thuê', 'kiểu gì cũng', 'sôi', 'thế thì', 'thế thì');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20873, 58, '1', 'Nghĩa từ Việt của từ そこで là:', 'nghệ thuật', 'cầu, khấn', 'tiếp theo', 'trung bình', 'tiếp theo');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20874, 58, '1', 'Nghĩa từ Việt của từ そのうえ là:', 'làm rộng ra', 'thế kỷ', 'hơn nữa', 'xung đột, xếp chồng', 'hơn nữa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20875, 58, '1', 'Nghĩa từ Việt của từ また là:', 'hiểu, thông qua', 'nữa', 'lo lắng', 'mạnh, giỏi', 'nữa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20876, 58, '1', 'Nghĩa từ Việt của từ または là:', 'hoặc', 'được sinh ra', 'được tìm thấy', 'bao phủ', 'hoặc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20877, 58, '1', 'Nghĩa từ Việt của từ それとも là:', 'quê quán', 'hàng', 'triệu chứng', 'hoặc', 'hoặc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20878, 58, '1', 'Nghĩa từ Việt của từ つまり là:', 'bị gãy', 'nói cách khác', 'bị chôn', 'sinh', 'nói cách khác');
    
