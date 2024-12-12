part of 'widgets.dart';

class CardProvince extends StatefulWidget {
  final Province province;
  final int index;  // Tambahkan parameter index untuk penomoran

  const CardProvince(this.province, this.index);

  @override
  State<CardProvince> createState() => _CardProvinceState();
}

class _CardProvinceState extends State<CardProvince> {
  @override
  Widget build(BuildContext context) {
    Province prov = widget.province;
    int index = widget.index; // Ambil index yang diteruskan

    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 16),
        color: Colors.white,
        elevation: 4,
        child: ListTile(
            contentPadding: EdgeInsets.fromLTRB(16, 8, 8, 8),
            title: Text(prov.province.toString()),
            subtitle: Text("Province ID : ${prov.provinceId}"),
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 151, 205, 255),
              child: Text(
                (index + 1).toString(), // Penomoran berdasarkan index + 1
                style: TextStyle(color: Colors.black),
              ),
            ),
            // trailing:
            //     IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))));
            ));
  }
}
