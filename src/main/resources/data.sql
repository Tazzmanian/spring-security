--INSERT  INTO customers(email, pwd, role, id) VALUES ('happy@example.com', '{noop}EazyBytes@12345', 'read', 1) ON CONFLICT DO NOTHING;
--INSERT  INTO customers(email, pwd, role, id) VALUES ('admin@example.com', '{bcrypt}$2a$12$88.f6upbBvy0okEa7OfHFuorV29qeK.sVbB9VQ6J6dWM1bW6Qef8m', 'admin', 2) ON CONFLICT DO NOTHING;
--
--INSERT INTO users VALUES ('user', '{noop}EazyBytes@12345', 'true') ON CONFLICT DO NOTHING;
--INSERT INTO authorities VALUES ('user', 'read') ON CONFLICT DO NOTHING;
--
--INSERT INTO users VALUES ('admin', '{bcrypt}$2a$12$88.f6upbBvy0okEa7OfHFuorV29qeK.sVbB9VQ6J6dWM1bW6Qef8m', 'true') ON CONFLICT DO NOTHING;
--INSERT INTO authorities VALUES ('admin', 'admin') ON CONFLICT DO NOTHING;

INSERT INTO customer (name,email,mobile_number, pwd, role,create_dt)
 VALUES ('Happy','happy@example.com','5334122365', '{bcrypt}$2a$12$88.f6upbBvy0okEa7OfHFuorV29qeK.sVbB9VQ6J6dWM1bW6Qef8m', 'admin',current_date);

INSERT INTO customer (name,email,mobile_number, pwd, role,create_dt)
 VALUES ('Role1','role1@example.com','5334122365', '{bcrypt}$2a$12$88.f6upbBvy0okEa7OfHFuorV29qeK.sVbB9VQ6J6dWM1bW6Qef8m', '1',current_date);

INSERT INTO accounts (customer_id, account_number, account_type, branch_address, create_dt)
 VALUES (1, 1865764534, 'Savings', '123 Main Street, New York', current_date);

INSERT INTO account_transactions (transaction_id, account_number, customer_id, transaction_dt, transaction_summary, transaction_type,transaction_amt,
closing_balance, create_dt)  VALUES (gen_random_uuid(), 1865764534, 1, CURRENT_DATE - INTERVAL '7 days', 'Coffee Shop', 'Withdrawal', 30,34500,CURRENT_DATE - INTERVAL '7 days');

INSERT INTO account_transactions (transaction_id, account_number, customer_id, transaction_dt, transaction_summary, transaction_type,transaction_amt,
closing_balance, create_dt)  VALUES (gen_random_uuid(), 1865764534, 1, CURRENT_DATE - INTERVAL '6 days', 'Uber', 'Withdrawal', 100,34400,CURRENT_DATE - INTERVAL '6 days');

INSERT INTO account_transactions (transaction_id, account_number, customer_id, transaction_dt, transaction_summary, transaction_type,transaction_amt,
closing_balance, create_dt)  VALUES (gen_random_uuid(), 1865764534, 1, CURRENT_DATE - INTERVAL '5 days', 'Self Deposit', 'Deposit', 500,34900,CURRENT_DATE - INTERVAL '5 days');

INSERT INTO account_transactions (transaction_id, account_number, customer_id, transaction_dt, transaction_summary, transaction_type,transaction_amt,
closing_balance, create_dt)  VALUES (gen_random_uuid(), 1865764534, 1, CURRENT_DATE - INTERVAL '4 days', 'Ebay', 'Withdrawal', 600,34300,CURRENT_DATE - INTERVAL '4 days');

INSERT INTO account_transactions (transaction_id, account_number, customer_id, transaction_dt, transaction_summary, transaction_type,transaction_amt,
closing_balance, create_dt)  VALUES (gen_random_uuid(), 1865764534, 1, CURRENT_DATE - INTERVAL '2 days', 'OnlineTransfer', 'Deposit', 700,35000,CURRENT_DATE - INTERVAL '2 days');

