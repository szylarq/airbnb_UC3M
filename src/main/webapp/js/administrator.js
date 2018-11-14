$(document).ready(function() {

});

function selectUserCell(id, elementsNumber) {

	for (var i = 0; i < elementsNumber; i++) {
		var currnet_id = "user-cel-" + i;
		var currnet_cell = document.getElementById(currnet_id);
		currnet_cell.className = "user-cel";
	}
	var cell = document.getElementById(id);

	cell.className = "user-cel-active";

	var email = cell.children[0].innerText;
	var name = cell.children[1].innerText;
	var surname = cell.children[2].innerText;
	var phone_raw = cell.children[3].innerHTML;
	var phone = phone_raw.trim();

	var phoneField = cell.children[3].childNodes[0];

	document.getElementById("user-email").value = email;
	document.getElementById("user-name").value = name;
	document.getElementById("user-surname").value = surname;
	document.getElementById("user-phone-number").value = phone;

}

function messageUser() {
	var message = prompt("Please enter your message");

}

function updateUserData() {

	var selectedUserEmail = $("#user-email").val();
	var selectedUserName = $("#user-name").val();
	var selectedUserSurname = $("#user-surname").val();
	var selectedUserPhone = $("#user-phone-number").val();

	if (selectedUserEmail != null && selectedUserEmail != "") {
		if (selectedUserName != null && selectedUserName != ""
				&& selectedUserSurname != null && selectedUserSurname != ""
				&& selectedUserPhone != null && selectedUserPhone != "") {
			$.post("/airbnb/administatorUsers", {
				action : "updateUser",
				email : selectedUserEmail,
				name : selectedUserName,
				surname : selectedUserSurname,
				phoneNumber : selectedUserPhone
			}).done(function(status) {
				if (status == 1) {
					if (alert("User data updated successfully")) {
					} else
						window.location.reload();
				} else if (status == 0)
					alert("Incorrect Data");
				else
					alert("Unknow error");
			});
		} else {
			alert("You can't leav empty fields");
		}

	} else {
		alert("User not selected");
	}
}

function changePassword() {

	var selectedUserEmail = $("#user-email").val();

	if (selectedUserEmail != null && selectedUserEmail != "") {
		var password = prompt("Please enter new password");

		if (password != null && password != "") {
			// to do get
			$.post("/airbnb/administatorUsers", {
				action : "changePassword",
				password : password,
				email : selectedUserEmail
			}).done(function(status) {
				if (status == 1)
					alert("Password updated successfully");
				else if (status == 0)
					alert("Incorrect Password");
				else
					alert("Unknow error");
			});

		}else {
			alert("Enter new password");
		}

	} else {
		alert("User not selected");
	}

}

function deleteUser() {

	var selectedUserEmail = $("#user-email").val();

	if (selectedUserEmail != null && selectedUserEmail != "") {

		if (confirm("Do you want to delete this user?")) {
			$.post("/airbnb/administatorUsers", {
				action : "deleteUser",
				email : selectedUserEmail
			}).done(function(status) {
				if (status == 1) {
					if (alert("User deleteed successfully")) {
					} else
						window.location.reload();
				} else if (status == 0)
					alert("Incorrect Data");
				else
					alert("Unknow error");
			});

		}

	} else {
		alert("User not selected");
	}

}

// *********************** administratorHomes ***********************

function deletePlace() {
	confirm("Do you want to delete this place?");
}





