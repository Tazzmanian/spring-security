INSERT  INTO customers(email, pwd, role, id) VALUES ('happy@example.com', '{noop}EazyBytes@12345', 'read', 1) ON CONFLICT DO NOTHING;
INSERT  INTO customers(email, pwd, role, id) VALUES ('admin@example.com', '{bcrypt}$2a$12$88.f6upbBvy0okEa7OfHFuorV29qeK.sVbB9VQ6J6dWM1bW6Qef8m', 'admin', 2) ON CONFLICT DO NOTHING;

INSERT INTO users VALUES ('user', '{noop}EazyBytes@12345', 'true') ON CONFLICT DO NOTHING;
INSERT INTO authorities VALUES ('user', 'read') ON CONFLICT DO NOTHING;

INSERT INTO users VALUES ('admin', '{bcrypt}$2a$12$88.f6upbBvy0okEa7OfHFuorV29qeK.sVbB9VQ6J6dWM1bW6Qef8m', 'true') ON CONFLICT DO NOTHING;
INSERT INTO authorities VALUES ('admin', 'admin') ON CONFLICT DO NOTHING;