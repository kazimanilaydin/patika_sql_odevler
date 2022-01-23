-- film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
SELECT COUNT(*) FROM film WHERE length > ANY (
	SELECT AVG(length) FROM film
);
-- Sonucu: 489

-- film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
SELECT COUNT(*) FROM film WHERE rental_rate = ANY (
	SELECT MAX(rental_rate) FROM film
);
-- Sonucu: 336

-- film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.
SELECT * FROM film WHERE rental_rate = (
	SELECT MIN(rental_rate) FROM film
) AND replacement_cost = (
	SELECT MIN(replacement_cost) from film
);

-- payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.
SELECT * FROM customer WHERE customer_id = (
	SELECT customer_id FROM payment GROUP BY customer_id ORDER BY SUM(amount) DESC LIMIT 1
);
