<h4 class="shade-grey">Discover people</h4>
<!-- profile picture, name and follow button in a card -->
<div class="row">
  <% @users.each do |user| %>
   <% if(user != current_user) %>
    <div class="col-md-4">
       <!-- if current user is already following -->
       <div class="card">
         <!-- only the users who are not a current user  -->
           <%= image_tag(user.profile.picture_url, class: "profile-follow-pic") %>
           <span class="follow-profile-name"><%= user.profile.name %></span>
           <!-- if user.followings is an empty array, provide a link to follow -->
           <!-- check if the user is already been followed by current user, by parsings throught he array of users followers -->
            <% if user.followers.include?(current_user) %>
               <a href="#" class="btn btn-danger follow"> following </a>
            <% else %>
             <%= link_to 'follow', followings_path(:follower_id => user), method: :post, class: "btn btn-primary follow"%>
            <% end %>
       </div>
    </div>
    <% end %>
  <% end %>
  <br><br>
</div>
<br><br><br>
<% if current_user.followings %>
  <h4 class="shade-grey">Profiles followed by <%= current_user.profile.name %></h4>
  <ul>
    <% current_user.followings.each do |following|  %>
    <li><%= following.followee.profile.name %>
    <%= link_to 'unfollow', following, method: :delete %></li>
    <% end %>
  </ul>

  <br><br><br>
  <h4 class="shade-grey">Profiles following <%= current_user.profile.name %></h4>
  <ul>
    <% current_user.followers.each do |follower|  %>
    <li><%=follower.profile.name %></li>
    <% end %>
  </ul>
<% end %>


market place logic


1. create a join table, which contains buyer_id and seller_id
2. rails g scaffold buyer_sellers user:references seller:references
    note: here user is a buyer
3. The join table is updated each time a buyer wants to buy a product. sold by a particular seller

4. In products index, provide a link to buy the product, which should updated the join table with the buyer_id and find the corresponding product from the database and associate the seller of that product to the join table

5. in the buyer_seller create method, update the join table and redirect_to buyer page to pay through stripe


6. when a product is being created only the seller info is needed
hence product table must be linked only to the seller table

7. when a product is being bought we need the buyer info, but since product is being sold by a particular seller, it is possible to connect the product to the seller when a user buys it
