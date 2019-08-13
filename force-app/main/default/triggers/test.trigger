trigger test on Lead (before update){
    for(Lead Id: trigger.new)
    {
        if(Id.Email != trigger.oldMap.get(Id.Id).email)
        {
            Id.Prior_Email__c = trigger.oldMap.get(Id.Id).email;
            update Id;
        }
    }
}