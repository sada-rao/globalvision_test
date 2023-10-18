with reviews as (
select 
     REVIEW_ID
    ,ORDER_ID
    ,REVIEW_CREATION_DATE
    ,REVIEW_SCORE
    ,REVIEW_ANSWER_TIMESTAMP 
    ,REVIEW_COMMENT_MESSAGE
    ,REVIEW_COMMENT_TITLE
from {{ ref('stg_order_reviews') }}
)
select * from reviews
