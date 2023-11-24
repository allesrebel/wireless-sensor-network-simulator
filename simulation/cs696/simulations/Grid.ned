package cs696.simulations;

//import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.contract.INetworkNode;
import inet.node.inet.SensorNode;
import inet.physicallayer.wireless.common.medium.RadioMedium;
import inet.visualizer.common.IntegratedVisualizer;


network Grid
{
    parameters:
        int numHosts @prompt("Number of hosts") = default(9);
    submodules:
        visualizer: IntegratedVisualizer {
            @display("p=580,125");
        }
//        configurator: Ipv4NetworkConfigurator {
//            @display("p=580,200");
//        }
        radioMedium: RadioMedium {
            @display("p=580,275");
        }
        host[numHosts]: SensorNode {
        }
        target: SensorNode {
            @display("p=150,150");
        }

}