Trigger SameName on Contact(Before insert, Before Update){
    For(Contact c: Trigger.new){
        If(c.Firstname==c.Lastname){
            c.Lastname.adderror('Firstname and Lastname should not be same');
            }
    }
}