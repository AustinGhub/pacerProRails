# How to set up Rails app
To set up, follow the directions below:

1. Clone the github repository so that it can be accessed on a local machine/folder/directory. In the terminal use the "cd" command to go into the desired location of where the folder of the repository should be. Use the command "git clone <url>" to clone the repository and access it on the computer.
2. To run the rspec tests on the **Item** model, generate the model first by running "rails generate rspec:model Item" and then run the command "rspec spec/models/item_spec.rb" to test. Make sure rspec is downlaoded as well.

# Summary of the model and the functions

The model is named Item with **name** and **date_time** attributes along with two functions: one to soft delete items and one to restore items. Initially, added items will have the **date_time** attribute be set to **nil**. When the **soft_delete** method is called, the function will update the **deleted_at** attribute to a **datetime** type of the current time. This makes it so that the item is soft deleted, queries won't show the deleted items because the default scope will only show items whose **date_time** attribute is nil and the **soft_delete** method makes it so that the attribute contains the current time of deletion. This doesn't actually permanatly delete anything from the database. The **restore** method reverts the changes of the **soft_delete** by changing the **date_time** attribute of the soft deleted item back to **nil**.
