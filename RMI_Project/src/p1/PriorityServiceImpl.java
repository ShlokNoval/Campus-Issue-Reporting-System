package p1;
import java.rmi.server.*;

public class PriorityServiceImpl extends UnicastRemoteObject implements PriorityService {

    protected PriorityServiceImpl() throws Exception {
        super();
    }

    public String getPriority(String issueType) {
        if(issueType.equalsIgnoreCase("water") || issueType.equalsIgnoreCase("electricity"))
            return "HIGH";
        else if(issueType.equalsIgnoreCase("wifi"))
            return "MEDIUM";
        else
            return "LOW";
    }
}