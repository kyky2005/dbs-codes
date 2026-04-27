<?php

class database
{

    function opencon(): PDO
    {
        return new PDO("mysql:host=localhost;dbname=dbs_app", username: "root", password: "");
    }

    function insertUser($email, $user_password_hash, $is_active)
    {
        $con = $this->opencon();

        try {
            $con->beginTransaction();
            $stmt = $con->prepare("INSERT INTO users (username, user_password_hash, is_active) VALUES(?, ?, ?)");
            $stmt->execute([$email, $user_password_hash, $is_active]);
            $user_id = $con->lastInsertId();
            $con->commit();
            return $user_id;
        } catch (PDOException $e) {
            if ($con->inTransaction()) {
                $con->rollBack();
            }
            throw $e;
        }
    }

    function insertBorrower($firstname, $lastname, $email, $phone, $borrower_member_since, $is_active)
    {
        $con = $this->opencon();

        try {
            $con->beginTransaction();
            $stmt = $con->prepare("INSERT INTO borrowers (borrower_firstname, borrower_lastname, borrower_email, borrower_phone_number, borrower_member_since, is_active) VALUES(?, ?, ?, ?, ?, ?)");
            $stmt->execute([$firstname, $lastname, $email, $phone, $borrower_member_since, $is_active]);
            $borrower_id = $con->lastInsertId();
            $con->commit();
            return $borrower_id;
        } catch (PDOException $e) {
            if ($con->inTransaction()) {
                $con->rollBack();
            }
            throw $e;
        }
    }

    function insertBorrowerUser($user_id, $borrower_id)
    {
        $con = $this->opencon();

        try {
            $con->beginTransaction();
            $stmt = $con->prepare("INSERT INTO borroweruser (user_id, borrower_id) VALUES(?, ?)");
            $stmt->execute([$user_id, $borrower_id]);
            $borrower_user_id = $con->lastInsertId();
            $con->commit();
            return $borrower_user_id;
        } catch (PDOException $e) {
            if ($con->inTransaction()) {
                $con->rollBack();
            }
            throw $e;
        }
    }

    function viewborrowers()
    {
        $con = $this->opencon();
        return $con->query("SELECT * FROM borrowers")->fetchAll();
    }

