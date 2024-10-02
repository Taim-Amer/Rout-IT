import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/features/roadmaps/presentation/view_models/video_player_cubit/video_player_cubit.dart';
import 'package:video_player/video_player.dart';

class SkillVideoItem extends StatefulWidget {
  const SkillVideoItem(
      {super.key, required this.videoTitle, required this.videoUrl});
  final String videoTitle;
  final String videoUrl;

  @override
  _SkillVideoItemState createState() => _SkillVideoItemState();
}

class _SkillVideoItemState extends State<SkillVideoItem> {
  bool _isMuted = false;
  bool _isFullScreen = false;
  String? _overlayMessage;
  Timer? _overlayTimer;

  @override
  void dispose() {
    BlocProvider.of<VideoPlayerCubit>(context).close();
    _overlayTimer?.cancel();
    super.dispose();
  }

  void _toggleMute(VideoPlayerCubit cubit) {
    setState(() {
      _isMuted = !_isMuted;
    });
    cubit.state.videoPlayerController.setVolume(_isMuted ? 0 : 1);
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });

    if (_isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }
  }

  void _skipForward(VideoPlayerCubit cubit) {
    final controller = cubit.state.videoPlayerController;
    final currentPosition = controller.value.position;
    final targetPosition = currentPosition + const Duration(seconds: 10);

    controller.seekTo(targetPosition);

    _showOverlayMessage(">> 10 seconds");
  }

  void _skipBackward(VideoPlayerCubit cubit) {
    final controller = cubit.state.videoPlayerController;
    final currentPosition = controller.value.position;
    final targetPosition = currentPosition - const Duration(seconds: 10);

    controller.seekTo(targetPosition);

    _showOverlayMessage("<< 10 seconds");
  }

  void _showOverlayMessage(String message) {
    setState(() {
      _overlayMessage = message;
    });

    _overlayTimer?.cancel();
    _overlayTimer = Timer(const Duration(seconds: 1), () {
      setState(() {
        _overlayMessage = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VideoPlayerCubit(widget.videoUrl)..initializeVideoPlayer(),
      child: Scaffold(
        appBar: _isFullScreen
            ? null
            : AppBar(
                title: Text(widget.videoTitle),
                leading: InkWell(
                  splashColor: AppColors.lightPrimaryColor,
                  highlightColor: AppColors.lightPrimaryColor,
                  focusColor: AppColors.lightPrimaryColor,
                  borderRadius: BorderRadius.circular(70),
                  onTap: () {
                    GoRouter.of(context).pop();
                    BlocProvider.of<VideoPlayerCubit>(context).close();
                  },
                  child: const Icon(
                    Iconsax.arrow_left_24,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
        body: BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
          builder: (context, state) {
            if (state.isControllerInitialized) {
              return Center(
                child: GestureDetector(
                  onTap: () {
                    // This can toggle controls visibility if needed
                  },
                  onDoubleTapDown: (details) {
                    final box = context.findRenderObject() as RenderBox?;
                    final localPosition =
                        box?.globalToLocal(details.globalPosition);
                    final screenWidth = MediaQuery.of(context).size.width;
                    final isLeftHalf = localPosition!.dx < screenWidth / 2;

                    if (isLeftHalf) {
                      _skipBackward(context.read<VideoPlayerCubit>());
                    } else {
                      _skipForward(context.read<VideoPlayerCubit>());
                    }
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio:
                            state.videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(state.videoPlayerController),
                      ),
                      if (_overlayMessage != null)
                        Positioned(
                          top: MediaQuery.of(context).size.height / 3,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              _overlayMessage!,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 24),
                            ),
                          ),
                        ),
                      Positioned(
                        bottom: 48,
                        left: 16,
                        child: IconButton(
                          icon: Icon(
                            state.videoPlayerController.value.isPlaying
                                ? Iconsax.pause
                                : Iconsax.play,
                            color: Colors.white,
                            size: 32,
                          ),
                          onPressed: () {
                            context.read<VideoPlayerCubit>().togglePlayPause();
                            setState(() {}); // Refresh UI
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 48,
                        right: 16,
                        child: IconButton(
                          icon: Icon(
                            _isFullScreen
                                ? Icons.fullscreen_exit
                                : Icons.fullscreen,
                            color: Colors.white,
                            size: 32,
                          ),
                          onPressed: _toggleFullScreen,
                        ),
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: IconButton(
                          icon: Icon(
                            _isMuted ? Icons.volume_off : Icons.volume_up,
                            color: Colors.white,
                            size: 32,
                          ),
                          onPressed: () =>
                              _toggleMute(context.read<VideoPlayerCubit>()),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            VideoProgressIndicator(
                              state.videoPlayerController,
                              allowScrubbing: true,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              colors: VideoProgressColors(
                                playedColor: Colors.redAccent,
                                backgroundColor: Colors.black26,
                                bufferedColor: Colors.white70,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _formatDuration(state
                                        .videoPlayerController.value.position),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    _formatDuration(state
                                        .videoPlayerController.value.duration),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
