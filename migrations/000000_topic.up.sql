CREATE EXTENSION "uuid-ossp";

CREATE TABLE topic
(
    id         UUID PRIMARY KEY DEFAULT UUID_GENERATE_V4(),
    name TEXT
);

INSERT INTO topic(id, name)
VALUES('ca15c1f4-35ef-48d1-8384-646050c699b9',
'アート'
);

INSERT INTO topic(id, name)
VALUES('ddf3aab7-744b-4b3f-a9ea-6592f6d67eac',
'写真'
);

INSERT INTO topic(id, name)
VALUES('779f38f3-3430-4ba0-9731-d60041cee2db',
'アウトドア'
);

INSERT INTO topic(id, name)
VALUES('54a43a11-b652-4591-b043-5865af254687',
'アニメ・フィギュア'
);

INSERT INTO topic(id, name)
VALUES('004d09c5-c788-4468-9b68-96b5735ced9b',
'イラスト・ポスター'
);

INSERT INTO topic(id, name)
VALUES('1fc63a86-8c58-4b8a-8cb8-e249c7d37905',
'インテリア'
);

INSERT INTO topic(id, name)
VALUES('8d25a80c-b794-4d19-b3f8-16b1d1c19193',
'ウェディング'
);

INSERT INTO topic(id, name)
VALUES('512d3e08-02f4-4044-a06d-b0a23df61080',
'エンターテイメント'
);

INSERT INTO topic(id, name)
VALUES('8d076aab-d2cb-416c-ab7e-405ef2e6ef89',
'ガーデニング'
);

INSERT INTO topic(id, name)
VALUES('78b52885-f7f9-490f-9d58-18561eff700a',
'自然・科学'
);

INSERT INTO topic(id, name)
VALUES('5f7e6c79-e7b7-481b-a63b-d7e604372372',
'教育関連'
);

INSERT INTO topic(id, name)
VALUES('7ff88c1b-a884-4fd6-a7ef-05e6b09fc79f',
'建築'
);

INSERT INTO topic(id, name)
VALUES('5f4635d6-e7a4-49fb-bbec-128c2dbd56d9',
'子供・子育て'
);

INSERT INTO topic(id, name)
VALUES('6bf77210-422f-4bee-a611-e2689699a7ac',
'車・バイク'
);

INSERT INTO topic(id, name)
VALUES('234c5e79-d6a7-4c1a-b6d4-7c6120b3eb48',
'スポーツ'
);

INSERT INTO topic(id, name)
VALUES('f707f6c6-1490-41d2-b651-6b85f0563c3d',
'生活雑貨'
);

INSERT INTO topic(id, name)
VALUES('b90a6ba6-bf86-43d0-9723-c6ada4721816',
'セレブ・有名人'
);

INSERT INTO topic(id, name)
VALUES('7dcc3930-c058-412a-99e1-b732ef36bbf6',
'DIY・ハンドメイド'
);

INSERT INTO topic(id, name)
VALUES('cd8bf150-a5b7-417d-b070-8cd5ba7a51a1',
'デザイン'
);

INSERT INTO topic(id, name)
VALUES('cf76d2ed-a255-4363-a9d2-855170e1fee6',
'動物・ペット'
);

INSERT INTO topic(id, name)
VALUES('1ca44c07-f20c-4992-89bd-aa8e66997c02',
'フード・ドリンク'
);

INSERT INTO topic(id, name)
VALUES('2c51528d-e6c4-4126-bc09-26fd847c0834',
'ヘア・ビューティー'
);

INSERT INTO topic(id, name)
VALUES('5b931b3a-139d-4d0c-b15e-94403a70cc57',
'ヘルス・フィットネス'
);

INSERT INTO topic(id, name)
VALUES('dc420b83-9127-4baa-aea4-ffd41cfc5527',
'ホリデー・イベント'
);

INSERT INTO topic(id, name)
VALUES('90fed106-2572-4ef2-83c8-1139b147b5c4',
'名言'
);

INSERT INTO topic(id, name)
VALUES('1f97f571-f1ab-4e41-9ce6-4f5145649c8f',
'メンズファッション'
);

INSERT INTO topic(id, name)
VALUES('9ebe6323-a0a5-454e-8a1b-ba3ba222c2b4',
'ユーモア'
);

INSERT INTO topic(id, name)
VALUES('f77b2692-2788-4e7e-a175-ab10d13ee305',
'旅行'
);

INSERT INTO topic(id, name)
VALUES('3f9cbe32-9e2a-41b4-a4cd-e6644810c79f',
'歴史'
);

INSERT INTO topic(id, name)
VALUES('4fee81ce-a0fb-429f-ab71-e68d46507615',
'レディースファッション'
);

INSERT INTO topic(id, name)
VALUES('8083e9df-e30e-457f-b853-2bb70fbb025b',
'その他'
);