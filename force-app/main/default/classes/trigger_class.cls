public class trigger_class {
public static void check_opp(List<Opportunity> ops){

double Total_amount = 0;
for(opportunity o1:[Select amount from opportunity where createddate = today and createdbyid =:userinfo.getuserid()]){
Total_amount  += o1.amount;
    }
 for(Opportunity o2: ops){
 Total_amount  += o2.amount;

            if(total_amount >100000)
            o2.adderror('You have exceed daily limit');
                        }
                            }
}