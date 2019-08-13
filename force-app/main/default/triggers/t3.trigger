trigger t3 on Opportunity (before insert) {

double Total_amount = 0;
for(opportunity o1:[Select amount from opportunity where createddate = today and createdbyid =:userinfo.getuserid()]){
Total_amount  += o1.amount;
    }
 for(Opportunity o2: trigger.new){
 Total_amount  += o2.amount;

            if(total_amount >100000)
            o2.adderror('You have exceed daily limit');
                        }
}