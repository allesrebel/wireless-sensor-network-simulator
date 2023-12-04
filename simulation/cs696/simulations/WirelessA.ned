//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package inet.tutorials.wireless;

import inet.environment.contract.IPhysicalEnvironment;
import inet.examples.mobility.MobileHost;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.contract.INetworkNode;
import inet.physicallayer.wireless.common.contract.packetlevel.IRadioMedium;
import inet.visualizer.contract.IIntegratedVisualizer;

network WirelessA
{
    parameters:
        @display("bgb=650,500;bgg=100,1,grey95");
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

        @figure[rcvdPkText](type=indicatorText; pos=380,20; anchor=w; font=,18; textFormat="packets received: %g"; initialValue=0);
        @statistic[packetReceived](source=hostBase.app[0].packetReceived; record=figure(count); targetFigure=rcvdPkText);

    submodules:
        visualizer: <default(firstAvailableOrEmpty("IntegratedCanvasVisualizer"))> like IIntegratedVisualizer if typename != "" {
            @display("p=580,125");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=580,200");
        }
        radioMedium: <default("UnitDiskRadioMedium")> like IRadioMedium {
            @display("p=580,275");
        }
        hostSensorA: <default("WirelessHost")> like INetworkNode {
            @display("p=49.392002,51.408");
        }
        hostSensorB: <default("WirelessHost")> like INetworkNode {
            @display("p=249.98401,51.408");
        }
        hostSensorC: <default("WirelessHost")> like INetworkNode {
            @display("p=453.6,44.352");
        }
        hostSensorD: <default("WirelessHost")> like INetworkNode {
            @display("p=49.392002,249.98401");
        }
        hostSensorE: <default("WirelessHost")> like INetworkNode {
            @display("p=453.6,249.98401");
        }
        hostBase: <default("WirelessHost")> like INetworkNode {
            @display("p=249.98401,249.98401");
        }
        mobiletarget: MobileHost {
            @display("p=339.696,164.304");
        }
}
