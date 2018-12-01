//Formats JSON received from contract and updates the GUI
var person = 
[
	{ tag:"Name", val:"Andrew G W Nottage" },
	{ tag: "Sex", val:"Male" },
	{ tag: "Date of Birth", val:"06-Jan-1987" },
	{ tag: "Place of Birth", val:"Bahamas" },
	{ tag: "Passport", val: "0"}
];

var documents = 
{ 
	name: "Passport", status: "0"
};

var ppo_docs = 
[
	{ id: "1", name: "Lorenzo Carey", status: "0"},
	{ id: "2", name: "Patrick Murray", status: "1"},
	{ id: "3", name: "Christian Pratt", status: "2"},
	{ id: "4", name: "Jack Wu", status: "3"},
	{ id: "5", name: "Andrew Nottage", status: "1"},
];


function load_signup()
{
	//Clear previous data
	$("#content").empty();

	//Create page components
	var pageTitle = $("<h2></h2>");

	//Set values for components
	pageTitle.text("Register New Profile");

	//Add components to page content
	$("#content").append(pageTitle);

	//Get person's demographic info and add to section
	for (var i=person.length-1; i>=0; i--)
	{
		//Setup HTML elements
		var line = $("<p></p>");
		var label = $("<span></span>");
		var field = $("<input type=\"text\"/>");

		//Set values/modifiers for the elements
		label.text(person[i].tag);

		//Add elements to each field
		line.append(label);
		line.append(field);

		pageTitle.after(line);
	};

	//var submit = $("<input type=\"submit\"/>");
	var submit = $("<button>Apply</button>");
	submit.click(apply_msg);

	//pageTitle.after(submit);
	$("#content").append(submit);
}

function load_myinfo()
{
	//getPerson(1);

	//Clear previous data
	$("#content").empty();

	//Create page components
	var pageTitle = $("<h2></h2>");

	//Set values for components
	pageTitle.text("Registrant Profile");

	//Add components to page content 
	$("#content").append(pageTitle);

	//Get person's demographic info and add to section
	for (var i=person.length-1; i>=0; i--)
	{
		//Setup HTML elements
		var line = $("<p></p>");
		var label = $("<span></span>");
		var field = $("<input type=\"text\" readonly=\"readonly\"/>");//var field = $("<span></span>");

		//Set values/modifiers for the elements
		label.text(person[i].tag);
		field.attr("value", person[i].val); //field.text(person[i].val);

		//Add elements to each field
		line.append(label);
		line.append(":");
		line.append(field);

		//Place fields after the heading
		pageTitle.after(line);
	};
}

function load_ppo()
{
	//getPpApplicants();

	//Clear previous data
	$("#content").empty();

	//Create page components
	var pageTitle = $("<h2></h2>");

	//Set values for components
	pageTitle.text("Passport Applications");

	//Add components to page content 
	$("#content").append(pageTitle);
	
	//Load any documents that person has and update in table
	var table = $("<table></table");
	var tblHdr = table.append("<thead></thead>");
	var tblData = table.append("<tbody></tbody>");

	tblHdr.append("<tr><th>Person ID</th><th>Name</th><th>Status</th><th>Action</th></tr>")

	//Populate Passport Applications table with data
	for (var i=0; i<ppo_docs.length; i++)
	{
		//Create new row in table
		var trow = $("<tr></tr>");

		//Create cells
		var personId = $("<td></td>");
		var personName = $("<td></td>");
		var docStatus = $("<td></td>");
		var docAction = $("<td></td>");

		//Set values of cells
		personId.text(ppo_docs[i].id);
		personName.text(ppo_docs[i].name);

		//Set status and action (based on status)
		switch (ppo_docs[i].status)
		{
			//Document requested and pending
			case "1":
				docStatus.text("Awaiting Approval");
				//docAction.html("<button>Approve</button>");
				var actionBtn = $("<button>Approve</button>");
				actionBtn.click(approve_application);
				docAction.append(actionBtn);
				break;
			//Document submitted and approved
			case "2":
				docStatus.text("Approved");
				var actionBtn = $("<button>View</button>");
				actionBtn.click(view_application);
				docAction.append(actionBtn);//docAction.html("<button>View</button>");
				break;
			//Document not requsted or issued yet
			default:
				docStatus.text("Not Issued");
				var actionBtn = $("<button>Send Reminder</button>");
				actionBtn.click(send_reminder);
				docAction.append(actionBtn);//html("<button>Send Reminder</button>");
		}

		//Add cells to the row
		trow.append(personId);
		trow.append(personName);
		trow.append(docStatus);
		trow.append(docAction);

		//Add row to the table
		tblData.append(trow);
	}

	pageTitle.after(table);
}
