/* Make a simple knowledge base. Represent some of your favorite books and authors. */

book('Letters from a stoic', 'Seneca').
book('Storm Front', 'Jim Butcher').
book('Skin Game', 'Jim Butcher').
book('The Color of Magic', 'Terry Pratchett').
book('Going Postal', 'Terry Pratchett').
book('Mort', 'Terry Pratchett').

/* Find all books in your knowledge base written by one author. */
book(What, 'Jim Butcher').
book(What, 'Terry Pratchett').

/* Make a knowledge base representing musicians and instruments. Also represent musicians and their genre of music. */
instrument('Jimi Hendrix', guitar).
instrument('Neil Sanderson', drums).
instrument('Barry Stock', guitar).

genre('Barry Stock', rock).
genre('Neil Sanderson', rock).
genre('Jimi Hendrix', metal).

/* Find all musicians who play the guitar. */
instrument(Who, guitar).

/* Get all instruments in a genre */
get_instrument_from_genre(X, Instrument) :- genre(Y, X), instrument(Y, Instrument).
