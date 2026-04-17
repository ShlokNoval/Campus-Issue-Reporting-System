package p1;
import java.rmi.*;
import java.rmi.registry.*;

public class RMIServer {
    public static void main(String args[]) {
        try {

            // ✅ Try to create registry, if already exists → ignore
            try {
                LocateRegistry.createRegistry(1099);
                System.out.println("Registry created");
            } catch(Exception e) {
                System.out.println("Registry already exists");
            }

            PriorityServiceImpl obj = new PriorityServiceImpl();

            Naming.rebind("rmi://localhost/PriorityService", obj);

            System.out.println("RMI Server Running...");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}