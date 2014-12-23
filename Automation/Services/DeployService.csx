using Octopus.Client;
using Octopus.Client.Model;
using Octopus.Client.Exceptions;

public class OctopusService {
    private OctopusRepository repository;
    private IOctopusClient client;
    private string octopusApiUrl;
    private string octopusApiKey;
    private SettingValues settings = new SettingValues();

    public string ApiUrl{ get { return settings.OctopusApiUrl; } }

    private OctopusRepository Repository {
        get {
            if(repository == null) {
                var endpoint = new OctopusServerEndpoint(settings.OctopusApiUrl, settings.OctopusApiKey);
                repository = new OctopusRepository(endpoint);
                client = repository.Client;
            }

            return repository;
        }
    }

    public string GetCheckoutDirectoryFromTeamCity(string argument){
        return ParseArgument("checkoutDir", argument);
    }

    public bool ServiceIsConnectable {
        get {
            return Repository != null && Repository.ServerStatus != null;
        }
    }

    public bool MechineExists(string name) {
        var machines = Repository.Machines.FindAll().FirstOrDefault(e => e.Name.Equals(name));
        return machines != null;

    }

    public bool MachineIsConnectable(string name) {
        var machine = Repository.Machines.FindAll().FirstOrDefault(e => e.Name.Equals(name));
        if(machine != null) {
            var machineResource = Repository.Machines.Get(machine.Id);
            return machineResource.Status == MachineModelStatus.Online;
        }

        throw new ArgumentException("Machine does not exist");
    }

    private string ParseArgument(string argumentName, string argumentNameAndValue){
        var argumentValue = string.Format("-{0}:", argumentName);
        var value = argumentNameAndValue.Split(new string[] { argumentValue }, StringSplitOptions.None).ElementAt(1);
        return value;
    }
}
