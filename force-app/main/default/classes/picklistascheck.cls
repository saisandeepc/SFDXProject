public with sharing class picklistascheck {
    public List<String> IndustryName { get; set; }
        
        public picklistascheck(){
            IndustryName = new List<String>();
        }
        
        public List<selectoption> getIndustryNames(){          
            
            list<selectoption> options = new list<selectoption>();           
            try
            {              
            //Product Name is a MultiSelect Picklist              
            Schema.DescribeFieldResult fieldResult = Account..fields.Industry.getDescribe();
    
            list<schema.picklistentry> values = fieldResult.getPickListValues();              
            for (Schema.PicklistEntry a : values)
            {                 
            options.add(new SelectOption(a.getLabel(), a.getValue()));
            }          
            } 
            catch (Exception e)
            {            
            ApexPages.addMessages(e);          
            }
            system.debug('## Product Name Options'+ options);         
            return options;
        }
}