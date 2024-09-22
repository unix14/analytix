
import 'package:flutter/material.dart';

import '../funnels_manager/analytix_funnel.dart';
import '../funnels_manager/funnels.dart';
import '../funnels_manager/funnels_manager.dart';

class SimpleFunnelExampleScreen extends StatefulWidget {
  const SimpleFunnelExampleScreen({super.key});

  @override
  State<SimpleFunnelExampleScreen> createState() => _SimpleFunnelExampleScreenState();
}

class _SimpleFunnelExampleScreenState extends State<SimpleFunnelExampleScreen> {

  final PageController _pageController = PageController();

  @override
  void initState() {
    // Start tracking Funnel 2
    FunnelsManager().start(AnalytixFunnel(Funnels.funnel_2, shouldCountTime: true));

    // Start track Funnel 3
    FunnelsManager().start(AnalytixFunnel(Funnels.funnel_3, shouldCountTime: true));
    FunnelsManager().track(Funnels.funnel_3, "start");
    super.initState();
  }

  @override
  void dispose() {
    // finish the funnel if a user decides to leave the screen
    // before finishing the whole steps. This won't affect if the user finishes all steps
    FunnelsManager().finish(Funnels.funnel_2, "finish");
    FunnelsManager().finish(Funnels.funnel_3, "finish");

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Funnel Example'),
      ),
      body: Center(
        child: PageView.builder(
          itemCount: 4,
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var indexUserFriendly = index+1;
            return Column(
              children: [
                Center(
                child: ListTile(
                  title: Text('Page #$indexUserFriendly'),
                  onTap: () {
                    // start a new funnel if possible - to track how much time we stay at each screen
                    FunnelsManager().start(AnalytixFunnel(Funnels.funnel_3, shouldCountTime: true));
                    // Track the event
                    FunnelsManager().track(Funnels.funnel_3, "step_$indexUserFriendly");
                    FunnelsManager().finish(Funnels.funnel_3, "finish");


                    if(indexUserFriendly <4) {
                      // start a new funnel for the next screen
                      FunnelsManager().start(AnalytixFunnel(Funnels.funnel_3, shouldCountTime: true));
                      _pageController.animateToPage(indexUserFriendly, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
              ],
            );
          },
        )
      ),
    );
  }
}