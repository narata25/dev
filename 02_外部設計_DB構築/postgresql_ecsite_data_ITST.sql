\encoding UTF8;

CREATE SEQUENCE SEQ_CAT_CATID;
CREATE SEQUENCE SEQ_ITEMS_ITEMID;
CREATE SEQUENCE SEQ_PURCHASE_ID;
CREATE SEQUENCE SEQ_PUR_DETAIL_ID;

ALTER SEQUENCE public.SEQ_CAT_CATID OWNER TO ecsite;
ALTER SEQUENCE public.SEQ_ITEMS_ITEMID OWNER TO ecsite;
ALTER SEQUENCE public.SEQ_PURCHASE_ID OWNER TO ecsite;
ALTER SEQUENCE public.SEQ_PUR_DETAIL_ID OWNER TO ecsite;

CREATE TABLE users (
	user_id		VARCHAR(255)	PRIMARY KEY,
	password	VARCHAR(255)		NOT NULL,
	user_name		VARCHAR(32),
	address		VARCHAR(255)
);
ALTER TABLE public.users OWNER TO ecsite;

CREATE TABLE categories (
	category_id		INTEGER			PRIMARY KEY DEFAULT NEXTVAL('SEQ_CAT_CATID'),
	category_name			VARCHAR(255)	NOT NULL
);
ALTER TABLE public.categories OWNER TO ecsite;

CREATE TABLE items (
	item_id			INTEGER			PRIMARY KEY DEFAULT NEXTVAL('SEQ_ITEMS_ITEMID'),
	item_name			VARCHAR(128)	NOT NULL,
	manufacturer	VARCHAR(32),
	category_id		INTEGER			NOT NULL,
	color			VARCHAR(16),
	price			INTEGER			NOT NULL DEFAULT 0,
	stock			INTEGER			NOT NULL DEFAULT 0,
	recommended		BOOLEAN			NOT NULL DEFAULT FALSE,
	FOREIGN KEY (category_id) REFERENCES categories (category_id)
);
ALTER TABLE public.items OWNER TO ecsite;

CREATE TABLE items_in_cart (
	user_id		VARCHAR(255),
	item_id		INTEGER,
	amount		INTEGER		NOT NULL,
	booked_date	DATE		NOT NULL,
	PRIMARY KEY (user_id, item_id),
	FOREIGN KEY (user_id) REFERENCES users (user_id),
	FOREIGN KEY (item_id) REFERENCES items (item_id)
);
ALTER TABLE public.items_in_cart OWNER TO ecsite;

CREATE TABLE purchases (
	purchase_id		INTEGER			PRIMARY KEY DEFAULT NEXTVAL('SEQ_PURCHASE_ID'),
	purchased_user	VARCHAR(255)	NOT NULL,
	purchased_date	DATE			NOT NULL,
	destination		VARCHAR(255),
	cancel			BOOLEAN			NOT NULL DEFAULT FALSE,
	FOREIGN KEY (purchased_user) REFERENCES users (user_id)
);
ALTER TABLE public.purchases OWNER TO ecsite;

CREATE TABLE purchase_details (
	purchase_detail_id	INTEGER	PRIMARY KEY DEFAULT NEXTVAL('SEQ_PUR_DETAIL_ID'),
	purchase_id			INTEGER		NOT NULL,
	item_id				INTEGER		NOT NULL,
	amount				INTEGER		NOT NULL,
	FOREIGN KEY (purchase_id) REFERENCES purchases (purchase_id),
	FOREIGN KEY (item_id) REFERENCES items (item_id)
);
ALTER TABLE public.purchase_details OWNER TO ecsite;

CREATE TABLE administrators (
	admin_id		VARCHAR(255)	PRIMARY KEY,
	password		VARCHAR(255)		NOT NULL,
	admin_name			VARCHAR(32)
);
ALTER TABLE public.administrators OWNER TO ecsite;

INSERT INTO categories (category_id,category_name) VALUES (0, 'すべて');
INSERT INTO categories (category_id,category_name) VALUES (1, '帽子');
INSERT INTO categories (category_id,category_name) VALUES (2, '鞄');

INSERT INTO items (item_id, item_name, manufacturer, category_id, color, price, stock, recommended) VALUES (1, 'トレモント・ハット', '中帽子製造', 1, '黒色', 5400, 32, FALSE);
INSERT INTO items (item_id, item_name, manufacturer, category_id, color, price, stock, recommended) VALUES (2, 'ハンチング帽', 'PHRASE', 1, 'ブラウン', 5400, 24, TRUE);
INSERT INTO items (item_id, item_name, manufacturer, category_id, color, price, stock, recommended) VALUES (3, 'パンケーキ・ベレー', 'PHRASE', 1, 'クリーム', 4320, 26, FALSE);
INSERT INTO items (item_id, item_name, manufacturer, category_id, color, price, stock, recommended) VALUES (4, 'キャバリエ・ハット', '中帽子製造', 1, 'グレー', 9750, 12, FALSE);
INSERT INTO items (item_id, item_name, manufacturer, category_id, color, price, stock, recommended) VALUES (5, 'エドワーディアン・ハット', 'FLOWERS', 1, 'ピンク', 8560, 7, FALSE);
INSERT INTO items (item_id, item_name, manufacturer, category_id, color, price, stock, recommended) VALUES (6, '竹笠', '越中の寅', 1, '天然色', 3980, 5, TRUE);
INSERT INTO items (item_id, item_name, manufacturer, category_id, color, price, stock, recommended) VALUES (7, 'ボブル・ハット', '中帽子製造', 1, '黄色', 2250, 15, FALSE);
INSERT INTO items (item_id, item_name, manufacturer, category_id, color, price, stock, recommended) VALUES (8, 'ヒジャブ', 'ゴランド', 1, 'ブラック', 3200, 10, FALSE);
INSERT INTO items (item_id, item_name, manufacturer, category_id, color, price, stock, recommended) VALUES (9, '虫の垂衣', '越中の寅', 1, '天然色', 10000, 3, FALSE);
INSERT INTO items (item_id, item_name, manufacturer, category_id, color, price, stock, recommended) VALUES (10, 'イートンキャップ', 'WEST FACE', 1, 'オレンジ', 6200, 50, TRUE);

INSERT INTO items (item_id, item_name, manufacturer, category_id, color, price, stock, recommended) VALUES (11, 'ブリーフケース', 'THROW', 2, 'ダークグレー', 9800, 24, TRUE);
INSERT INTO items (item_id, item_name, manufacturer, category_id, color, price, stock, recommended) VALUES (12, 'クラッチバッグ', 'THROW', 2, 'パール', 28700, 4, FALSE);
INSERT INTO items (item_id, item_name, manufacturer, category_id, color, price, stock, recommended) VALUES (13, 'がま口バッグ', '革本', 2, '朱色', 2640, 9, FALSE);
INSERT INTO items (item_id, item_name, manufacturer, category_id, color, price, stock, recommended) VALUES (14, 'カジュアルトートバッグ', 'UNIGUE', 2, 'アイボリー', 1680, 48, TRUE);
INSERT INTO items (item_id, item_name, manufacturer, category_id, color, price, stock, recommended) VALUES (15, 'アタッシュケース', 'Dural', 2, 'シルバー', 4680, 8, FALSE);