INSERT INTO account_transactions (transaction_id, account_number, customer_id, transaction_dt, transaction_summary, transaction_type,transaction_amt,
closing_balance, create_dt)  VALUES (gen_random_uuid(), 1865764534, 1, CURRENT_DATE - INTERVAL '1 days', 'Amazon.com', 'Withdrawal', 100,34900,CURRENT_DATE - INTERVAL '1 days');


INSERT INTO loans ( customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
 VALUES ( 1, '2020-10-13', 'Home', 200000, 50000, 150000, '2020-10-13');

INSERT INTO loans ( customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
 VALUES ( 1, '2020-06-06', 'Vehicle', 40000, 10000, 30000, '2020-06-06');

INSERT INTO loans ( customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
 VALUES ( 1, '2018-02-14', 'Home', 50000, 10000, 40000, '2018-02-14');

INSERT INTO loans ( customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
 VALUES ( 1, '2018-02-14', 'Personal', 10000, 3500, 6500, '2018-02-14');


INSERT INTO cards (card_number, customer_id, card_type, total_limit, amount_used, available_amount, create_dt)
 VALUES ('4565XXXX4656', 1, 'Credit', 10000, 500, 9500, current_date);

INSERT INTO cards (card_number, customer_id, card_type, total_limit, amount_used, available_amount, create_dt)
 VALUES ('3455XXXX8673', 1, 'Credit', 7500, 600, 6900, current_date);

INSERT INTO cards (card_number, customer_id, card_type, total_limit, amount_used, available_amount, create_dt)
 VALUES ('2359XXXX9346', 1, 'Credit', 20000, 4000, 16000, current_date);


INSERT INTO notice_details ( notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('Home Loan Interest rates reduced', 'Home loan interest rates are reduced as per the goverment guidelines. The updated rates will be effective immediately',
current_date - INTERVAL '30 DAY', current_date + INTERVAL '30 DAY', current_date, null);

INSERT INTO notice_details ( notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('Net Banking Offers', 'Customers who will opt for Internet banking while opening a saving account will get a $50 amazon voucher',
current_date - INTERVAL '30 DAY', current_date + INTERVAL '30 DAY', current_date, null);

INSERT INTO notice_details ( notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('Mobile App Downtime', 'The mobile application of the EazyBank will be down from 2AM-5AM on 12/05/2020 due to maintenance activities',
current_date - INTERVAL '30 DAY', current_date + INTERVAL '30 DAY', current_date, null);

INSERT INTO notice_details ( notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('E Auction notice', 'There will be a e-auction on 12/08/2020 on the Bank website for all the stubborn arrears.Interested parties can participate in the e-auction',
current_date - INTERVAL '30 DAY', current_date + INTERVAL '30 DAY', current_date, null);

INSERT INTO notice_details ( notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('Launch of Millennia Cards', 'Millennia Credit Cards are launched for the premium customers of EazyBank. With these cards, you will get 5% cashback for each purchase',
current_date - INTERVAL '30 DAY', current_date + INTERVAL '30 DAY', current_date, null);

INSERT INTO notice_details ( notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('COVID-19 Insurance', 'EazyBank launched an insurance policy which will cover COVID-19 expenses. Please reach out to the branch for more details',
current_date - INTERVAL '30 DAY', current_date + INTERVAL '30 DAY', current_date, null);

INSERT INTO authorities (customer_id, name)
 VALUES (1, 'VIEWACCOUNT');

INSERT INTO authorities (customer_id, name)
 VALUES (1, 'VIEWCARDS');

 INSERT INTO authorities (customer_id, name)
  VALUES (1, 'VIEWLOANS');

 INSERT INTO authorities (customer_id, name)
   VALUES (1, 'VIEWBALANCE');

--DELETE FROM authorities;

INSERT INTO authorities (customer_id, name)
  VALUES (1, 'ROLE_USER');

INSERT INTO authorities (customer_id, name)
  VALUES (1, 'ROLE_ADMIN');

INSERT INTO authorities (customer_id, name)
  VALUES (2, 'ROLE_1');
