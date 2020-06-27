CREATE EXTENSION pgcrypto;

-- ----------- user_account -----------
INSERT INTO user_account (id, first_name, last_name, email, password_hash, role, profile_image, description, location, web, created_at) 
VALUES ('mrypq', 'めろ子', 'めろ田',
'meromero@mero.com',  crypt('meromero', gen_salt('bf')), 'admin',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/profile_image.jpeg',
'めろぴっぴです', 'めろ王国', 'https://github.com/mrypq', '2020-01-01 10:10:10+09'
);

INSERT INTO user_account (id, first_name, last_name, email, password_hash, role, profile_image, description, location, web, created_at) 
VALUES ('mrypq2', 'めろ美', 'めろ川',
'meromero2@mero.com', crypt('meromero2', gen_salt('bf')), 'user',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/profile_image_2.jpg',
'２番手のめろぴっぴです', 'めろ帝国', 'https://github.com/teamb-prince', '2020-02-02 20:20:20+09'
);

-- ----------- board -----------
INSERT INTO board (id, user_id, name, topic_id, description, created_at)
VALUES ('596e415e-f74e-46ab-b0dc-a00c70efb8f3', 'mrypq',
'行きたいスポット', '8083e9df-e30e-457f-b853-2bb70fbb025b',
'めろの行きたいところです', '2019-07-07 07:07:07+09'
);

INSERT INTO board (id, user_id, name, topic_id, description, created_at)
VALUES ('6a8a04cb-bd3b-4606-b88c-593dc4e51d63', 'mrypq',
'LoL skins', '004d09c5-c788-4468-9b68-96b5735ced9b',
'league of legends / skin collection', '2019-07-08 07:07:07+09'
); 

INSERT INTO board (id, user_id, name, topic_id, description, created_at)
VALUES ('3b7de911-dc1b-445f-8593-47af710707b5', 'mrypq',
'KAT-TUN', '8083e9df-e30e-457f-b853-2bb70fbb025b',
'', '2019-07-09 07:07:07+09'
);

INSERT INTO board (id, user_id, name, topic_id, description, created_at)
VALUES ('ab339fe0-c32c-46e8-87c1-befcfee42d28', 'mrypq',
'ごはん', '1ca44c07-f20c-4992-89bd-aa8e66997c02',
'', '2019-07-10 07:07:07+09'
);

INSERT INTO board (id, user_id, name, topic_id, description, created_at)
VALUES ('9220ecec-0c44-447c-93b6-1903e3209a91', 'mrypq2',
'池袋', '8083e9df-e30e-457f-b853-2bb70fbb025b',
'', '2019-07-11 07:07:07+09'
);

INSERT INTO board (id, user_id, name, topic_id, description, created_at)
VALUES ('ca4550c7-0ddb-44c2-bda7-aa32bc066a99', 'mrypq2',
'ねこ', 'cf76d2ed-a255-4363-a9d2-855170e1fee6',
'', '2020-02-12 07:07:07+09'
);

INSERT INTO board (id, user_id, name, topic_id, description, created_at)
VALUES ('0910d8c3-2a26-4a8d-bf24-c46e2e5718ea', 'mrypq',
'Makeup', '2c51528d-e6c4-4126-bc09-26fd847c0834',
'makeup & beauty', '2019-12-12 07:07:07+09'
);


