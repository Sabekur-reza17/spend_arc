import 'package:flutter/material.dart';
import 'dart:math';

class ParticleBurst extends StatefulWidget {
  final Widget child;
  final bool trigger;

  const ParticleBurst({super.key, required this.child, required this.trigger});

  @override
  State<ParticleBurst> createState() => _ParticleBurstState();
}

class _ParticleBurstState extends State<ParticleBurst> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();
  late List<Particle> _particles;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _generateParticles();
  }

  void _generateParticles() {
    _particles = List.generate(20, (index) {
      return Particle(
        angle: _random.nextDouble() * 2 * pi,
        speed: _random.nextDouble() * 50 + 20,
        color: Colors.primaries[_random.nextInt(Colors.primaries.length)],
      );
    });
  }

  @override
  void didUpdateWidget(ParticleBurst oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.trigger && !oldWidget.trigger) {
      _generateParticles();
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        widget.child,
        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                if (!_controller.isAnimating) return const SizedBox();
                return CustomPaint(
                  painter: _ParticlePainter(_particles, _controller.value),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class Particle {
  final double angle;
  final double speed;
  final Color color;

  Particle({required this.angle, required this.speed, required this.color});
}

class _ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double progress;

  _ParticlePainter(this.particles, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    
    for (var particle in particles) {
      final paint = Paint()
        ..color = particle.color.withOpacity(1.0 - progress)
        ..style = PaintingStyle.fill;
        
      final distance = particle.speed * progress;
      final x = center.dx + distance * cos(particle.angle);
      final y = center.dy + distance * sin(particle.angle);
      
      canvas.drawCircle(Offset(x, y), 3 * (1.0 - progress), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
