package phasetwo;

import inet.common.misc.ThruputMeteringChannel;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth100M;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;


@license(LGPL);
//
// TODO documentation
//
network phasetwo
{
	parameters:
		double edgeDatarate @unit(bps);
		double coreDatarate @unit(bps);
		
		@display("bgb=800,450");
	types: 
		channel coreline extends ThruputMeteringChannel
		{
            delay = 2ms;
            datarate = coreDatarate;
            thruputDisplayFormat = "b B U";
		}
		channel edgeline extends ThruputMeteringChannel
        {
            delay = 2ms;
            datarate = edgeDatarate;
            thruputDisplayFormat = "b B U";
        }
	submodules:
		H1: StandardHost {
            @display("p=39,222");
            gates:
            	ethg[1];
		}
		H2: StandardHost {
		    @display("p=661.76,214.03801");
			gates:
				ethg[1];
		}
		R1: Router {
		    @display("p=115,222");
			gates:
			    ethg[1];
		}
		R2: Router {
		    @display("p=180.95,298.82602");
		}
		R3: Router {
		    @display("p=181,153");
		}
		R4: Router {
			@display("p=253.33,214.03801");
		}
        R5: Router {
        	@display("p=253.33,283.316");
        }
        R8: Router {
        	@display("p=370,299");
        }
        R13: Router {
        	@display("p=570.768,283.316");
        }
        R6: Router {
        	@display("p=326,222");
        }
        R11: Router {
        	@display("p=481,184");
        }
        R10: Router {
        	@display("p=480.81,298.82602");
        }
        R14: Router {
    		@display("p=595.584,214.03801");
    		gates:
        		ethg[1];
		}
        R12: Router {
        	@display("p=555.258,151.998");
        }
        R7: Router {
        	@display("p=370,153");
        }
        R9: Router {
        	@display("p=409,222");
        }
        configurator: Ipv4NetworkConfigurator {
        	@display("p=612,25");
        }
    connections:
        //Between hosts and routers
        H1.ethg[0] <--> Eth100M <--> R1.ethg[0];
        H2.ethg[0] <--> Eth100M <--> R14.ethg[0];
        //Between routers
        R1.pppg++ <--> edgeline <--> R3.pppg++;
        R1.pppg++ <--> edgeline <--> R2.pppg++;
        R5.pppg++ <--> edgeline <--> R6.pppg++;
        R6.pppg++ <--> edgeline <--> R7.pppg++;
        R6.pppg++ <--> edgeline <--> R8.pppg++;
        R11.pppg++ <--> edgeline <--> R12.pppg++;
        R11.pppg++ <--> edgeline <--> R10.pppg++;
        R3.pppg++ <--> coreline <--> R2.pppg++;
        R3.pppg++ <--> coreline <--> R4.pppg++;
        R2.pppg++ <--> coreline <--> R5.pppg++;
        R4.pppg++ <--> coreline <--> R5.pppg++;
        R7.pppg++ <--> coreline <--> R8.pppg++;
        R8.pppg++ <--> coreline <--> R9.pppg++;
        R9.pppg++ <--> coreline <--> R11.pppg++;
        R12.pppg++ <--> coreline <--> R10.pppg++;
        R12.pppg++ <--> coreline <--> R14.pppg++;
        R13.pppg++ <--> coreline <--> R14.pppg++;
        R10.pppg++ <--> coreline <--> R13.pppg++;
}
		

