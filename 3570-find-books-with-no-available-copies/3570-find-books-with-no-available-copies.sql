select l.book_id, l.title, l.author, l.genre, l.publication_year, count(b.borrower_name) as current_borrowers from library_books as l
join borrowing_records as b on l.book_id = b.book_id and b.return_date is null
group by l.book_id, l.title, l.author, l.genre, l.publication_year, l.total_copies
having l.total_copies - count(b.borrower_name) = 0
order by current_borrowers desc, l.title asc;