function selectApartmentCell(id, elementsNumber) {

	for (var i = 0; i < elementsNumber; i++) {
		var currnet_id = "place-cel-" + i;
		var currnet_cell = document.getElementById(currnet_id);
		currnet_cell.className = "place-cel";
	}
	var cell = document.getElementById(id);

	cell.className = "place-cel-active";

	var email = cell.children[0].innerText;
	var apartment_name = cell.children[1].innerText;
	var cuntry = cell.children[2].innerText.trim();
	var price = cell.children[3].innerHTML.trim();
	var type = cell.children[4].innerText.trim();
	var adultsBeds = cell.children[5].innerHTML.trim();
	var childrensBeds = cell.children[6].innerHTML.trim();
	var descriptions = cell.children[7].innerText.trim();

	document.getElementById("host-email").value = email;
	document.getElementById("apartment-name").value = apartment_name;
	document.getElementById("apartment-country").value = cuntry;
	document.getElementById("apartment-price").value = price;
	document.getElementById("apartment-type").value = type;
	document.getElementById("apartment-adults-beds").value = adultsBeds;
	document.getElementById("apartment-child-beds").value = childrensBeds ;
	document.getElementById("place-description").value = descriptions;


}

function updateApartmentData() {
	
	
	var email = $("#host-email").val();
	var placeName = $("#apartment-name").val();
	var cuntry = $("#apartment-country").val();
	var price = $("#apartment-price").val().toString();
	
	var type = $("#apartment-type").val();
	var adults_beds = $("#apartment-adults-beds").val().toString();
	var childeren_beds = $("#apartment-child-beds").val().toString();
	var description = $("#place-description").val();
	

	

	if (email != null && email != "") {
		if (placeName != null && placeName != ""
				&& cuntry != null && cuntry != ""
				&& price != null && price != ""
				&& type != null && type != ""
				&& adults_beds != null && adults_beds != ""
				&& childeren_beds != null && childeren_beds != ""
				&& description != null && description != "") 
		{
		
		
			var place_cel_active = $(".place-cel-active")[0];
			
			var building_number = place_cel_active.children[8].innerHTML.toString().trim();
			var street = place_cel_active.children[9].innerText.trim();
			var flat_number = place_cel_active.children[10].innerHTML.toString().trim();
			var city = place_cel_active.children[11].innerText.trim();
			
			var apartment = {
					email : email,
					placeName : placeName,
					cuntry : cuntry,
					price : price,
					type : type,
					adults_beds : adults_beds,
					childeren_beds : childeren_beds,
					description : description,
					building_number : building_number, 
					street : street,
					flat_number : flat_number, 
					city : city	
		      }
			
			
			$.post("/airbnb/administatorHomes", {                  
				action : "updateApartment",
				email : email,
				placeName : placeName,
				cuntry : cuntry,
				price : price,
				type : type,
				adults_beds : adults_beds,
				childeren_beds : childeren_beds,
				description : description,
				building_number : building_number, 
				street : street,
				flat_number : flat_number, 
				city : city
				
			}).done(function(status) {
				if (status == 1) {
					if (alert("User data updated successfully")) {
					} else
						window.location.reload();
				} else if (status == 0)
					alert("Incorrect Data");
				else
					alert("Unknow error");
			});
		} 
		else {
			alert("You can't leav empty fields");
		}

	} else {
		alert("User not selected");
	}
}


function deleteApartment() {

	var place_cel_active = $(".place-cel-active")[0];
	
	var building_number = place_cel_active.children[8].innerHTML.trim();
	var street = place_cel_active.children[9].innerText.trim();
	var flat_number = place_cel_active.children[10].innerHTML.trim();
	var city = place_cel_active.children[11].innerText.trim();
	
	var email = $("#host-email").val();

	

	if (email != null && email != "") {

		if (confirm("Do you want to delete this apartment?")) {
			$.post("/airbnb/administatorHomes", {
				action : "deletePlace",
				email : email,
				building_number : building_number,
				street : street,
				flat_number : flat_number,
				city : city,
			}).done(function(status) {
				alert(status);
				if (status == 1) {
					if (alert("Apartment deleteed successfully")) {
					} else
						window.location.reload();
				} else if (status == 0)
					alert("Incorrect Data");
				else
					alert("Unknow error");
			});

		}

	} else {
		alert("Apartment not selected");
	}

}






