with raw_reviews as (
    select * from AIRBNB.RAW.RAW_REVIEWS
)
select
    listing_id,
    DATE as review_date,
    reviewer_name,
    comments as review_comments,
    sentiment as review_sentiments
from
    raw_reviews