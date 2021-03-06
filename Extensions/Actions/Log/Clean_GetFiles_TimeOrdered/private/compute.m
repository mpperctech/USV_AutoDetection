function [result, log] = compute(log, parameter, context)

% USV_CLEAN - compute

for i=1:length(log.event);
   data(i,1:2)=log.event(i).time(1:2);
   data(i,3:4)=log.event(i).freq(1:2);
end

newlog=[];
data(:,5)=0;
for i=1:length(data)
if data(i,5)==1
else
    currtime=data(i,1);
    currtime2=data(i,2);
    data(:,5)= ...
        data(:,1)>=currtime & data(:,1)<=currtime2|...
        data(:,2)>=currtime & data(:,2)<=currtime2|...
        data(:,1)<=currtime & data(:,2)>=currtime|...
        data(:,1)<=currtime2 & data(:,2)>=currtime2;
        
    tmp=data(data(:,5)==1,:);
    
    newlog(end+1,1)=min(tmp(:,1));
    newlog(end,2)=max(tmp(:,2));
    newlog(end,3)=min(tmp(:,3));
    newlog(end,4)=max(tmp(:,4));
    newlog(end,5)=i;
end
end

result=log;
[savename pathname]=uiputfile([result.path '*.mat']);
result.file=savename;

for i=1:length(newlog)
event(i).id=i;
event(i).tags=log.event(newlog(i,5)).tags;
event(i).rating=log.event(newlog(i,5)).rating;
event(i).notes=log.event(newlog(i,5)).notes;
event(i).score=log.event(newlog(i,5)).score;
event(i).channel=log.event(newlog(i,5)).channel;
event(i).time(1,1:2)=newlog(i,1:2);
event(i).freq(1,1:2)=newlog(i,3:4);
event(i).duration=newlog(i,2)-newlog(i,1);
event(i).bandwidth=newlog(i,4)-newlog(i,3);
event(i).samples=log.event(newlog(i,5)).samples;
event(i).rate=log.event(newlog(i,5)).rate;
event(i).level=log.event(newlog(i,5)).level;
event(i).children=log.event(newlog(i,5)).children;
event(i).parent=log.event(newlog(i,5)).parent;
event(i).author=log.event(newlog(i,5)).author;
event(i).created=log.event(newlog(i,5)).created;
event(i).modified=log.event(newlog(i,5)).modified;
event(i).userdata=log.event(newlog(i,5)).userdata;
event(i).detection=log.event(newlog(i,5)).detection;
event(i).annotation=log.event(newlog(i,5)).annotation;
event(i).measurement=log.event(newlog(i,5)).measurement;
end


%% Second run

result.event=event;
result.length=length(event);
result.curr_id=1;
log=result;

data=[];
for i=1:length(log.event);
   data(i,1:2)=log.event(i).time(1:2);
   data(i,3:4)=log.event(i).freq(1:2);
end

newlog=[];
data(:,5)=0;
for i=length(data):-1:1;
if data(i,5)==1
else
    currtime=data(i,1);
    currtime2=data(i,2);
    data(:,5)=...
        data(:,1)>=currtime & data(:,1)<=currtime2|...
        data(:,2)>=currtime & data(:,2)<=currtime2|...
        data(:,1)<=currtime & data(:,2)>=currtime|...
        data(:,1)<=currtime2 & data(:,2)>=currtime2;
              
    tmp=data(data(:,5)==1,:);
    
    newlog(end+1,1)=min(tmp(:,1));
    newlog(end,2)=max(tmp(:,2));
    newlog(end,3)=min(tmp(:,3));
    newlog(end,4)=max(tmp(:,4));
    newlog(end,5)=i;
end
end

result=log;
clear event
for i=1:length(newlog)
event(i).id=i;
event(i).tags=log.event(newlog(i,5)).tags;
event(i).rating=log.event(newlog(i,5)).rating;
event(i).notes=log.event(newlog(i,5)).notes;
event(i).score=log.event(newlog(i,5)).score;
event(i).channel=log.event(newlog(i,5)).channel;
event(i).time(1,1:2)=newlog(i,1:2);
event(i).freq(1,1:2)=newlog(i,3:4);
event(i).duration=newlog(i,2)-newlog(i,1);
event(i).bandwidth=newlog(i,4)-newlog(i,3);
event(i).samples=log.event(newlog(i,5)).samples;
event(i).rate=log.event(newlog(i,5)).rate;
event(i).level=log.event(newlog(i,5)).level;
event(i).children=log.event(newlog(i,5)).children;
event(i).parent=log.event(newlog(i,5)).parent;
event(i).author=log.event(newlog(i,5)).author;
event(i).created=log.event(newlog(i,5)).created;
event(i).modified=log.event(newlog(i,5)).modified;
event(i).userdata=log.event(newlog(i,5)).userdata;
event(i).detection=log.event(newlog(i,5)).detection;
event(i).annotation=log.event(newlog(i,5)).annotation;
event(i).measurement=log.event(newlog(i,5)).measurement;
end


result.event=event;
result.length=length(event);
result.curr_id=1;

% GETFILES - compute

log = result;
x=0;

%Get Start Time and Duration for each File in Filestream
[starttime duration] = get_file_times(log.sound);

log.sound.time_stamp=[];log.sound.fileduration=[];
for cells_are_retarded = 1:length(log.sound.file)
    log.sound.time_stamp(cells_are_retarded) = starttime(cells_are_retarded);
    log.sound.fileduration(cells_are_retarded) = duration(cells_are_retarded);
end

for r=1:length(log.event)
    log.event(1,r).file = [];
    temp = log.event(1,r).time(1);
    I = find(temp > log.sound.time_stamp,1,'last');
    log.event(1,r).file = log.sound.file{I};
end

temp_event = log.event;
for q=1:length(log.event);
    log.event(q) = temp_event(end+1-q);
end

result = log;
log_save(result);
