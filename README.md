1. create a join table, which contains buyer_id and seller_id
2. rails g scaffold buyer_sellers user:references seller:references
    note: here user is a buyer
3. The join table is updated each time a buyer wants to buy a product. sold by a particular seller

4. In products index, provide a link to buy the product, which should updated the join table with the buyer_id and find the corresponding product from the database and associate the seller of that product to the join table

5. in the buyer_seller create method, update the join table and redirect_to buyer page to pay through stripe


6. when a product is being created only the seller info is needed
hence product table must be linked only to the seller table

7. when a product is being bought we need the buyer info, but since product is being sold by a particular seller, it is possible to connect the product to the seller when a user buys it
