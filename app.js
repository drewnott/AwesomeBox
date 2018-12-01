async function getPpApplicants()
{
	var total = await contract.getTotalRegistered();

	for (var i=1; i<=total; i++)
	{
		var person = await contract.getPersonDemographicsById(i);
		alert(person[0]);
	}
}

function getPassports()
{
	//contract.getPersonDemo
}

function getRegistrar()
{

}

function apply_msg()
{
	alert("You applied successfully");
}

function send_reminder()
{
	alert("Reminder email sent");
}

function approve_application()
{
	alert("Application approved");
}

function view_application()
{
	alert("You're looking at the passport application");
}

async function getPerson(person_id)
{
	var tmpPerson = await getPersonDemographicsById(person_id);

	person[0].val = tmpPerson.name;
	person[1].val = tmpPerson.sex;
	person[2].val = tmpPerson.DOB;
	person[3].val = tmpPerson.placeOfBirth;
}

async function addPerson()
{
	var cName = "Lorenzo Carey";
	var cSex = "M";
	var cDob = 20180129;
	var cCob = "Vietnam";

	await contract.addPerson(cName, cSex, cDob, cCob);

	alert("Added");
}

function approvePassport()
{

}

function approveRegistrar()
{
	
}