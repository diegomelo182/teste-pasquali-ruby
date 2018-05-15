module AccountsHandler
  def account_with_childs_json_build(accounts_array)
    response = {
      data: {
        error: 'Item not found'
      },
      status: 404
    }

    if !accounts_array.nil? && accounts_array.count > 0
      account = accounts_array[0].attributes
      account[:childs] = accounts_array.drop(1)
      response = {
        data: account,
        status: 200
      }
    end

    response
  end

  def get_account_with_childs_array(id)
    Account.find_by_sql("WITH RECURSIVE my_cte(id, name, balance, kind, status, parent_account_id, person_id, created_at, updated_at) AS
      (
        SELECT *
        FROM test_pasquali_api_development.accounts
          WHERE id = #{id.to_i}
        UNION ALL
        SELECT accs.id, accs.name, accs.balance, accs.kind, accs.status, accs.parent_account_id, accs.person_id, accs.created_at, accs.updated_at
        FROM my_cte AS acc
        JOIN test_pasquali_api_development.accounts AS accs
        ON acc.id = accs.parent_account_id
      )
      SELECT * FROM my_cte;")
  end
end
