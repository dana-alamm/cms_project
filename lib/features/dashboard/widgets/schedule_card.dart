import 'package:cms_project_app/features/dashboard/widgets/meeting_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleCard extends StatefulWidget {
  const ScheduleCard({super.key});

  @override
  State<ScheduleCard> createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> {
  late DateTime _selectedMonth;
  late DateTime _today;

  @override
  void initState(){
   super.initState();
   _today=DateTime.now();
   _selectedMonth=DateTime(_today.year,_today.month,1);
  }
  void _previousMounth(){
    setState(() {
      _selectedMonth=DateTime(_selectedMonth.year,_selectedMonth.month-1,1);

    });
  }
  void _nextMounth(){
    setState(() {
      _selectedMonth=DateTime(_selectedMonth.year,_selectedMonth.month+1,1);
    });
  }
  @override
  Widget build(BuildContext context) {
    final monthFormat=DateFormat('MMMM yyyy').format(_selectedMonth);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color:Colors.black.withOpacity(0.02),
          blurRadius: 16,
          offset: Offset(0, 4),

        ),
      ],
      
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    monthFormat,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color:Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 4,),
                  const Text(
                    '3 follow-ups scheduled this month',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  _buildArrowButton(Icons.chevron_left, _previousMounth),
                  const SizedBox(width: 8,),
                  _buildArrowButton(Icons.chevron_right, _nextMounth),
                ],

              )
            ],
          ),
          const SizedBox(height: 18,),

          _buildDynamicCalender(),
          const SizedBox(height: 24,),

          const Text(
            'Upcoming',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 14),

   const MeetingItem(
           initials: 'RD',
            name: 'René Dupont',
            description: 'Monthly check-in',
            time: '09:15',
    ),
    const MeetingItem(
            initials: 'PS',
            name: 'Priya Sharma',
            description: 'Integration call',
            time: '10:30',
          ),
          const MeetingItem(
            initials: 'TW',
            name: 'Tobias Werner',
            description: 'Co-marketing brief',
            time: '14:00',
          ),
          const SizedBox(height: 12),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: (){}, 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE30613),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: const Text(
                'View All',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
          )

        ],
      ),
    );
  }
  Widget _buildArrowButton(IconData icon,VoidCallback onTap){
    return Container(
   width: 40,
   height: 40,
   decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    //border: Border.all(color: const Color(0xFFE2E8F0)),
    border: Border.all(color: const Color(0xFFE2E8F0)),
   ),
   child: IconButton( 
    padding: EdgeInsets.zero,
   onPressed: onTap,
    icon: Icon(icon,size:20,color: const Color(0xFF64748B))),
    );
  }
  Widget _buildDynamicCalender(){
     const daysOfWeek = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
     final int daysInMonth = DateTime(_selectedMonth.year, _selectedMonth.month + 1, 0).day;

     final int firstWeekday = DateTime(_selectedMonth.year, _selectedMonth.month, 1).weekday % 7;
    final int totalCells = ((firstWeekday + daysInMonth) / 7).ceil() * 7;

    return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
     
       border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: daysOfWeek
            .map((day)=>Text(
              day,
              style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF94A3B8),
                      ),
            )).toList(),
          ),
          const SizedBox(height: 12,),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: totalCells,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1,), 
            itemBuilder: (context,index){
              final int dayNumber=index-firstWeekday+1;
              if (dayNumber < 1 || dayNumber > daysInMonth) {
                return const SizedBox.shrink();
              }
              final isCurrentToday = _today.year == _selectedMonth.year &&
                  _today.month == _selectedMonth.month &&
                  _today.day == dayNumber;

              return _buildCell(dayNumber, isCurrentToday);
            })
        ],
      ),
    );
  }
  Widget _buildCell(int dayNumber, bool isToday) {
    if (isToday) {
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE30613),
          borderRadius: BorderRadius.circular(14),
        ),
        alignment: Alignment.center,
        child: Text(
          '$dayNumber',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      );
    }

    return Center(
      child: Text(
        '$dayNumber',
        style: const TextStyle(
          color: Color(0xFF334155),
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }
}