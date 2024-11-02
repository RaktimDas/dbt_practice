SELECT film_id,
    title,
    user_rating,
    { { classify_ratings('user_rating') } } as rating_category,
    release_date
FROM { { ref('films') } }