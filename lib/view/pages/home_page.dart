part of 'pages.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    homeViewModel.getProvinceList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 151, 205, 255),
          title: Text(style: TextStyle(color: Colors.black), "Province List"),
          centerTitle: true),
      body: ChangeNotifierProvider<HomeViewModel>(
          create: (context) => homeViewModel,
          child: Consumer<HomeViewModel>(builder: (context, value, _) {
            switch (value.provinceList.status) {
              case Status.loading:
                return Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(color: Color.fromARGB(255, 151, 205, 255)));
              case Status.error:
                return Align(
                    alignment: Alignment.center,
                    child: Text(value.provinceList.message.toString()));
              case Status.completed:
                return ListView.builder(
                    itemCount: value.provinceList.data?.length,
                    itemBuilder: (context, index) {
                      return CardProvince(
                          value.provinceList.data!.elementAt(index), index);
                    });
              default:
            }
            return Container();
          })),
    );
  }
}
