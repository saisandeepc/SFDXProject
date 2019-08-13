trigger C_t1 on Contact (before insert,before update){
        for(Contact c : Trigger.New){
        if(trigger.isinsert && c.email == null)
        c.addError('You cannot save a new record without Email');
        else 
        c.addError('You can not save an existing record without Email.Plese provide Email');
        }
}