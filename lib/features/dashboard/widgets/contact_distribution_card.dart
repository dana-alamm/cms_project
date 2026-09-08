import 'package:flutter/material.dart';

class ContactDistributionCard extends StatelessWidget {
  const ContactDistributionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color:Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color:Colors.black.withOpacity(0.02),
          blurRadius: 16,
            offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contact Distribution',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
        ),
        const SizedBox(height: 4,),
        const Text(
            'By industry',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF94A3B8),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    Text(
                      '1,248',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(width: 12,),
                    Text(
                      'contacts',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF94A3B8),
                      ),
                    )
                  ],
                )
              ),
              const SizedBox(height: 12,),
              Expanded(
                flex: 3,
                child: Column(
                  children:const [
                    _IndustryItem(
                      color: Color(0xffE30613), 
                      title: 'Technology', 
                      percentage: '34%',
                      ),
                      _IndustryItem(
                        color: Color(0xff18181B), 
                        title: 'Government', 
                        percentage: '22%',
                        ),
                        _IndustryItem(
                      color: Color(0xFFFCA5A5), 
                      title: 'Healthcare',
                      percentage: '16%',
                    ),
                    _IndustryItem(
                      color: Color(0xFF1E293B), 
                      title: 'Finance',
                      percentage: '13%',
                    ),
                    _IndustryItem(
                      color: Color(0xFFF87171), 
                      title: 'Education',
                      percentage: '9%',
                    ),
                    _IndustryItem(
                      color: Color(0xFFCBD5E1), 
                      title: 'Manufacturing',
                      percentage: '6%',
                    ),
                  ],
                )
              ),


            ],
          ),
          const SizedBox(height: 24),
          const Divider(color: Color(0xFFF1F5F9), thickness: 1),
          const SizedBox(height: 16),

          const Text(
            'By country',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF94A3B8),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16,),

const _CountryProgressItem(
  country: 'United States',
  value: 312,
  percentage: 0.90,
  ),
  const _CountryProgressItem(
            country: 'UAE',
            value: 241,
            percentage: 0.70,
          ),
          const _CountryProgressItem(
            country: 'Germany',
            value: 158,
            percentage: 0.46,
          ),
          const _CountryProgressItem(
            country: 'United Kingdom',
            value: 122,
            percentage: 0.36,
          ),
      ],
    ),
    );
  }
}
class _IndustryItem extends StatelessWidget {
  final Color color;
  final String title;
  final String percentage;
  const _IndustryItem({
    super.key, 
    required this.color, 
    required this.title, 
    required this.percentage
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8,),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF3F3F46),
                fontWeight: FontWeight.w500,
              ),
            ),
            
            ),
            Text(
            percentage,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFF18181B),
            ),
          ),
        ],
      ),

    );
  }
}
class _CountryProgressItem extends StatelessWidget {
  final String country;
  final int value;
  final double percentage;
  const _CountryProgressItem({
    super.key, 
    required this.country, 
    required this.value,
     required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 95,
            child: Text(
              country,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF334155),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 8,),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: percentage,
                minHeight: 7,
                backgroundColor: const Color(0xFFF1F5F9),
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFDC2626)),
              ),
            ),
            
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 32,
            child: Text(
              '$value',
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
          ),
        ],
      ),
      );
  }
}