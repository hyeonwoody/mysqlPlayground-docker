SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE concert_schedule;
TRUNCATE concert_schedule_seat;
TRUNCATE concert;


TRUNCATE payment;
TRUNCATE reservation;
TRUNCATE reserver;
TRUNCATE seat;
SET FOREIGN_KEY_CHECKS = 1;

 CREATE TEMPORARY TABLE names (n VARCHAR(255));

INSERT INTO names (n)
SELECT CONCAT(a.C, b.C, c.C, d.C, e.C, f.C)
FROM (SELECT 'A' AS C UNION ALL SELECT 'B' UNION ALL SELECT 'C' UNION ALL SELECT 'D' UNION ALL SELECT 'E'
      UNION ALL SELECT 'F' UNION ALL SELECT 'G' UNION ALL SELECT 'H' UNION ALL SELECT 'I' UNION ALL SELECT 'J') a,
     (SELECT 'A' AS C UNION ALL SELECT 'B' UNION ALL SELECT 'C' UNION ALL SELECT 'D' UNION ALL SELECT 'E'
      UNION ALL SELECT 'F' UNION ALL SELECT 'G' UNION ALL SELECT 'H' UNION ALL SELECT 'I' UNION ALL SELECT 'J') b,
     (SELECT 'A' AS C UNION ALL SELECT 'B' UNION ALL SELECT 'C' UNION ALL SELECT 'D' UNION ALL SELECT 'E'
      UNION ALL SELECT 'F' UNION ALL SELECT 'G' UNION ALL SELECT 'H' UNION ALL SELECT 'I' UNION ALL SELECT 'J') c,
     (SELECT 'A' AS C UNION ALL SELECT 'B' UNION ALL SELECT 'C' UNION ALL SELECT 'D' UNION ALL SELECT 'E'
      UNION ALL SELECT 'F' UNION ALL SELECT 'G' UNION ALL SELECT 'H' UNION ALL SELECT 'I' UNION ALL SELECT 'J') d,
     (SELECT 'A' AS C UNION ALL SELECT 'B' UNION ALL SELECT 'C' UNION ALL SELECT 'D' UNION ALL SELECT 'E'
      UNION ALL SELECT 'F' UNION ALL SELECT 'G' UNION ALL SELECT 'H' UNION ALL SELECT 'I' UNION ALL SELECT 'J') e,
     (SELECT 'A' AS C UNION ALL SELECT 'B' UNION ALL SELECT 'C' UNION ALL SELECT 'D' UNION ALL SELECT 'E'
      UNION ALL SELECT 'F' UNION ALL SELECT 'G' UNION ALL SELECT 'H' UNION ALL SELECT 'I' UNION ALL SELECT 'J') f
LIMIT 1000000;

CREATE TEMPORARY TABLE numbers (n INT);

INSERT INTO numbers (n)
SELECT a.N + b.N * 10 + c.N * 100 + d.N * 1000 + e.N * 10000 + f.N * 100000
FROM (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
      UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
      UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
      UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c,
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
      UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) d,
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
      UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) e,
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
      UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) f
WHERE a.N + b.N * 10 + c.N * 100 + d.N * 1000 + e.N * 10000 + f.N * 100000 BETWEEN 1 AND 1000000;


INSERT INTO reserver (point) VALUES
                                 (1000),
                                 (500),
                                 (2000),
                                 (750),
                                 (1500),
                                 (300),
                                 (3000),
                                 (100),
                                 (2500),
                                 (800),
                                 (1200),
                                 (600),
                                 (1800),
                                 (400),
                                 (2200),
                                 (900),
                                 (1600),
                                 (200),
                                 (3500),
                                 (700);

INSERT INTO concert (name)
SELECT FLOOR(RAND()) * 200 AS name
FROM names;
#
# INSERT INTO concert (name) VALUES
#                                ('아이유 콘서트'),
#                                ('뉴진스 하우 스윗'),
#                                ('아이브 쇼케이스'),
#                                ('아일릿 유유유유유유유 매그내릭'),
#                                ('트와이스 원스인어마일'),
#                                ('레드벨벳 콘서트');

INSERT INTO concert_schedule (concert_id, start_at, capacity)
SELECT
    c.id AS concert_id,
    DATE_ADD('2025-01-01', INTERVAL FLOOR(RAND() * 365) DAY) AS start_at,
    FLOOR(RAND() * 40000) + 10000 AS capacity
FROM concert c
         CROSS JOIN (
    SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
) AS numbers;

INSERT INTO seat (seat_number) VALUES
                                   (1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
                                   (11), (12), (13), (14), (15), (16), (17), (18), (19), (20),
                                   (21), (22), (23), (24), (25), (26), (27), (28), (29), (30),
                                   (31), (32), (33), (34), (35), (36), (37), (38), (39), (40),
                                   (41), (42), (43), (44), (45), (46), (47), (48), (49), (50),
                                   (51), (52), (53), (54), (55), (56), (57), (58), (59), (60),
                                   (61), (62), (63), (64), (65), (66), (67), (68), (69), (70),
                                   (71), (72), (73), (74), (75), (76), (77), (78), (79), (80),
                                   (81), (82), (83), (84), (85), (86), (87), (88), (89), (90),
                                   (91), (92), (93), (94), (95), (96), (97), (98), (99), (100);

# INSERT INTO reservation (
#     user_id,
#     concert_schedule_id,
#     seat_id,
#     status,
#     created_at,
#     paid_at,
#     reserved_price
# ) VALUES (
#              1,  -- Replace with the actual user ID
#              2,  -- Replace with the actual concert schedule ID
#              3,  -- Replace with the actual seat ID
#              'OCCUPIED',  -- Replace with the actual reservation status
#              DATE_ADD(NOW(), INTERVAL 9 HOUR),  -- Or replace with a specific datetime if needed
#              NULL,  -- Replace with the actual paid_at datetime or NULL
#              10   -- Replace with the actual reserved price
#          );
#
EXPLAIN INSERT INTO concert_schedule_seat (concert_schedule_id, seat_id, price)
    SELECT
            cs.id AS concert_schedule_id,
            s.id AS seat_id,
            2000 AS price
        FROM concert_schedule cs
                 CROSS JOIN seat s;
#

INSERT INTO concert_schedule_seat (concert_schedule_id, seat_id, price)
SELECT
    cs.id AS concert_schedule_id,
    s.id AS seat_id,
    2000 AS price
FROM concert_schedule cs
         CROSS JOIN seat s;


DROP TEMPORARY TABLE IF EXISTS names;
DROP TEMPORARY TABLE IF EXISTS numbers;