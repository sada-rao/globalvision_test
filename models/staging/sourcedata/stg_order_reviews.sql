-- Creating one on one relationship with the source table. This area is for basic transformation.
select 
     REVIEW_ID
    ,ORDER_ID
    ,REVIEW_CREATION_DATE
    ,REVIEW_SCORE
    ,REVIEW_ANSWER_TIMESTAMP 
    ,REVIEW_COMMENT_MESSAGE
    ,REVIEW_COMMENT_TITLE
from {{ source('order_management_system', 'OLIST_ORDER_REVIEWS') }}