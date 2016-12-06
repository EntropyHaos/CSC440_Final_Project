package entities;

public class Validable {

    /**
     * Just to check if inputs are valid
     * @return
     */
    

    private boolean validationIsDisable = true;

    public boolean isValid(Object objectIn){
        return true;
    }
/*
    public boolean isValid(Provider provider){

        if (validationIsDisable) return true;

        if(provider.getProviderNumber() == null || provider.getProviderNumber().length() != 9) return false;
        for(int i = 0; i < provider.getProviderNumber().length(); i++){
            if(!Character.isDigit(provider.getProviderNumber().charAt(i)))
                return false;
        }
        if(provider.getProviderName() == null || provider.getProviderName().length() > 25)
            return false;
        if(provider.getProviderStreetAddress() == null || provider.getProviderStreetAddress().length() > 25)
            return false;
        if(provider.getProviderCity() == null || provider.getProviderCity().length() > 25)
            return false;
        if(provider.getProviderState() == null || provider. getProviderState().length() > 25)
            return false;
        if(provider.getProviderZip() == 0 || (String.valueOf(provider.getProviderZip())).length() != 5)
            return false;
        for(int i = 0; i < (String.valueOf(provider.getProviderZip())).length(); i++){
            if(!Character.isDigit((String.valueOf(provider.getProviderZip())).charAt(i)))
                return false;
        }
        return true;
    }

    public boolean isValid(User user){
        
        if (validationIsDisable) return true;
        
        if(user.getMemberNumber() == null || user.getMemberNumber().length() != 9) return false;
        for(int i = 0; i < user.getMemberNumber().length(); i++){
            if(!Character.isDigit(user.getMemberNumber().charAt(i)))
                return false;
        }
        if(user.getMemberName() == null || user.getMemberName().length() > 25)
            return false;
        if(user.getMemberStreetAddress() == null || user.getMemberStreetAddress().length() > 25)
            return false;
        if(user.getMemberCity() == null || user.getMemberCity().length() > 14)
            return false;
        if(user.getMemberState() == null || user.getMemberState().length() > 2)
            return false;
        if(user.getMemberZip() == 0 || (String.valueOf(user.getMemberZip())).length() != 5)
            return false;
        for(int i = 0; i < (String.valueOf(user.getMemberZip())).length(); i++){
            if(!Character.isDigit((String.valueOf(user.getMemberZip())).charAt(i)))
                return false;
        }
        return true;
    }

    public boolean isValid(Service service){

        if (validationIsDisable) return true;

        if(service.getProvidableServiceIdNum() == null || service.getProvidableServiceIdNum().length() != 6) return false;
        for(int i = 0; i < service.getProvidableServiceIdNum().length(); i++){
            if(!Character.isDigit(service.getProvidableServiceIdNum().charAt(i)))
                return false;
        }
        if(service.getProvidableServiceDescription() == null || service.getProvidableServiceDescription().length() > 20)
            return false;
        return true;
    }


    public boolean isValid(Billable billable){

        if (validationIsDisable) return true;

        if(billable.getChocoServiceProvidedIdNumber() == null || billable.getChocoServiceProvidedIdNumber().length() < 6) return false;
        for(int i = 0; i < billable.getChocoServiceProvidedIdNumber().length(); i++){
            if(!Character.isDigit(billable.getChocoServiceProvidedIdNumber().charAt(i)))
                return false;
        }
        if(billable.getMemberNumberService() == null || billable.getMemberNumberService().length() < 9) return false;
        for(int i = 0; i < billable.getMemberNumberService().length(); i++){
            if(!Character.isDigit(billable.getMemberNumberService().charAt(i)))
                return false;
        }
        if(billable.getProviderNumberServicing() == null || billable.getProviderNumberServicing().length() < 9) return false;
        for(int i = 0; i < billable.getProviderNumberServicing().length(); i++){
            if(!Character.isDigit(billable.getProviderNumberServicing().charAt(i)))
                return false;
        }
        if(billable.getDateServiced() == null || !billable.getDateServiced().matches("^\\d{2}\\-\\d{2}\\-\\d{4}"))
            return false;
        if(billable.getDateServicedRecorded() == null || !billable.getDateServicedRecorded().matches("^\\d{2}\\-\\d{2}\\-\\d{4}\\s{1}\\d{2}\\:\\d{2}\\:\\d{2}"))
            return false;
        if(billable.getServiceComment().length() > 100)
            return false;
        return true;
    }
*/
}
