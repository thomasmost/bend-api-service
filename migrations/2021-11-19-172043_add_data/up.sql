-- Your SQL goes here
DO $$ 
DECLARE
    msft_id orgs.id%TYPE;
    apple_id orgs.id%TYPE;
    amzn_id orgs.id%TYPE;
    sbux_id orgs.id%TYPE;
    cmg_id orgs.id%TYPE;
    google_id orgs.id%TYPE;
BEGIN
    insert into orgs (name, stock_symbol, twitter, website) VALUES ('Microsoft', 'msft', 'microsoft', 'microsoft.com') RETURNING id into msft_id;
    insert into orgs (name, stock_symbol, twitter, website) VALUES ('Apple', 'aapl', 'apple', 'apple.com') RETURNING id into apple_id;
    insert into orgs (name, stock_symbol, twitter, website) VALUES ('Amazon', 'amzn', 'amazon', 'amazon.com') RETURNING id into amzn_id;
    insert into orgs (name, stock_symbol, twitter, website) VALUES ('Starbucks', 'sbux', 'Starbucks', 'starbucks.com') RETURNING id into sbux_id;
    insert into orgs (name, stock_symbol, twitter, website) VALUES ('Chipotle', 'cmg', 'ChipotleTweets', 'chipotle.com') RETURNING id into cmg_id;
    insert into orgs (name, stock_symbol, twitter, website) VALUES ('Google', 'googl', 'google', 'google.com') RETURNING id into google_id;

    insert into commitments ( org_id, target_year, reduction_percentage, base_year, commitment_date, commitment_url, status) VALUES (msft_id, 2030, 100, 2020, '2020-01-16', 'https://blogs.microsoft.com/blog/2020/01/16/microsoft-will-be-carbon-negative-by-2030/', 'on_track');
    insert into commitments ( org_id, target_year, reduction_percentage, base_year, commitment_date, commitment_url, status) VALUES (apple_id, 2030, 100, 2020, '2020-07-21', 'https://www.apple.com/newsroom/2020/07/apple-commits-to-be-100-percent-carbon-neutral-for-its-supply-chain-and-products-by-2030/', 'on_track');

END $$