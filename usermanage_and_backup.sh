#!/bin/bash

add_user()
{
echo "Enter the name of the user:"
read username
sudo useradd "$username"
sudo passwd "$username"
}


delete_user()
{
echo "Enter the name of the user"
read username 
sudo userdel "$username"
echo "user $username deleted successfully"

}



modify_user()
{

echo "Enter the new username"
read new_username
echo "Enter the old username"
read old_username
sudo usermod -l $new_username $old_username
echo "$new_username modifled successfully"
}


group_add()
{
echo "Enter the name of the group "
read group_name
echo "$group_name added successfully"
}


group_del()
{
echo "Enter the name of the group you want to delete "
read group_name
echo "$group_name deleted successfully"
}


show_menu()
{
echo "Choose the operation you want to perform "
echo "1.) add the user"
echo "2.) delete the user"
echo "3.) Modify the user "
echo "4.) add group "
echo "5.) delete group "
echo "6.) backup file "

}


modify_group()
{
echo "Enter the old name of the group "
read old_groupname
echo "Enter the new name of the group "
read new_groupname
groupmod -n "$new_groupname" "$old_groupname"
echo "$new_groupname added successfully"
}






backup_file() {
src_dir="ADD SOURCE DIRECTORY PATH"
target_dir="ADD DESTINATION DISRECTORY PATH"
current_timestamp=$(date +"%Y%m%d%H%M%S")
echo "Taking backup for timestamp $current_timestamp"
final_file="$target_dir/scripts-backup-$current_timestamp.tgz"
echo "$final_file created"
tar czf "$final_file" -C "$src_dir" .
}





while true;
do

show_menu
read choice

case $choice in
1) add_user ;;
2) delete_user ;;
3) modify_user ;;
4) group_add   ;;
5) group_del   ;;
6) backup_file ;;
esac
done