-- ----------- pin -----------
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('12130347-8e9c-4a27-8fcb-2aeaea38c196', 
'mrypq',
'https://www.canmake.com/topics/detail/18',
'今年の夏ネイル第１弾はユニコーンカラー♡ | CANMAKE（キャンメイク）',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/ucnail_news%26topics.jpg',
'',
'url',
'2020-02-22 12:30:22+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('ca1fd1bb-7cae-443d-bdb2-25ad4c50790c', 
'mrypq',
'https://ex-ichiba.jp/blog/2020/03/05/post_698/',
'エクステで作る！エクステグラデーションスタイル | 渋谷にある傷ま ...',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/IMG_2368-650x645.jpg',
'',
'url',
'2020-02-22 12:30:22+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('7cbffef8-1c4a-4faa-9953-821177b5bddf', 
'mrypq',
'https://favor.life/27484',
'シャネルの新作リップ『ルージュ アリュール インク フュージョン ...',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/27484-time.jpg',
'',
'url',
'2020-02-22 12:20:22+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('befa1ab8-3a18-4580-a206-5f531c20f9da', 
'mrypq',
'https://www.fashion-press.net/news/54016',
'シュウ ウエムラ × ポケモン「ピカシュウ」クリスマスコスメ、注目アイテムランキングTOP5も',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/ZRw.jpg',
'クリスマスコフレ❤︎',
'url',
'2020-02-22 12:10:22+09');


INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('cc2a8e31-725f-473e-9637-ab1411be7c2b', 
'mrypq2',
'http://trcps-3cats.net/2017/06/29/mikeneko/',
'三毛猫さん',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/0625_3.jpg',
'ねこかわいいねこ〜',
'url',
'2020-02-22 10:10:22+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('e5a84729-6251-4b2b-b62e-ffab8a1eebac', 
'mrypq2',
'https://nekochan.jp/cattype/article/755',
'メインクーンの色は何種類？被毛や目のカラーが豊富な人気の猫種！',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/de1830e737620f1eb9eb0b210b502b50.jpg',
'ねこかわいいねこ〜',
'url',
'2020-02-22 10:10:12+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('fa55a7b6-9be8-4bcb-b4a8-6a396e425fab',
'mrypq2',
'https://www.koneko-breeder.com/cat1906-02067.html',
'マンチカン×ノルウェージャンフォレストキャット 女の子 ブラウン ...',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/cat_img_1_326e49a33ed5.jpg',
'ねこかわいい',
'url',
'2020-02-22 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('ab917ee9-bf28-41ff-b914-550728159fae', 
'mrypq',
'https://automaton-media.com/articles/newsjp/20190501-91106/',
'『LoL』少年アニメをテーマとしたスキンシリーズ「バトルアカデミア」がパッチ9.10で登場',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/20190501-91106-001.jpg',
'かわいい！！！！！！！！！！！！！',
'url',
'2020-01-02 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('d7f80bcf-84f0-4560-a237-06c392e0b140',
'mrypq',
'http://lolyarou.net/archives/1346',
'About PBE Update 16/8/5 – Arcade Ahri, Arcade Corkiのスプラッシュアートが確認、Arcade Ezrealの情報が確認、Chroma Assetsが追加など',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/2eaaf8b0ae33f1b2.jpg',
'かわいい！！！！！！！！！！！！！',
'url',
'2020-02-02 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('dfa9eecf-4614-4679-a43e-33aee806fd24', 
'mrypq',
'https://photo.oscasierra.net/tdr-201604/',
'2016年04月に東京ディズニーリゾートで撮影した厳選写真',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/26433173610_10a5654b94_o.jpg',
'行きたい！！！！！！！！！！！！！',
'url',
'2020-01-03 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('f7bd0617-aaf7-46c7-8b32-7ae7cd2192f7',
'mrypq',
'https://www.jalan.net/news/article/293711/',
'この秋、見たい！絶景すぎる「逆さ紅葉」21選【全国】',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/181030_sakasa_koyo_03.jpg',
'行きたい！！！！！！！！！！！！！',
'url',
'2020-01-03 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('279fc672-dd59-4b80-bbbd-9d44e2a91d53', 
'mrypq',
'https://www.miyajima.or.jp/history/history.html',
'歴史｜一般社団法人宮島観光協会',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/img_history.jpg',
'行きたい！！！！！！！！！！！！！',
'url',
'2020-01-04 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('297dca85-53fd-4e56-b023-c5bc456b9a39', 
'mrypq',
'https://resoco.jp/4371',
'ドバイの夜景スポット15選！おすすめスポット＆レストラン',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/dobai_AdobeStock_211353756.jpeg',
'行きたい！！！！！！！！！！！！！',
'url',
'2020-01-05 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('c126d948-7e48-489f-a51e-c7b21a63b418', 
'mrypq',
'http://www.niigata-sushi.com/',
'にいがた鮨三昧',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/pic_slider_02.png',
'食べたい！！！！！！！！！！！！！',
'url',
'2020-01-06 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('f1cfa29e-036c-4b3b-ada9-998e659ae36d', 
'mrypq',
'http://net.keizaikai.co.jp/archives/41822',
'パスタ ジェノベーゼ',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/06608_l.jpg',
'食べたい！！！！！！！！！！！！！',
'url',
'2020-01-07 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('70f89f0d-290d-4090-9401-01f4888758dc', 
'mrypq',
'https://otonano-shumatsu.com/articles/5037',
'宇治園 裏参道ガーデン店（カフェ/表参道）｜おとなの週末',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/6b5570665c5856bfca57d831d14ef516.jpeg',
'食べたい！！！！！！！！！！！！！',
'url',
'2020-03-07 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('ccefdd93-d6bd-4a17-a10c-f0f09b17979b', 
'mrypq',
'https://www.jalan.net/news/article/303446/',
'大阪グルメおすすめ14選】グルメライターが厳選したおいしい名物を紹介！',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/20181210_osaka_gurume_19-480x320.jpg',
'食べたい！！！！！！！！！！！！！',
'url',
'2020-02-07 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('993abdff-7c75-43fb-9238-a8fd13bffd78', 
'mrypq',
'https://art-of-clarity.livejournal.com/111276.html',
'[Animated GIFs] KAT-TUN: Greatest Journey PV',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/XnWFHADP_o.gif',
'すき！！！！！！！！！！！！！',
'url',
'2020-01-08 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('1a856d62-f26a-4209-ae2a-936c460dda66',
'mrypq2',
'https://town.epark.jp/lp/m-sunshine-aquarium/',
'【サンシャイン水族館】天空を羽ばたくペンギンと感動に出会える池袋のアクアリウム',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/sunshine_aquarium.jpg',
'きて！！！！！！！！！！！！！',
'url',
'2020-01-09 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('da16fe8a-5224-4891-8afb-bab884f7aa24',
'mrypq',
'https://www.pakutaso.com/20160346074post-7251.html',
'星空が反射するウユニ塩湖の雨季｜無料の写真素材はフリー素材のぱくたそ',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/MIYA16021200DSC_1905_TP_V4.jpg',
'行きたい！！！！！！！！！！！！！',
'url',
'2020-01-10 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('81e646da-b3dc-4380-aa63-ac58b74b1689', 
'mrypq2',
'https://twitter.com/konicaminoltamt',
'コニカミノルタプラネタリウム満天（池袋） (@konicaminoltamt) | Twitter',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/EZoZKkBUMAARw9Z.jpg',
'きて！！！！！！！！！！！！！',
'url',
'2020-01-11 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('fe3ead68-eeea-49a7-8b1b-da6184c93390',
'mrypq2',
'https://www.mystays.com/attractions-ikebukuro-tokyo-japan/',
'池袋 | 東京 | トラベルガイド＆ホテル | マイステイズ - MYSTAYS',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/02.jpg',
'きて！！！！！！！！！！！！！',
'url',
'2020-01-12 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('cd0cdb20-23ec-4ab5-b533-ffc875eb0ff5',
'mrypq',
'',
'イレリア＆タロン　新スキン',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/DmSL1V6UwAABph-.jpg',
'パッチ8.17で追加の新スキン　かわいい❤︎',
'local',
'2020-01-20 20:20:20+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, created_at)  
VALUES ('ebcf05e5-a731-478d-9cd8-96e157f4b36d',
'mrypq',
'https://www.meijioishiigyunyu.com/recipe/detail/151.html',
'バジルチーズフォンデュ',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/main.jpg',
'',
'local',
'2020-01-22 20:20:20+09');

-- ----------- token -----------
-- [TODO] 確認用トークン ずっと使える いるかな？
INSERT INTO token (id)  
VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW4iLCJzdWIiOiJtcnlwcSIsImlhdCI6MTUxNjIzOTAyMiwiZXhwIjoyMDE2MjM5MDIyfQ.pQnjvROwyIki8ywKMl0Hm66_bDuJ1Pa1aPM_kDU93gQ');

-- ----------- pin_board -----------
INSERT INTO pin_board (pin_id, board_id)
VALUES (
 '12130347-8e9c-4a27-8fcb-2aeaea38c196' , '0910d8c3-2a26-4a8d-bf24-c46e2e5718ea'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'ca1fd1bb-7cae-443d-bdb2-25ad4c50790c' , '0910d8c3-2a26-4a8d-bf24-c46e2e5718ea'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 '7cbffef8-1c4a-4faa-9953-821177b5bddf' , '0910d8c3-2a26-4a8d-bf24-c46e2e5718ea'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'befa1ab8-3a18-4580-a206-5f531c20f9da' , '0910d8c3-2a26-4a8d-bf24-c46e2e5718ea'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'cc2a8e31-725f-473e-9637-ab1411be7c2b' , 'ca4550c7-0ddb-44c2-bda7-aa32bc066a99'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'e5a84729-6251-4b2b-b62e-ffab8a1eebac' , 'ca4550c7-0ddb-44c2-bda7-aa32bc066a99'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'fa55a7b6-9be8-4bcb-b4a8-6a396e425fab' , 'ca4550c7-0ddb-44c2-bda7-aa32bc066a99'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'ab917ee9-bf28-41ff-b914-550728159fae' , '6a8a04cb-bd3b-4606-b88c-593dc4e51d63'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'd7f80bcf-84f0-4560-a237-06c392e0b140' , '6a8a04cb-bd3b-4606-b88c-593dc4e51d63'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'dfa9eecf-4614-4679-a43e-33aee806fd24' , '596e415e-f74e-46ab-b0dc-a00c70efb8f3'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'f7bd0617-aaf7-46c7-8b32-7ae7cd2192f7' , '596e415e-f74e-46ab-b0dc-a00c70efb8f3'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 '279fc672-dd59-4b80-bbbd-9d44e2a91d53' , '596e415e-f74e-46ab-b0dc-a00c70efb8f3'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 '297dca85-53fd-4e56-b023-c5bc456b9a39' , '596e415e-f74e-46ab-b0dc-a00c70efb8f3'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'c126d948-7e48-489f-a51e-c7b21a63b418' , 'ab339fe0-c32c-46e8-87c1-befcfee42d28'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'f1cfa29e-036c-4b3b-ada9-998e659ae36d' , 'ab339fe0-c32c-46e8-87c1-befcfee42d28'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 '70f89f0d-290d-4090-9401-01f4888758dc' , 'ab339fe0-c32c-46e8-87c1-befcfee42d28'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'ccefdd93-d6bd-4a17-a10c-f0f09b17979b' , 'ab339fe0-c32c-46e8-87c1-befcfee42d28'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 '993abdff-7c75-43fb-9238-a8fd13bffd78' , '3b7de911-dc1b-445f-8593-47af710707b5'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 '1a856d62-f26a-4209-ae2a-936c460dda66' , '9220ecec-0c44-447c-93b6-1903e3209a91'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'da16fe8a-5224-4891-8afb-bab884f7aa24' , '596e415e-f74e-46ab-b0dc-a00c70efb8f3'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 '81e646da-b3dc-4380-aa63-ac58b74b1689' , '9220ecec-0c44-447c-93b6-1903e3209a91'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'fe3ead68-eeea-49a7-8b1b-da6184c93390' , '9220ecec-0c44-447c-93b6-1903e3209a91'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'cd0cdb20-23ec-4ab5-b533-ffc875eb0ff5' , '6a8a04cb-bd3b-4606-b88c-593dc4e51d63'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'ebcf05e5-a731-478d-9cd8-96e157f4b36d' , 'ab339fe0-c32c-46e8-87c1-befcfee42d28'
);