    function insertBorrowerAddress($borrower_id, $borrower_house_number, $borrower_street, $borrower_barangay, $borrower_city, $borrower_province, $borrower_postal_code, $is_primary)
    {
        $con = $this->opencon();

        try {
            $con->beginTransaction();
            $stmt = $con->prepare("INSERT INTO borroweraddress (borrower_id, ba_house_number, ba_street, ba_barangay, ba_city, ba_province, ba_postal_code, is_primary) VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->execute([$borrower_id, $borrower_house_number, $borrower_street, $borrower_barangay, $borrower_city, $borrower_province, $borrower_postal_code, $is_primary]);
            $con->commit();
            return true;
        } catch (PDOException $e) {
            if ($con->inTransaction()) {
                $con->rollBack();
            }
            throw $e;
        }
    }

    //Books

    function viewbooks()
    {
        $con = $this->opencon();
        return $con->query("SELECT * FROM books")->fetchAll();
    }

    function insertBooks($book_title, $book_isbn, $book_publication_year, $book_edition, $book_publisher)
    {

        $con = $this->opencon();

        try {
            $con->beginTransaction();
            $stmt = $con->prepare("INSERT INTO books (book_title, book_isbn, book_publication, book_edition, book_publisher) VALUES(?, ?, ?, ?, ?)");
            $stmt->execute([$book_title, $book_isbn, $book_publication_year, $book_edition, $book_publisher]);
            $book_id = $con->lastInsertId();
            $con->commit();
            return $book_id;
        } catch (PDOException $e) {
            if ($con->inTransaction()) {
                $con->rollBack();
            }
            throw $e;
        }
    }
    function insertBookCopy($book_id, $book_status)
    {

        $con = $this->opencon();

        try {
            $con->beginTransaction();
            $stmt = $con->prepare("INSERT INTO bookcopy (book_id, status) VALUES(?, ?)");
            $stmt->execute([$book_id, $book_status]);
            $book_id = $con->lastInsertId();
            $con->commit();
            return $book_id;
        } catch (PDOException $e) {
            if ($con->inTransaction()) {
                $con->rollBack();
            }
            throw $e;
        }
    }

    function viewauthors()
    {
        $con = $this->opencon();
        return $con->query("SELECT * FROM authors")->fetchAll();
    }

    function insertBookAuthor($book_id, $book_author)
    {

        $con = $this->opencon();

        try {
            $con->beginTransaction();
            $stmt = $con->prepare("INSERT INTO bookauthor (book_id, author_id) VALUES(?, ?)");
            $stmt->execute([$book_id, $book_author]);
            $con->commit();
            return $book_id;
        } catch (PDOException $e) {
            if ($con->inTransaction()) {
                $con->rollBack();
            }
            throw $e;
        }
    }

    function viewbookcopy()
    {
        $con = $this->opencon();
        return $con->query("SELECT *, COUNT(bookcopy.copy_id) AS copy_count, SUM(bookcopy.status = 'AVAILABLE') AS available_copies FROM BOOKS LEFT JOIN bookcopy ON bookcopy.book_id = books.book_id GROUP BY books.book_id")->fetchAll();
    }

    function updateBook($book_id, $title, $isbn, $year, $publisher)
    {
        $con = $this->opencon();

        try {
            $con->beginTransaction();

            $stmt = $con->prepare("
            UPDATE Books
            SET book_title = ?,
                book_isbn = ?,
                book_publication = ?,
                book_publisher = ?
            WHERE book_id = ?
        ");

            $stmt->execute([$title, $isbn, $year, $publisher, $book_id]);

            $con->commit();
            return true; // Successfully updated

        } catch (PDOException $e) {
            if ($con->inTransaction()) {
                $con->rollBack();
            }
            throw $e;
        }
    }

     function viewgenre()
    {
        $con = $this->opencon();
        return $con->query("SELECT * FROM genres")->fetchAll();
    }
    
    function insertBookGenre($book_id, $genre_id)
    {

        $con = $this->opencon();

        try {
            $con->beginTransaction();
            $stmt = $con->prepare("INSERT INTO bookgenre (book_id, genre_id) VALUES(?, ?)");
            $stmt->execute([$book_id, $genre_id]);
            $con->commit();
            return $book_id;
        } catch (PDOException $e) {
            if ($con->inTransaction()) {
                $con->rollBack();
            }
            throw $e;
        }
    }

    function countBooks()
    {
        $con = $this->opencon();
        return $con->query("SELECT COUNT(*) AS total_books FROM books")->fetchColumn();
    }
    function countCopies()
    {
        $con = $this->opencon();
        return $con->query("SELECT COUNT(*) AS total_copies FROM bookcopy")->fetchColumn();
    }

    function countOpenLoans()
    {
        $con = $this->opencon();
        return $con->query("SELECT COUNT(*) AS open_loans FROM loan WHERE loan_status = 'OPEN'")->fetchColumn();
    }
    function countOverdueLoans()
    {
        $con = $this->opencon();
        return $con->query("SELECT COUNT(*) AS overdue_loans FROM loan JOIN loanitem ON loan.loan_id = loanitem.loan_id WHERE loan.loan_status = 'OPEN' AND loanitem.li_duedate < CURDATE()")->fetchColumn();
    }
    function getRecentLoans()
    {
        $con = $this->opencon();
        return $con->query("SELECT loan.loan_id, borrowers.borrower_firstname, borrowers.borrower_lastname, loan.loan_status, loan.loan_date, users.username FROM loan JOIN borrowers ON loan.borrower_id = borrowers.borrower_id JOIN users ON loan.processed_by_user_id = users.user_id ORDER BY loan.loan_date DESC LIMIT 5")->fetchAll();
    }
}
