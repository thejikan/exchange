import 'package:exchange/features/presentation/products/bloc/home_cubit.dart';
import 'package:exchange/features/presentation/products/home_skeleton.dart';
import 'package:exchange/features/service/detailsService.dart';
import 'package:exchange/icons/icons.dart';
import 'package:exchange/icons/icons_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeViewCubit>(
      create: (context) => HomeViewCubit(context.read<DetailsService>()),
      child: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  _HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeViewCubit, HomeViewState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.isLoading) {
          return const HomeSkeletonView();
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              'EXCHANGES',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            actions: [
              Center(
                child: Stack(
                  children: const [
                    Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.black,
                      size: 28,
                    ),
                    Positioned(
                      left: 17,
                      child: Icon(
                        Icons.circle,
                        color: Colors.yellow,
                        size: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.settings_outlined, color: Colors.black),
              ),
              const SizedBox(
                width: 12,
              ),
            ],
            backgroundColor: Colors.white,
          ),
          body: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: [
                    /// search
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0)),
                                ),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.search_sharp,
                                      size: 32.0,
                                    ),
                                    hintText: 'Search Cryptocurrency',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade200),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.filter_list,
                                        color: Colors.grey[400],
                                      ),
                                      const SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(
                                        'Filter',
                                        style: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// products above text
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        child: Row(
                          children: [
                            const Text(
                              'Cryptocurrency',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'NFT',
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// ad slider
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      sliver: SliverToBoxAdapter(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.green[100],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 32, 24, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          height: 50.0,
                                          width: 50.0,
                                          child:
                                              IconAtom(icon: IconsEnum.bitcoin),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.sliderData[0].nameId,
                                                style: const TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                state.sliderData[0].name,
                                                style: const TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '\$${_formatNumber(state.sliderData[0].amount)} USD',
                                          style: const TextStyle(
                                              color: Colors.black87,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          '+${_formatNumber(state.sliderData[0].percentage)}%',
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 80.0,
                                width: 700,
                                child: IconAtom(
                                  icon: IconsEnum.waves,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    /// products above text
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Top Cryptocurrencies',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'View All',
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// products
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 12.0),
                      sliver: SliverGrid.count(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 1,
                        childAspectRatio: 6,
                        children:
                            List.generate(state.currencyList.length, (index) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white10,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              // height: 160,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 50.0,
                                        width: 50.0,
                                        child: IconAtom(
                                            icon: state
                                                .currencyList[index].image),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  state.currencyList[index]
                                                      .nameId,
                                                  style: const TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: SizedBox(
                                                    height: 30.0,
                                                    width: 80.0,
                                                    child: IconAtom(
                                                        icon: state
                                                                .currencyList[
                                                                    index]
                                                                .isDrop
                                                            ? IconsEnum.decrese
                                                            : IconsEnum
                                                                .increase),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              state.currencyList[index].name,
                                              style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '\$${_formatNumber(state.currencyList[index].amount)} USD',
                                        style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '${state.currencyList[index].isDrop ? '-' : '+'}${_formatNumber(state.currencyList[index].percentage)}%',
                                        style: TextStyle(
                                            color:
                                                state.currencyList[index].isDrop
                                                    ? Colors.redAccent
                                                    : Colors.green,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 20.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  elevation: 8,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    // height: 160,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 30.0,
                                width: 30.0,
                                child: IconAtom(icon: IconsEnum.eShop),
                              ),
                              // SizedBox(
                              //     height: 30.0,
                              //     width: 30.0,
                              //   child: Image.asset("assets/logo.png",
                              //   height: 20, width: 20,),
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                  '€-\$hop',
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              // Icon(Icons.access_time_filled_outlined),
                              const SizedBox(
                                height: 30.0,
                                width: 30.0,
                                child: IconAtom(icon: IconsEnum.exchange),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                  'Exchange',
                                  style: TextStyle(
                                      color: Colors.grey[100], fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50.0,
                            width: 50.0,
                            child: IconAtom(icon: IconsEnum.metaverse),
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 30.0,
                                width: 30.0,
                                child: IconAtom(icon: IconsEnum.launchpads),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                  'Launchpads',
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 30.0,
                                width: 30.0,
                                child: IconAtom(icon: IconsEnum.wallet),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                  'Wallet',
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

String prettify(double d) =>
    d.toStringAsFixed(2).replaceFirst(RegExp(r'\.?0*$'), '');

String _formatNumber(double num) {
  String res = '';
  String data = prettify(num);
  List<String> splitData = data.split('.');

  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
  res = myFormat.format(double.parse(splitData[0]));
  if (splitData.length > 1) {
    res += '.';
    res += splitData[1];
  }
  return res;
}
