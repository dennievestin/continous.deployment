using System.Linq;
using TestStack.BDDfy.Core;
using System.Net.NetworkInformation;

[TestFixture]
[Story(
        Title ="Integration tests for sto-stos42 and sto-stos47",
        AsA = "As a developer",
        IWant = "I want the target machins to be reachable",
        SoThat = "So that I can start deployment")]
public class MachineIntegrationTests {
    private string[] machines = { "sto-stos42", "sto-stos47" };
    private OctopusService service;

    [SetUp]
    public void GivenMachinesAreSpecified(){
        Assert.IsTrue(machines.Any());
    }

    public void WhenMachinesAreSpecified(){
        Assert.AreEqual("sto-stos42,sto-stos47", string.Join(",", machines));
    }

    public void ThenTheyShouldBeConnectable() {
        foreach (var machine in machines) {
            Assert.IsTrue(IsConnectable(machine));
        }
    }
    
    public static bool IsConnectable(string name) {
        bool result = false;
        var p = new Ping();
        try         {
            var reply = p.Send(name, 1000);
            if (reply.Status == IPStatus.Success)
                return true;
        }
        catch {}

        return result;
    }

    [Test]
    public void Execute() {
        this.BDDfy();
    }
 }
