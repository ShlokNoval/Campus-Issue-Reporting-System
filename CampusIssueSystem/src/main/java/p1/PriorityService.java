package p1;
import java.rmi.*;

public interface PriorityService extends Remote {
    String getPriority(String issueType) throws RemoteException;
}