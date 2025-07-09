SELECT PHLogger.name, User.email
FROM PHLogger, User, Thought, About, Member, Interest
WHERE PHLogger.phlid = User.phlid
AND PHLogger.phlid = Thought.phlid
AND Thought.phlid = About.phlid 
AND Thought.tnum = About.tnum
AND PHLogger.phlid = Member.phlid
AND About.iname = Member.iname
AND About.iname = Interest.iname
AND Interest.topic = 'exercise';
