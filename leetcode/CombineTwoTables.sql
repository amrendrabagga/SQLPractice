select p.firstname, p.lastname, a.city, a.state from person p
 LEFT OUTER JOIN address a ON p.personid = a.personid;