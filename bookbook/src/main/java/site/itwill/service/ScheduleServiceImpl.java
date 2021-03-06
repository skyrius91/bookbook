package site.itwill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import site.itwill.dao.ScheduleDAO;
import site.itwill.dto.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	private ScheduleDAO scheduleDAO;

	@Transactional
	@Override
	public void addSchedule(Schedule schedule) {
		scheduleDAO.insertSchedule(schedule);
	}

	@Transactional
	@Override
	public void modifySchedule(Schedule schedule) {
		scheduleDAO.updateSchedule(schedule);		
	}
	
	@Transactional
	@Override
	public void removeSchedule(int id) {
		scheduleDAO.deleteSchedule(id);
	}

	@Override
	public Schedule getSchedule(int id) {
		return scheduleDAO.selectSchedule(id);
	}
	
	@Override
	public List<Schedule> getScheduleList() {
		return scheduleDAO.selectScheduleList();
	}
}
