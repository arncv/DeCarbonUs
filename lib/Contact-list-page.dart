import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:form_field_validator/form_field_validator.dart';

const iOSLocalizedLabels = false;
class ContactListListPage extends StatefulWidget {
  @override
  _ContactListListPageState createState() => _ContactListListPageState();
}

class _ContactListListPageState extends State<ContactListListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCBCDE7),
      appBar: AppBar(
        backgroundColor: Color(0xff7283B3),
        elevation: 50.0,
        actions: [
          IconButton(
            onPressed: () async {
                Navigator.of(context).pushNamed("/add");

            },
            icon: Icon(
              Icons.add,
            ),
          )
        ],
      ),

    );
  }
}
  class AddContactPage extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => _AddContactPageState();
  }

  class _AddContactPageState extends State<AddContactPage> {
    Contact contact = Contact();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final requiredValidator = RequiredValidator(errorText: 'This field is required');

    final numberValidator = MultiValidator([
      RequiredValidator(errorText: 'This field is required'),
      MinLengthValidator(13, errorText: 'Mobile Number must be 10 digits long'),
    ]);

    late TextEditingController _controlOne;
    late TextEditingController _controlTwo;
    late TextEditingController _controlThree;

    @override
    void initState() {
      super.initState();
      _controlOne = new TextEditingController(text: '');
      _controlTwo = new TextEditingController(text: '');
      _controlThree = new TextEditingController(text: '+91');
    }

    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xffCBCDE7),
          appBar: AppBar(
            backgroundColor: Color(0xff7283B3),
            title: Text("Add a contact"),
            ),
            body: Container(
              padding: EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      validator: requiredValidator,
                      controller: _controlOne,
                      decoration: const InputDecoration(
                          labelText: 'First name',
                          labelStyle: TextStyle(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Mon',
                          ),
                      ),
                      onSaved: (v) => contact.givenName = v,
                     ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _controlTwo,
                        decoration: const InputDecoration(
                            labelText: 'Last name',
                          labelStyle: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Mon',
                          ),
                        ),
                        onSaved: (v) => contact.familyName = v,
                       ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
                      child: TextFormField(
                        validator: numberValidator,
                        controller: _controlThree,
                        decoration: const InputDecoration(
                            labelText: 'Phone',
                          labelStyle: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Mon',
                          ),
                        ),
                        onSaved: (v) =>
                        contact.phones = [Item(label: "mobile", value: v)],
                        keyboardType: TextInputType.phone,
                       ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(260.0, 30.0, 0.0, 0.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.validate()?
                              setState((){
                                _formKey.currentState!.save();
                                ContactsService.addContact(contact);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                  elevation: 50.0,
                                  backgroundColor: Color(0xff7283B3),
                                  title: const Text('Add Contacts'),
                                  titleTextStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                  content: const Text('Do you want to add more contacts?'),
                                  contentTextStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: (){
                                        _controlOne.clear();
                                        _controlTwo.clear();
                                        _controlThree.clear();
                                        _controlThree.text = '+91';
                                        Navigator.of(context).pop();
                                      },
                                      style: TextButton.styleFrom(
                                        primary: Colors.black,
                                      ),
                                      child: const Text(
                                        'Continue',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: 'BB'
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Colors.black,
                                      ),
                                      child: const Text(
                                        'No',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: 'BB'
                                        ),
                                      ),
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                )
                                );
                              }):ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Invalid Entry'),
                          ));
                        },
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                            fontSize: 22.0,
                            fontFamily: 'Mon',

                          ),
                      ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(40.0,60.0),
                          primary: Color(0xFF07224C),
                          onPrimary: Color(0XFFFFFFFF),
                          shadowColor: Colors.grey[100],
                          elevation: 50.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                   ],
                 ),
               ),
             ),
          ),
      );
      }
  }
