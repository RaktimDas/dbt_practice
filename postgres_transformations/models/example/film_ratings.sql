WITH films_with_ratings AS(
    SELECT film_id,
        title,
        release_date,
        price,
        rating,
        user_rating,
        CASE
            WHEN user_rating >= 4.5 THEN 'Excellent'
            WHEN user_rating >=.0 THEN 'Good'
            WHEN user_rating >= 3.0 THEN 'Average'
            ELSE 'Poor'
        END AS rating_category
    FROM { { ref('films') } }
),
films_with_actors AS (
    SELECT f.film_id,
        f.title,
        STRING_AGG(a.actor_name, ',') as actors
    FROM { { ref('films') } }
)