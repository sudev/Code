import java.net.*;
import java.io.*;
 
public class PortMonitor {
 
    /**
     * JavaProgrammingForums.com
     */
    public static void main(String[] args) throws Exception {
 
        //Port to monitor
        final int myPort = 80;
        ServerSocket ssock = new ServerSocket(myPort);
        System.out.println("port " + myPort + " opened");
 
        Socket sock = ssock.accept();
        System.out.println("Someone has made socket connection");
 
        OneConnection client = new OneConnection(sock);
        String s = client.getRequest();
 
    }
 
}
 
class OneConnection {
    Socket sock;
    BufferedReader in = null;
    DataOutputStream out = null;
 
    OneConnection(Socket sock) throws Exception {
        this.sock = sock;
        in = new BufferedReader(new InputStreamReader(sock.getInputStream()));
        out = new DataOutputStream(sock.getOutputStream());
    }
 
    String getRequest() throws Exception {
        String s = null;
        while ((s = in.readLine()) != null) {
            System.out.println("got: " + s);
        }
        return s;
    }
}
