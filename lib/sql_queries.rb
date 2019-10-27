# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_title
  "SELECT projects.title, SUM(pledges.amount)
   FROM projects 
   INNER JOIN pledges 
   WHERE projects.id = pledges.project_id 
   GROUP BY projects.title 
   ORDER BY projects.title ASC"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
  "SELECT users.name, users.age, SUM(pledges.amount) 
   FROM pledges 
   JOIN users 
   WHERE pledges.user_id = users.id 
   GROUP BY users.name 
   ORDER BY users.name ASC"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  "SELECT projects.title, SUM(pledges.amount) - funding_goal AS total_amount
   FROM projects 
   JOIN pledges ON pledges.project_id = projects.id
   GROUP BY title HAVING total_amount >= 0
   ORDER BY total_amount;"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_summed_amount
  "SELECT name,  SUM(pledges.amount)
   AS total_amount FROM users
   JOIN pledges ON pledges.user_id = users.id
   GROUP BY name
   ORDER BY total_amount ASC;"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  "SELECT category, pledges.amount
   FROM projects
   JOIN pledges ON pledges.project_id = projects.id WHERE category = 'music'
   ORDER BY category DESC;"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  "SELECT category, SUM(pledges.amount)
   FROM projects
   JOIN pledges ON pledges.project_id = projects.id WHERE category = 'books'
   ORDER BY category DESC;"
end
