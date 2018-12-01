function getContract()
{
    let address = "0xeba96d81429b656c232b9c4bf4373ecaeb678cf2";
    let abi = [
	{
		"constant": false,
		"inputs": [],
		"name": "addPassport",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_name",
				"type": "string"
			},
			{
				"name": "_sex",
				"type": "string"
			},
			{
				"name": "_dob",
				"type": "uint256"
			},
			{
				"name": "_pob",
				"type": "string"
			}
		],
		"name": "addPerson",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_addy",
				"type": "address"
			}
		],
		"name": "addRegistrar",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_addy",
				"type": "address"
			}
		],
		"name": "approveEdit",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_ID",
				"type": "uint256"
			},
			{
				"name": "_pob",
				"type": "string"
			}
		],
		"name": "editPerson",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_ID",
				"type": "uint256"
			},
			{
				"name": "_dl",
				"type": "uint256"
			}
		],
		"name": "editPersonDL",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_ID",
				"type": "uint256"
			},
			{
				"name": "_dob",
				"type": "uint256"
			}
		],
		"name": "editPersonDOB",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_ID",
				"type": "uint256"
			},
			{
				"name": "_NIB",
				"type": "uint256"
			}
		],
		"name": "editPersonNIB",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_addy",
				"type": "address"
			}
		],
		"name": "inactiveRegistrar",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"name": "name",
				"type": "string"
			},
			{
				"indexed": false,
				"name": "sex",
				"type": "string"
			},
			{
				"indexed": false,
				"name": "dob",
				"type": "uint256"
			},
			{
				"indexed": false,
				"name": "passport",
				"type": "uint256"
			},
			{
				"indexed": false,
				"name": "dl",
				"type": "uint256"
			},
			{
				"indexed": false,
				"name": "NIB",
				"type": "uint256"
			},
			{
				"indexed": false,
				"name": "pob",
				"type": "string"
			}
		],
		"name": "addedPerson",
		"type": "event"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "_ID",
				"type": "uint256"
			}
		],
		"name": "getPersonDemographicsById",
		"outputs": [
			{
				"name": "",
				"type": "string"
			},
			{
				"name": "",
				"type": "string"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "_ID",
				"type": "uint256"
			}
		],
		"name": "getPersonDocumentsById",
		"outputs": [
			{
				"name": "",
				"type": "string"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "getTotalRegistered",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"name": "persons",
		"outputs": [
			{
				"name": "name",
				"type": "string"
			},
			{
				"name": "sex",
				"type": "string"
			},
			{
				"name": "ID",
				"type": "uint256"
			},
			{
				"name": "DOB",
				"type": "uint256"
			},
			{
				"name": "Passport",
				"type": "uint256"
			},
			{
				"name": "DL",
				"type": "uint256"
			},
			{
				"name": "NIB",
				"type": "uint256"
			},
			{
				"name": "placeOfBirth",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	}
];

    // this.provider = new ethers.providers.Web3Provider(web3.currentProvider); // connect to Metamask
    let provider = new ethers.providers.JsonRpcProvider("http://localhost:7545"); // connect to Ganache locally
    let contract = new ethers.Contract(address, abi, provider.getSigner());

    console.log("Contract Initialization Successful");
    return contract;
}

var contract = getContract();