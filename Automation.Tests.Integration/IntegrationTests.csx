using TestStack.BDDfy.Core;

[TestFixture]
[Story(
        Title ="Integration tests for ProjectName",
        AsA = "As a developer",
        IWant = "I want the target machine 'ProjectName' connectable",
        SoThat = "So that I can deploy to that specific machine")]
public class VerksamhetswebbarnaIntegrationTests {
    private string specificMachine;
    private OctopusService service;

    [SetUp]
    public void WhenTheOctopusServiceIsConnectable(){
        specificMachine = "TheMachineName";
        service = new OctopusService();
        Assert.IsTrue(service.ServiceIsConnectable);
    }

    public void AndWhenATargetMachineIsSpecifiedAndExists() {
        var machineIsConnectable = service.MachineIsConnectable(specificMachine);
        Assert.IsTrue(machineIsConnectable);
    }

    public void ThenTheSpecifiedMachineShouldRespondOk(){
        var machineIsConnectable = service.MachineIsConnectable(specificMachine);
        Assert.IsTrue(machineIsConnectable);
    }

    [Test]
    public void Execute() {
        this.BDDfy();
    }
 }
